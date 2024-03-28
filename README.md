# TodoListApp
To-do list app using Objective-C + Swift for both language demonstartion 

## Requirements 
| Tool| Version |
|--|--|
| Xcode | 15.0 or later  |

## Architecture 
The project is builded with the Clean Architectural design pattern.

[![TodoListApp](https://github.com/Sagar9821/TodoListApp/actions/workflows/ios.yml/badge.svg)](https://github.com/Sagar9821/TodoListApp/actions/workflows/ios.yml)

## Structure
```
├── TodoListApp
│   ├── Application
│   │   ├── ToDoListAppDelegate.h
│   │   └── ToDoListAppDelegate.m
│   ├── Common
│   │   ├── Bridging-Header.h
│   │   ├── ReusableExtensions
│   │   ├── ValidationHelper.h
│   │   └── ValidationHelper.m
│   ├── CustomViews
│   │   └── TextField
│   ├── DependencyInjection
│   ├── Domain
│   │   ├── Entity
│   │   │   ├── TodoItem.h
│   │   │   └── TodoItem.m
│   │   ├── Repositories
│   │   │   ├── CoreDataTodoRepository.h
│   │   │   ├── CoreDataTodoRepository.m
│   │   │   └── TodoRepository.h
│   │   └── UseCases
│   │       ├── CreateTask
│   │       │   ├── CreateTaskInteractor.h
│   │       │   └── CreateTaskInteractor.m
│   │       └── TodoList
│   │           ├── TodoListInteractor.h
│   │           └── TodoListInteractor.m
│   ├── ExternalDependencies
│   │   ├── Database
│   │   │   ├── TaskCoreDataManager.swift
│   │   │   └── db_model_v1.xcdatamodeld
│   │   │       └── db_model_v1.xcdatamodel
│   │   │           └── contents
│   │   ├── Models
│   │   ├── TLObjectConfigurator.h
│   │   └── TLObjectConfigurator.m
│   ├── Info.plist
│   ├── Presentation
│   │   ├── CreateTask
│   │   │   ├── CreateTaskViewController.h
│   │   │   ├── CreateTaskViewController.m
│   │   │   └── CreateTaskViewController.xib
│   │   ├── TodoList
│   │   │   ├── TaskCell.h
│   │   │   ├── TaskCell.m
│   │   │   ├── TaskCell.xib
│   │   │   ├── TaskDateCell.h
│   │   │   ├── TaskDateCell.m
│   │   │   ├── TaskDateCell.xib
│   │   │   ├── TaskTableView.h
│   │   │   ├── TaskTableView.m
│   │   │   ├── TasksDatesCollectionView.h
│   │   │   ├── TasksDatesCollectionView.m
│   │   │   ├── TodoListViewController.h
│   │   │   ├── TodoListViewController.m
│   │   │   └── TodoListViewController.xib
│   │   ├── TodoRouter.h
│   │   └── TodoRouter.m
├── TodoListAppTests
│   └── TodoListAppTests.m
└── TodoListAppUITests
    ├── TodoListAppUITests.m
    └── TodoListAppUITestsLaunchTests.m
```

