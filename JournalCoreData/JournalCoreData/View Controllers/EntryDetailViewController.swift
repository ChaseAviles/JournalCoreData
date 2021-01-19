//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Johnathan Aviles on 1/18/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var entry: Entry?
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let bodyText = bodyTextView.text, !bodyText.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.update(entry: entry, title: title, bodyText: bodyText)
        } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
}
