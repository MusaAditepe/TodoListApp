//
//  ListVC.swift
//  TodoListApp
//
//  Created by Musa Adıtepe on 7.08.2024.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    fileprivate func updateTableView(){
        viewModel.fetcData()
        table.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // show alert
        alertWithTextField(with: "Add Item",
                                  "",
                                 "Add", "Cancel",
                           "Enter here") {text in
            // save data to database, update list
            if !text.isEmpty{
                self.viewModel.saveData(title: text)
                self.table.reloadData()
            }
        }
        
    }
    
}
extension ListVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       viewModel.listArray.count
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
    }
}

extension ListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }
    }
}
