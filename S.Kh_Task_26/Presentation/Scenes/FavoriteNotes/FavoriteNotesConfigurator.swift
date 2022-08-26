//
//  FavoriteNotesConfigurator.swift
//  S.Kh_Task_26
//
//  Created by Saba Khitaridze on 25.08.22.
//

import UIKit

class FavoriteNotesConfigurator {
    
    static func configure(vc: FavoriteNotesViewController) {
        //interactor
        let interactor = FavoriteNotesInteractor()
        vc.interactor = interactor
        
        //presenter
        let presenter = FavoriteNotesPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        
        //router
        let router = FavoriteNotesRouter()
        vc.router = router
        router.viewController = vc
    }
}
