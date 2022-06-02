//
//  AddNoteViewController.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var saveNewNote: UIButton!
    @IBOutlet weak var newNoteText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        saveNewNote.addTarget(self, action: #selector(popView), for: .touchUpInside)
    }
    
    @objc func popView(){
        navigationController?.popViewController(animated: true)
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
