//
//  ViewController.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import UIKit

class ToDoListViewController: UIViewController {
    //created array to hold CoreData information
    var response = [UserResponse]()
    //created note used to add new notes
    @IBOutlet weak var addNoteButton: UIBarButtonItem!
    @IBOutlet weak var customTblView: UITableView!
        //created object context to manage/access to persistenContainer.
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveItems()
        addNoteButton.target = self
        addNoteButton.action = #selector(addNewNote)
        customTblView.estimatedRowHeight = UITableView.automaticDimension
       
    }
    //created function to instantiate UIAlertController.
    @objc func addNewNote(){
    
        let alert: UIAlertController = UIAlertController(title: "New Note", message: "Insert your new note", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak  self] _ in
            //check for text and textfield.
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            //created a text attribute for a instance of a managedObject
            self?.createItem(response: text)
        }))
        present(alert, animated: true)
    }

}



