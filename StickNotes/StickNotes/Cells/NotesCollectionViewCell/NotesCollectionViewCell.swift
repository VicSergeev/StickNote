//
//  NotesCollectionViewCell.swift
//  StickNotes
//
//  Created by Victor on 10.09.2024.
//

import UIKit

final class NotesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NotesCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var folder: UILabel!
    
    func configure(with note: Note) {
        titleLabel.text = note.title
        descriptionLabel.text = note.content
        if let date = note.date {
            dateLabel.text = DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)
        }
    }
    
}
