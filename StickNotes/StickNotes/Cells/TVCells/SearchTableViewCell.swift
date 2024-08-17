//
//  SearchTableViewCell.swift
//  StickNotes
//
//  Created by Victor on 17.08.2024.
//

import UIKit
import SnapKit

final class SearchTableViewCell: BaseTableViewCell {
    
    lazy var searchField: UISearchTextField = {
        let searchTextFiled = UISearchTextField()
        searchTextFiled.translatesAutoresizingMaskIntoConstraints = false
        return searchTextFiled
    }()
    
    override func setupViews() {
        super.setupViews()
        
        contentView.addSubview(searchField)
        
        searchField.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
        }
    }
}
