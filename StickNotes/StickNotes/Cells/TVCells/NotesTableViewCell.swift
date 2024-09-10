//
//  NotesTableViewCell.swift
//  StickNotes
//
//  Created by Victor on 17.08.2024.
//

import UIKit
import SnapKit

// MARK: - notes collection view here
final class NotesTableViewCell: BaseTableViewCell {
    
    static let identifier = "NotesTableViewCell"
    
    private var notesCollectionView: UICollectionView = {
        // FlowLayout setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = false
        
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        setupCollectionView()
    }
}

extension NotesTableViewCell {
    
    func setupCollectionView() {
        // delegates
        notesCollectionView.dataSource = self
        notesCollectionView.delegate = self
        
        // add cv on view
        notesCollectionView.frame = contentView.bounds
    }
}

// MARK: - CollectionView delegate & dataSource
extension NotesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

// MARK: - CollectionView cell size
extension NotesTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
