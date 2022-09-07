//
//  ListViewController.swift
//  Todo
//
//  Created by 堀弘昌 on 2022/09/06.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    var titleArray = [String]()
    
    var contentArray = [String]()
    
    var dateArray = [String]()
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        let memo: Memo? = read()
        
        
        
//        titleArray = ["1", "2"]
//
//        contentArray = ["a", "b"]
        
//        table.delegate = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Memo.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
//        cell?.textLabel?.text = titleArray[indexPath.row]
//        cell?.detailTextLabel?.text = dateArray[indexPath.row]
        
        
        let todoData = realm.objects(Memo.self)
//        print(todoData)
        
        cell?.textLabel?.text = todoData[indexPath.row].title
        cell?.detailTextLabel?.text = todoData[indexPath.row].date
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       switch editingStyle {
       case .delete:
//               titleArray.remove(at: indexPath.row)
//               contentArray.remove(at: indexPath.row)
//               dateArray.remove(at: indexPath.row)
           try! realm.write{
               realm.delete(realm.objects(Memo.self)[indexPath.row])
             }
           tableView.beginUpdates()
           tableView.deleteRows(at: [indexPath], with: .automatic)
           tableView.endUpdates()
       case .insert, .none:
           // NOP
           break
       }
   }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table?.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
