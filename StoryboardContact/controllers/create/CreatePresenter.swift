//
//  CreatePresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol CreatePresenterProtocol: CreateRequestProtocol{
    func apiContactCreate(contact: Contact)
    
    func leftButton()
}

class CreatePresenter: CreatePresenterProtocol{
    
    var interactor: CreateInteractorProtocol!
    var routing: CreateRoutingProtocol!

    var controller: BaseViewController!

    func apiContactCreate(contact: Contact) {
        controller.showProgress()
        interactor.apiContactCreate(contact: contact)
    }

    func leftButton() {
        routing.leftButton()
    }
    
}
