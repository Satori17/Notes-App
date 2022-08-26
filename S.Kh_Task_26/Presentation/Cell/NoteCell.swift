//
//  NoteCell.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//

import UIKit

protocol AddFavoriteNoteDelegate: AnyObject {
    func addFavoriteNote(cell: NoteCell)
}

protocol RemoveFavoriteNoteDelegate: AnyObject {
    func removeFavoriteNote(cell: NoteCell)
}

class NoteCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    
    //MARK: - Vars
    
    weak var addDelegate: AddFavoriteNoteDelegate?
    weak var removeDelegate: RemoveFavoriteNoteDelegate?
    
    //MARK: - Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - IBAction
    
    @IBAction func addToFavoritesBtnPressed(_ sender: UIButton) {
        if sender.currentImage == UIImage(systemName: "star") {
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            addDelegate?.addFavoriteNote(cell: self)
        } else {
            sender.setImage(UIImage(systemName: "star"), for: .normal)
            removeDelegate?.removeFavoriteNote(cell: self)
        }
    }
    
    //MARK: - Methods
    func configure(with note: Note) {
        noteTitleLabel.text = note.title
        noteTextLabel.text = note.text
        note.isFavorite ? starBtn.setImage(UIImage(systemName: "star.fill"), for: .normal) : starBtn.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
}
