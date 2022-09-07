//
//  ListViewController.swift
//  Todo
//
//  Created by 堀弘昌 on 2022/09/06.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    var titleArray = [String]()
    
    var contentArray = [String]()
    
    var dateArray = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
//        titleArray = ["1", "2"]
//
//        contentArray = ["a", "b"]
        
//        table.delegate = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = titleArray[indexPath.row]
        cell?.detailTextLabel?.text = dateArray[indexPath.row]
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           switch editingStyle {
           case .delete:
               titleArray.remove(at: indexPath.row)
               contentArray.remove(at: indexPath.row)
               dateArray.remove(at: indexPath.row)
               tableView.beginUpdates()
               tableView.deleteRows(at: [indexPath], with: .automatic)
               tableView.endUpdates()
           case .insert, .none:
               // NOP
               break
           }
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
