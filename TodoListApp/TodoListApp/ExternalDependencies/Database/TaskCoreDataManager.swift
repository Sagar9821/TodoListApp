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
    private let privateMOC = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    
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
        do {
            let entity = TasksMO(context: persistentContainer.viewContext)
            entity.taskTitle = task.taskTitle as String
            entity.taskDescription = task.taskDescription as String
            entity.isCompleted = task.isTaskCompleted
            try persistentContainer.viewContext.save()
            
            DispatchQueue.main.async {
                completion(nil)
            }
        } catch {
            DispatchQueue.main.async {
                completion(error)
            }
        }
    }
    
    // MARK: - Delete Operation
    @objc  func deleteTask(task: TodoItem, withCompletion completion: @escaping (Error?) -> Void) {
        persistentContainer.performBackgroundTask { backgroundContext in
            do {
                let object = try backgroundContext.existingObject(with: task.uniqID)
                backgroundContext.delete(object)
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
            let object = try persistentContainer.viewContext.fetch(fetchRequest) as? [TasksMO] ?? []
            
            for task in object {
                arrayTask.append(TodoItem(managedObject: task))
            }
            
        } catch {
            print(error.localizedDescription)
        }
        return arrayTask
    }
}
