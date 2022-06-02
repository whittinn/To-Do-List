//
//  ViewController.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var response = [UserResponse]()
    @IBOutlet weak var addNoteButton: UIBarButtonItem!
    @IBOutlet weak var customTblView: UITableView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveItems()
        addNoteButton.target = self
        addNoteButton.action = #selector(addNewNote)
       
    }
    
    @objc func addNewNote(){
    
        let alert: UIAlertController = UIAlertController(title: "New Note", message: "Insert your new note", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak  self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            self?.createItem(response: text)
        }))
        present(alert, animated: true)
    }

}



