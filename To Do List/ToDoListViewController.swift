//
//  ViewController.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var addNoteButton: UIBarButtonItem!
    @IBOutlet weak var customTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addNoteButton.target = self
        addNoteButton.action = #selector(addNewNote)
    }
    
    @objc func addNewNote(){
    
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "AddNoteViewController") as? AddNoteViewController else {return }
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = customTblView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {return UITableViewCell()}
        cell.noteText.text = "Example note"
        return cell
    }
    
    
    
}

