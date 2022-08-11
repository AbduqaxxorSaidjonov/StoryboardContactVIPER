//
//  HomePresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol HomePresenterProtocol: HomeRequestProtocol{
    func apiContactList()
    func apiContactDelete(contact: Contact)
    
    func navigateCreateScreen()
    func navigateEditScreen()
}

class HomePresenter: HomePresenterProtocol{
    
    var interactor: HomeInteractorProtocol!
    var routing: HomeRoutingProtocol!
    
    var controller: BaseViewController!
    
    func apiContactList() {
        controller.showProgress()
        interactor.apiContactList()
    }
    
    func apiContactDelete(contact: Contact) {
        controller.showProgress()
        interactor.apiContactDelete(contact: contact)
    }
    
    func navigateCreateScreen() {
        routing.navigateCreateScreen()
    }
    
    func navigateEditScreen() {
        routing.navigateEditScreen()
    }
}
