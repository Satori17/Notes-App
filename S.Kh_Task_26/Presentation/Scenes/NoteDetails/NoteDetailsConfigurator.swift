//
//  NoteDetailsConfigurator.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//

import UIKit

class NoteDetailsConfigurator {
    
    static func configure(vc: NoteDetailsViewController) {
        //interactor
        let interactor = NoteDetailsInteractor()
        vc.interactor = interactor
        
        //presenter
        let presenter = NoteDetailsPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
    }
}
