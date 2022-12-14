//
//  NotesPresenter.swift
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

protocol NotesPresentationLogic {
    func presentNotes(response: NoteModel.Response)
    func didFailPresentNotes(withError message: StorageManagerError)
}

class NotesPresenter {
    weak var viewController: NotesDisplayLogic?
    
}

extension NotesPresenter: NotesPresentationLogic {
    
    func presentNotes(response: NoteModel.Response) {
        viewController?.display(notes: response.notes)        
    }
    
    func didFailPresentNotes(withError message: StorageManagerError) {
        viewController?.didFailDisplayNotes(withError: message)
    }
    
}
