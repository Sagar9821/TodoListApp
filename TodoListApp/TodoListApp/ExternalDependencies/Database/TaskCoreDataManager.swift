//
//  TaskCoreDataManager.swift
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

import Foundation
import CoreData

@objc public class TaskCoreDataManager : NSObject {
    
    static let shared = TaskCoreDataManager()
    private let privateMOC = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    private let mainQueueMO = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    public override init() {
        super.init()
        privateMOC.parent = persistentContainer.viewContext
        mainQueueMO.parent = persistentContainer.viewContext
    }
    // Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db_model_v1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Insert Operation
    @objc func insert(task: TodoItem,withCompletion completion: @escaping (Error?) -> Void) {
        privateMOC.performAndWait {
            let entity = TasksMO(context: privateMOC)
            entity.taskTitle = task.taskTitle as String
            entity.taskDescription = task.taskDescription as String
            entity.isCompleted = task.isTaskCompleted
            entity.createdAt = task.creationDate as Date
             privateMOC.insert(entity)
            synchronize()
            completion(nil)
        }
    }
    
    // MARK: - Delete Operation
    @objc  func deleteTask(task: TodoItem, withCompletion completion: @escaping (Error?) -> Void) {
        
        privateMOC.performAndWait {
            do {
                let object = try privateMOC.existingObject(with: task.uniqID)
                privateMOC.delete(object)
                synchronize()
                completion(nil)
            } catch {
                completion(error)
            }
        }
        
    }
    
    // MARK: - Update Operation
    @objc  func updatTask(task: TodoItem,withCompletion completion: @escaping (Error?) -> Void) {
        persistentContainer.performBackgroundTask { backgroundContext in
            do {
                if let object = try backgroundContext.existingObject(with: task.uniqID) as? TasksMO {
                    object.isCompleted = true
                }
                
                try backgroundContext.save()
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
    
    // MARK: - Fetch All Data
    @objc func fetchAllData() -> [TodoItem]{
        var arrayTask: [TodoItem] = [TodoItem]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            let object = try mainQueueMO.fetch(fetchRequest) as? [TasksMO] ?? []
            
            for task in object {
                arrayTask.append(TodoItem(managedObject: task))
            }
            
        } catch {
            print(error.localizedDescription)
        }
        return arrayTask
    }
    
    
    private func synchronize() {
        do {
            try self.privateMOC.save() // We call save on the private context, which moves all of the changes into the main queue context without blocking the main queue.
            self.persistentContainer.viewContext.performAndWait {
                do {
                    try self.persistentContainer.viewContext.save()
                } catch {
                    print("Could not synchonize data. \(error), \(error.localizedDescription)")
                }
            }
        } catch {
            print("Could not synchonize data. \(error), \(error.localizedDescription)")
        }
    }
}
