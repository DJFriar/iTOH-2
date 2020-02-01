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
       
    // MARK: - Core Data Saving support
    
    public func save() {
        
        if self.context.hasChanges {
            do {
                try self.context.save()
                print("In CoreData.stack.save()")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    // MARK: - Database setup
       
       public class func initialDbSetup() -> Void {
           
          
            let sampleBonusData = [
                BonusData(image: "2019tx6",
                          bonusName: "Something in Texas",
                          bonusCode: "TX6",
                          city: "Texarkana",
                          state: "TX"),
                BonusData(image: "2019ca1",
                          bonusName: "Something in California",
                          bonusCode: "CA1",
                          city: "Lompoc",
                          state: "CA"),
                BonusData(image: "2019ma3",
                          bonusName: "Something in Massachusetts",
                          bonusCode: "MA3",
                          city: "Walther",
                          state: "MA"),
                BonusData(image: "2019tx5",
                          bonusName: "Something else in Texas",
                          bonusCode: "TX5",
                          city: "Pecos",
                          state: "TX"),
                BonusData(image: "2019ca5",
                          bonusName: "Something else in California",
                          bonusCode: "CA5",
                          city: "San Diego",
                          state: "CA"),
                BonusData(image: "2019nv4",
                          bonusName: "Something in Nevada",
                          bonusCode: "NV4",
                          city: "Reno",
                          state: "NV"),
                BonusData(image: "2019fl7",
                          bonusName: "Something in Florida",
                          bonusCode: "FL7",
                          city: "St. Augustine",
                          state: "FL")
            ]


            if Bonus.count() == 0 {
                //for i in 0...4 {
                //    let _ = Bonus.createBonus(name: "Test \(i)", order: i)
                //}
                for (i,bonus) in sampleBonusData.enumerated() {
                    let _ = Bonus.createBonus(name: bonus.bonusName,order: i)
                }
            }
            
       }
       
}
