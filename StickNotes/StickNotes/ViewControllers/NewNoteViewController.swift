//
//  NewNoteViewController.swift
//  StickNotes
//
//  Created by Victor on 13.09.2024.
//

import UIKit

final class AddNoteViewController: UIViewController {
    var titleTextField = UITextField()
    var contentTextView = UITextView()
    
    var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleTextField)
        view.addSubview(contentTextView)
        view.addSubview(saveButton)
        // добавьте констрейнты для UI элементов
    }
    
    @objc func saveNote() {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard let content = contentTextView.text, !content.isEmpty else { return }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newNote = Note(context: context)
        newNote.title = title
        newNote.content = content
        newNote.date = Date()
        
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Failed to save note: \(error)")
        }
    }
}
