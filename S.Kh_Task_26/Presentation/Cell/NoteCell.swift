//
//  NoteCell.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//

import UIKit

protocol FavoriteNotesDelegate: AnyObject {
    func addFavoriteNote(cell: NoteCell)
    func removeFavoriteNote(cell: NoteCell)
}

class NoteCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    
    //MARK: - Vars
    
    weak var delegate: FavoriteNotesDelegate?
    
    //MARK: - Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - IBAction
    
    @IBAction func addToFavoritesBtnPressed(_ sender: UIButton) {
        if sender.currentImage == UIImage(systemName: "star") {
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            delegate?.addFavoriteNote(cell: self)
        } else {
            sender.setImage(UIImage(systemName: "star"), for: .normal)
            delegate?.removeFavoriteNote(cell: self)
        }
    }
    
    //MARK: - Methods
    func configure(with note: Note) {
        noteTitleLabel.text = note.title
        noteTextLabel.text = note.text
        note.isFavorite ? starBtn.setImage(UIImage(systemName: "star.fill"), for: .normal) : starBtn.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
}
