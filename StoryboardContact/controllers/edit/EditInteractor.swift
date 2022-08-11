//
//  EditInteractor.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol EditInteractorProtocol{
    func apiSingleContact(id: Int)
    func apiContactUpdate(id: Int,contact: Contact)
}

class EditInteractor: EditInteractorProtocol{
    
    var manager: HttpManager!
    var response: EditResponseProtocol!
    
    func apiSingleContact(id: Int) {
        manager.apiSingleContact(id: id){contact in
            self.response.onCallContact(contact: contact)
        }
    }
    
    func apiContactUpdate(id: Int, contact: Contact) {
        manager.apiContactUpdate(id: id, contact: contact){result in
            self.response.onEditContact(isEdited: result)
            
        }
    }
}
