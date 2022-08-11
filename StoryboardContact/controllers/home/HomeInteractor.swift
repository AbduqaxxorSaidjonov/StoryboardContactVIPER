//
//  HomeInteractor.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol HomeInteractorProtocol{
    func apiContactList()
    func apiContactDelete(contact: Contact)
}

class HomeInteractor: HomeInteractorProtocol{
    
    var manager: HttpManager!
    var response: HomeResponseProtocol!
    
    func apiContactList() {
        manager.apiContactList(completion: {(result) in
            self.response.onContactList(contacts: result)
        })
    }
    
    func apiContactDelete(contact: Contact) {
        manager.apiContactDelete(contact: contact, completion: { (result) in
            self.response.onContactDelete(isDeleted: result)
        })
    }
}

