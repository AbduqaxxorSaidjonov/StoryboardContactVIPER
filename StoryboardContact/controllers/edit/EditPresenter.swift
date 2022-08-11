//
//  EditPresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol EditPresenterProtocol: EditRequestProtocol{
    func apiSingleContact(id: Int)
    func apiContactUpdate(id: Int, contact: Contact)
    
    func leftTapped()
}

class EditPresenter: EditPresenterProtocol{
    
    var interactor: EditInteractorProtocol!
    var routing: EditRoutingProtocol!
    
    var controller: BaseViewController!
    var viewController: EditViewController!
    
    func apiSingleContact(id: Int) {
        controller.showProgress()
        interactor.apiSingleContact(id: id)
    }
    
    func apiContactUpdate(id: Int, contact: Contact) {
        controller.showProgress()
        interactor.apiContactUpdate(id: id, contact: contact)
    }
    
    func leftTapped() {
        routing.lefTapped()
    }
}
