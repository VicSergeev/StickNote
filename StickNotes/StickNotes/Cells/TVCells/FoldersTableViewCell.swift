//
//  FoldersTableViewCell.swift
//  StickNotes
//
//  Created by Victor on 17.08.2024.
//

import UIKit

final class FoldersTableViewCell: BaseTableViewCell {
    
    static let identifier = "FoldersTableViewCell"
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = .lightGray
    }
}
