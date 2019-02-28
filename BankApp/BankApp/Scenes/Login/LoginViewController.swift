//
//  LoginViewController.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDisplayLogic: BaseView {
    func onLoginSuccess()
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (LoginRouterLogic & AccountDataPassing)?
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super .viewDidLoad()
        setup()
    }
    
    private func setup(){
        let vc = self
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        router.view = vc
        router.dataStore = interactor
        
    }
    
    func onLoginSuccess() {
        router?.openEntriesScene()
    }
    
    

}








