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
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
