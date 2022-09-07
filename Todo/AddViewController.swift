//
//  AddViewController.swift
//  Todo
//
//  Created by 堀弘昌 on 2022/09/06.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    
    var datePicker = UIDatePicker()
    let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurePicker()
        
    }
    
    @IBAction func saveTodo() {
        print(titleTextField.text!)
        let listVC = self.navigationController?.viewControllers[0] as! ListViewController
        listVC.titleArray.append(titleTextField.text!)
        listVC.contentArray.append(contentTextField.text!)
        listVC.dateArray.append(dateTextField.text!)
//        print(listVC.titleArray)
        listVC.table?.reloadData()
        self.navigationController?.popViewController(animated: true)
    }

    func configurePicker() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0,    width:view.frame.size.width, height: 50))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([spaceItem,doneItem], animated: true)
        formatter.dateFormat = "yyyy年 M月d日(EEE)"
//        dateTextField?.text = formatter.string(from: Date())
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField?.inputView = datePicker
        dateTextField?.inputAccessoryView = toolBar
    }
        
    @objc func doneDatePicker() {
        formatter.dateFormat = "yyyy年 M月d日(EEE)"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
