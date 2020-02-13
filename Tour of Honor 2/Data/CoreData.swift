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
        if Bonus.count() == 0 {
                 let url = URL(string: "https://focused-dijkstra-8bf0a6.netlify.com/bonuses.json")
                 let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                 guard let dataResponse = data,
                           error == nil else {
                           print(error?.localizedDescription ?? "Response Error")
                           return }
                     do{
                         let json = dataResponse

                         struct BonusEntry: Codable {
                            var sampleImage: String?
                            var bonusName: String
                            var bonusCode: String
                            var bonusCategory: String
                            var city: String
                            var state: String
                         }

                         let decoder = JSONDecoder()
                         let bonuses = try decoder.decode([BonusEntry].self, from: json)

                         print("The following bonuses are available:")
                        for (i,bonus) in bonuses.enumerated() {
                             print("\t\(bonus.bonusName) (\(bonus.bonusCode) )")
                             if let sampleImage = bonus.sampleImage {
                                 print("\t\t\(sampleImage)")
                             }
                            let _ = Bonus.createBonus(
                                  name: bonus.bonusName,
                                  code: bonus.bonusCode,
                                  city: bonus.city,
                                  state: bonus.state,
                                  category: bonus.bonusCategory,
                                  sampleImage: bonus.sampleImage ?? "",
                                  order: i
                            )
                         }
                         
                      } catch let parsingError {
                         print("Error", parsingError)
                    }
                        
                 }
             task.resume()
        }
                
                 


                 
                  
             }
       
}
