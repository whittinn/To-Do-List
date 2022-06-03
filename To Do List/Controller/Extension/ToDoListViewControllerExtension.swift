//
//  ToDoListViewControllerExtension.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import Foundation
import UIKit

//created extension to for readability and organization.
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //return count of saved instances managed objects
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let responseItem = response[indexPath.row]
        guard let cell = customTblView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {return UITableViewCell()}
        //set cell objects to entity attributes.
        cell.noteText.text = responseItem.note
        cell.dateLabel.text = responseItem.date?.convertToString()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customTblView.deselectRow(at: indexPath, animated: true)
        //Set managed object to index or each row.
        let responseItem = response[indexPath.row]
        //created a action sheet to handle update,delete,save actions using UIAlertActions.
        let sheet: UIAlertController = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { [weak self] _ in
            
            let alert: UIAlertController = UIAlertController(title: "Edit your note", message: nil, preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = responseItem.note
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self ] _ in
                //checked for text and textfield.
                guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                //updadte managed object.
                self?.updateItem(response: responseItem, newNote: text, newDate: Date())
            }))
            self?.present(alert, animated: true)
        }))
        //delete instanceof managed object
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.deleteItem(response: responseItem)
        }))
        present(sheet, animated: true)
    }
    //created function to manage changes on the managed context.
    func retriveItems(){
        
        do{
            //fetch changes from persistent store.
            response = try context.fetch(UserResponse.fetchRequest())
            DispatchQueue.main.async {
                self.customTblView.reloadData()
            }
        }catch let error{
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    
    func createItem(response:String){
        //created instance of mananged object
        let newNote = UserResponse(context: context)
        newNote.note = response
        newNote.date = Date()
        
        do{
            //save changes
            try context.save()
            retriveItems()
            
        }catch let error{
            print("Could not rertrive: \(error)")
        }
    }
    
    func deleteItem(response: UserResponse){
        //delete instance of managed object.
        context.delete(response)
       
        do{
            try context.save()
            retriveItems()
            
        }catch let error{
            print("The error is \(error.localizedDescription)")
        }
    }
    
    func updateItem(response: UserResponse, newNote: String, newDate: Date){
       //updated instance of managed object.
        response.note = newNote
        response.date = newDate
        
        do{
            try context.save()
            retriveItems()
        }catch let error{
            print("The error is : \(error.localizedDescription)")
        }
    }
    
}
