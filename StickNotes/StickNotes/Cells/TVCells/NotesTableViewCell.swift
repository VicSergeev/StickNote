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
        contentView.addSubview(notesCollectionView)
        
        let nib = UINib(nibName: "NotesCollectionViewCell", bundle: nil)
        notesCollectionView.register(nib, forCellWithReuseIdentifier: "NotesCollectionViewCell")
        
        notesCollectionView.frame = contentView.bounds
        
        notesCollectionView.register(NotesCollectionViewCell.self, forCellWithReuseIdentifier: NotesCollectionViewCell.identifier)
        
        notesCollectionView.dataSource = self
        notesCollectionView.delegate = self
    }
}

// MARK: - CollectionView delegate & dataSource
extension NotesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = notesCollectionView.dequeueReusableCell(withReuseIdentifier: "NotesCollectionViewCell", for: indexPath) as! NotesCollectionViewCell
        
        cell.backgroundColor = .red
        
        return cell
    }
    
    
}

// MARK: - CollectionView cell size
extension NotesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.bounds.width // Ширина коллекции
        let totalHeight = collectionView.bounds.height // Высота коллекции
        
        let numberOfItemsPerRow: CGFloat = 2 // Количество ячеек в строке
        let spacing: CGFloat = 1 // Отступ между ячейками

        // Вычисляем ширину ячейки
        let itemWidth = (totalWidth - (numberOfItemsPerRow - 1) * spacing) / numberOfItemsPerRow
        let itemHeight = itemWidth // Чтобы сделать ячейки квадратными

        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // Отступ между ячейками по горизонтали
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Отступ между ячейками по вертикали
    }


}
