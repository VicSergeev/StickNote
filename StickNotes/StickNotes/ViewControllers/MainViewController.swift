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
        
        tableViewDelegatesSetup()
    }
    
    // MARK: - Delegates
    func tableViewDelegatesSetup() {
        tableView.delegate = self
        tableView.dataSource = self
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
        
    }
    
    
}
