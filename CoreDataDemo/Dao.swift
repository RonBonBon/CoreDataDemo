//
//  Dao.swift
//  CoreDataDemo
//
//  Created by hackeru on 10 Heshvan 5778.
//  Copyright © 5778 com.arichafamily. All rights reserved.
//

import UIKit
import CoreData

fileprivate let instance: Dao = Dao()

class Dao{

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    //computed property:
    static var shared:Dao{
        get{
            return instance
        }
    }

    var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }

    func savePerson(firstName:String, lastName:String, age: Int) {
        //1) init an NSManagedObject
        //1.1) found out that we need NSEntityDescription
        //1.2) need a context.
        let desc = NSEntityDescription.entity(forEntityName: "Person", in: context)!
        let p = NSManagedObject(entity: desc, insertInto: context)
        //2) set some attributes...
        p.setValue(firstName, forKey: "firstName")
        p.setValue(lastName, forKey: "lastName")
        p.setValue(age, forKey: "age")
        //3) saveContext()
        saveContext()
    }
    
    func readPeople(){
        //NSFetchRequest
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")

        //context.fetch
        do{
            let people = try context.fetch(request)
            for p in people{
                print(p.value(forKey: "firstName") as! String)
            }
        }catch let e{
            print(e)
        }
    }
}
