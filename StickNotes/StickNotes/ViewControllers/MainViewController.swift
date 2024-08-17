//
//  ViewController.swift
//  StickNotes
//
//  Created by Victor on 16.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
    }
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
