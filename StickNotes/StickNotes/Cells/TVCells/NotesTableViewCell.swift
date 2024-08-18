//
//  NotesTableViewCell.swift
//  StickNotes
//
//  Created by Victor on 17.08.2024.
//

import UIKit
import SnapKit

final class NotesTableViewCell: BaseTableViewCell {
    
    static let identifier = "NotesTableViewCell"
    
    override func setupViews() {
        super.setupViews()
        
        contentView.backgroundColor = .cyan
        
//        NSLayoutConstraint.activate([
//            contentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            contentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            contentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
