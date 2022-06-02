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
        // Do any additional setup after loading the view.
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

