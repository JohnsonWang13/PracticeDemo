/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import CoreData

//將codegen改為class definition
//NSManagedObjectContext --- entity -- NSManagedObject -- (NSManagedObjectContext)
class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  //任何資料都要以NSManagedObject的方式寫入和讀出，entity可以視為class, attribute可視為property。
  //NSManagedObject可以視為class instance
  //NSManagedObject is a shape-shifter
  var people: [NSManagedObject] = []
  
  //Personn是指class name，也就是subclass of NSManagedObject。
  //不必與entity name相同
  let test = Personn()
  
  var managedContext : NSManagedObjectContext?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "The List"
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    //任何存取，都要先取得NSManagedObjectContext
    managedContext = appDelegate.persistentContainer.viewContext
    
    //讀取資料要透過NSFetchRequest，<>內放的是泛型，也就是取出的資料型別
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
    
    do {
      //從core data存取皆要透過NSManagedObjectContext
      //取出的形式為array
      people = try managedContext.fetch(fetchRequest)
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    
  }

  @IBAction func addName(_ sender: UIBarButtonItem) {

    let alert = UIAlertController(title: "New Name",
                                  message: "Add a new name",
                                  preferredStyle: .alert)

    let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in

      guard let textField = alert.textFields?.first,
        let nameToSave = textField.text else {
          return
      }

      self.save(name: nameToSave)
      self.tableView.reloadData()
    }

    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .default)

    alert.addTextField()

    alert.addAction(saveAction)
    alert.addAction(cancelAction)

    present(alert, animated: true)
  }

  func save(name: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    //任何存取，都要先取得NSManagedObjectContext
    let managedContext = appDelegate.persistentContainer.viewContext
    
    //NSEntityDescription可視為class。輸入EntityName，取出這個entity(class)。皆要透過NSManagedObjectContext
    let entity = NSEntityDescription.entity(forEntityName: "Person",
                                            in: managedContext)!
    
    
//    let managedObject = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedContext) //用insertNewObject，得到的是NSManagedObject
//    managedObject.setValue(name, forKey: "name")
    
    
    //NSManagedObject可視為class instance。輸入想要取得instance的entity(class)。皆要透過NSManagedObjectContext
    //此處的entity，視為想要想要實體化的class
    let person = NSManagedObject(entity: entity,
                                 insertInto: managedContext)
    
    //以kvo方式寫入NSManagedObject
    person.setValue(name, forKeyPath: "name")
    
    do {
      //從core data存取皆要透過NSManagedObjectContext
      try managedContext.save()
      people.append(person)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return people.count
  }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let person = people[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                             for: indexPath)
    //以kvo方式讀取NSManagedObject
    cell.textLabel?.text = person.value(forKeyPath: "name") as? String
    return cell
  }
}
