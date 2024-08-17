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
    }
    
    // MARK: - Select button objc method
    @objc func selectButtonTapped() {
        print("button tapped")
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
    
    // MARK: - TableView setup
    func tableViewConfig() {
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: Cells.searchTextFieldCell)
        tableView.register(FoldersTableViewCell.self, forCellReuseIdentifier: Cells.foldersCells)
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: Cells.notesCell)
        tableView.pin(to: view)
        tableView.contentInset = UIEdgeInsets.zero
        
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
            return 50
        case 1:
            return 40
        default:
            return 400
        }
        
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
            searchCell.backgroundColor = .red
            return searchCell
        case .folders:
            let foldersCell = tableView.dequeueReusableCell(withIdentifier: Cells.foldersCells, for: indexPath) as! FoldersTableViewCell
            foldersCell.backgroundColor = .blue
            return foldersCell
        case .notes:
            let notesCell = tableView.dequeueReusableCell(withIdentifier: Cells.notesCell, for: indexPath) as! NotesTableViewCell
            notesCell.backgroundColor = .green
            return notesCell
        }
        
    }
    
    
}
