//
//  NotesConfigurator.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//

import UIKit

class NotesConfigurator {
    
    static func configure(vc: NotesViewController) {
        //interactor
        let interactor = NotesInteractor()
        vc.interactor = interactor
        
        //presenter
        let presenter = NotesPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        
        //router
        let router = NotesRouter()
        vc.router = router
        router.viewController = vc
    }
}
