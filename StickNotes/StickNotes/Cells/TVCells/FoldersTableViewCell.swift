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
        
        contentView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
        }
    }
}
