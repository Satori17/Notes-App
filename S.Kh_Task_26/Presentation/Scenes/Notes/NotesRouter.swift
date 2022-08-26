//
//  NotesRouter.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NotesRoutingLogic {
    func routeToNoteDetails(with id: UUID?, isEditing: Bool)
}

class NotesRouter {
  weak var viewController: NotesViewController?
  
}

extension NotesRouter: NotesRoutingLogic {
    
    func routeToNoteDetails(with id: UUID? = nil, isEditing: Bool) {
        if let noteDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteDetailsViewController") as? NoteDetailsViewController {
            NoteDetailsConfigurator.configure(vc: noteDetailsVC)
            noteDetailsVC.noteID = id
            noteDetailsVC.isNoteEditing = isEditing
            viewController?.navigationController?.pushViewController(noteDetailsVC, animated: true)
        }
    }
    
}