import CoreData

class CoreData: NSObject {
    
    static let stack = CoreData()   // Singleton
    
    // MARK: - Core Data stack
   private lazy var persistentContainer: NSPersistentContainer = {
       
       let container = NSPersistentContainer(name: "Tour_of_Honor_2")
       container.loadPersistentStores(completionHandler: { (storeDescription, error) in
           if let nserror = error as NSError? {
               fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
           }
       })
       return container
   }()
   
   public var context: NSManagedObjectContext {
       
       get {
           return self.persistentContainer.viewContext
       }
   }
   
   lazy var backgroundContext: NSManagedObjectContext = {
       let newbackgroundContext = persistentContainer.newBackgroundContext()
       newbackgroundContext.automaticallyMergesChangesFromParent = true
       return newbackgroundContext
   }()
    
    // MARK: - Core Data Saving support
    public func save() {
        
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Database setup
    public class func initialDbSetup() -> Void {
        Bonus.updateData()
        print("Loaded \(Bonus.count()) bonuses.")
    }
}
