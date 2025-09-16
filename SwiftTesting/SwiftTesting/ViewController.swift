//
//  ViewController.swift
//  SwiftTesting
//
//  Created by ÖMER  on 16.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoList : [String] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        navigationItem.title = "To Do List"
        navigationItem.prompt = "Swift Testing"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Item", message: "Enter Your To Do Item", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter Item"
        }
        
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else {
                return
            }
            
            // insert ile en son eklenen en başa gelir , append tam tersi
            self.toDoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
                
        alert.addAction(okButton)
                
        self.present(alert, animated: true, completion: nil)
        
    }
    

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let toDoItem = toDoList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = toDoItem
        cell.contentConfiguration = content
        
        
        cell.contentView.backgroundColor = .systemGray6
        cell.selectionStyle = .none
        cell.separatorInset = .zero
        
        cell.contentView.layer.cornerRadius = 15
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

