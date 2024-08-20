//
//  ViewController.swift
//  StickNotes
//
//  Created by Victor on 16.08.2024.
//

import UIKit

final class MainViewController: UIViewController {
        
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        tableViewConfig()
        toolBarSetup()
    }
    
    
// MARK: - objc methods
    
    // MARK: - Select button objc method
    @objc func selectButtonTapped() {
        print("button tapped")
    }
    
    // MARK: - toolbar selectors
    @objc func addFolderTapped() {
        // Действие при нажатии на кнопку добавления папки
        print("Add Folder Tapped")
    }

    @objc func addNoteTapped() {
        // Действие при нажатии на кнопку добавления заметки
        print("Add Note Tapped")
    }


}

// MARK: - Extensions
extension MainViewController {
    // MARK: - NavBar setup
    func setNavBar() {
        title = "StickNote"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        view.backgroundColor = .launchBG
    }
    
    // MARK: - Toolbar setup
    
    func toolBarSetup() {
        // Создаем Toolbar
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbar)
        
        // Создаем элементы Toolbar
        let addFolderButton = UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .plain, target: self, action: #selector(addFolderTapped))
        
        // MARK: - notes indicator amount dependency
        let notesCountLabel = UILabel()
        notesCountLabel.text = "3 notes"
        notesCountLabel.sizeToFit()
        let notesCountItem = UIBarButtonItem(customView: notesCountLabel)
        
        let addNoteButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(addNoteTapped))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // Добавляем элементы в Toolbar
        toolbar.items = [addFolderButton, flexibleSpace, notesCountItem, flexibleSpace, addNoteButton]
        
        // Устанавливаем Constraints
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - TableView setup
    func tableViewConfig() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: Cells.searchTextFieldCell)
        tableView.register(FoldersTableViewCell.self, forCellReuseIdentifier: Cells.foldersCells)
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: Cells.notesCell)
        tableView.pin(to: view)
        tableView.contentInset = UIEdgeInsets.zero
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableViewDelegatesSetup()
    }
    
    // MARK: - Delegates
    func tableViewDelegatesSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    struct Cells {
        static let searchTextFieldCell = "SearchTableViewCell"
        static let foldersCells = "FoldersTableViewCell"
        static let notesCell = "NotesTableViewCell"
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Sections creation
    enum TableViewSections: Int, CaseIterable {
        case searchField, folders, notes
    }
    
    // Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 50
        case 2:
            // Высота третьей ячейки
            let totalHeight = tableView.frame.height
            let topPadding = tableView.safeAreaInsets.top
            let bottomPadding = tableView.safeAreaInsets.bottom
            
            // Рассчитываем высоту остальных элементов
            let firstCellHeight = self.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
            let secondCellHeight = self.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 1))
            let heightOfOtherContent = topPadding + bottomPadding + firstCellHeight + secondCellHeight
            
            // Высота третьей ячейки
            let thirdCellHeight = totalHeight - heightOfOtherContent
            return thirdCellHeight > 0 ? thirdCellHeight : 0
        default:
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    // MARK: - Required protocols methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableViewSections = TableViewSections(rawValue: section) else {
            return 0
        }
        
        // 🤨 is that nescessery?
        switch tableViewSections {
        case .searchField:
            return 1
        case .folders:
            return 1
        case .notes:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewSections = TableViewSections(rawValue: indexPath.section)!
        
        switch tableViewSections {
        case .searchField:
            let searchCell = tableView.dequeueReusableCell(withIdentifier: Cells.searchTextFieldCell, for: indexPath) as! SearchTableViewCell
//            searchCell.backgroundColor = .red
            return searchCell
        case .folders:
            let foldersCell = tableView.dequeueReusableCell(withIdentifier: Cells.foldersCells, for: indexPath) as! FoldersTableViewCell
//            foldersCell.backgroundColor = .blue
            return foldersCell
        case .notes:
            let notesCell = tableView.dequeueReusableCell(withIdentifier: Cells.notesCell, for: indexPath) as! NotesTableViewCell
//            notesCell.backgroundColor = .green
            return notesCell
        }
        
    }
    
    
}
