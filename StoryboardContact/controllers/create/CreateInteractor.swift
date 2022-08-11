//
//  CreateInteractor.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol CreateInteractorProtocol{
    func apiContactCreate(contact: Contact)
}

class CreateInteractor: CreateInteractorProtocol{
   
    var manager: HttpManagerProtocol!
    var response: CreateResponseProtocol!
    
    func apiContactCreate(contact: Contact) {
        manager.apiContactCreate(contact: contact, completion: {(result) in
            self.response.onContactCreate(isCreated: result)
        })
    }
    
}
