//
//  Note.swift
//  StickNotes
//
//  Created by Victor on 17.08.2024.
//

import Foundation

struct Note {
    var title: String
    var textPreview: String
//    var bgColor ???
//    var tagFolder ???
    
}

struct Folder {
    var folderName: String
    var notes: [Note]
    var subFolders: [Folder]
    // ???
}
