//
//  ListViewModel.swift
//  TodoListApp
//
//  Created by Musa Adıtepe on 7.08.2024.
//

import Foundation

class ListViewModel{
    
    var listArray = [List]()
    let coreDataHelper = CoreDataHelper()
    
    func fetcData(){
        
        listArray = coreDataHelper.fetchData() ?? [List]()
        
    }
    func saveData(title: String){
        coreDataHelper.saveData(title: title)
        
    }
    func deleteData(index: Int){
        coreDataHelper.deleteData(index: index)
    }
}
