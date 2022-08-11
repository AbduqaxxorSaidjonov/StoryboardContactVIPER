//
//  HttpManager.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol HttpManagerProtocol{
    func apiContactList(completion: @escaping ([Contact]) -> Void)
    func apiContactDelete(contact: Contact,completion: @escaping (Bool) -> Void)
    func apiContactCreate(contact: Contact,completion: @escaping (Bool) -> Void)
    func apiSingleContact(id: Int, completion: @escaping (Contact) -> Void)
    func apiContactUpdate(id: Int, contact: Contact, completion: @escaping (Bool) -> Void)
}

class HttpManager: HttpManagerProtocol{
   
    var viewController: EditViewController!
    
    func apiContactList(completion: @escaping ([Contact]) -> Void) {
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: {response in
            switch response.result{
            case .success:
                let contacts = try! JSONDecoder().decode([Contact].self, from: response.data!)
                completion(contacts)
            case let .failure(error):
                print(error)
                completion([Contact]())
            }
        })
    }
    
    func apiContactDelete(contact: Contact, completion: @escaping (Bool) -> Void) {
        AFHttp.del(url: AFHttp.API_CONTACT_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: {response in
            switch response.result{
            case .success:
                print(response.result)
                completion(true)
            case let .failure(error):
                print(error)
                completion(false)
            }
        })
    }
    
    
    func apiContactCreate(contact: Contact, completion: @escaping (Bool) -> Void) {
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: contact), handler: {response in
            switch response.result{
            case .success:
                print(response.result)
                completion(true)
            case let .failure(error):
                print(error)
                completion(false)
            }
        })
    
    }
    func apiSingleContact(id: Int, completion: @escaping (Contact) -> Void){
        
        AFHttp.get(url: AFHttp.API_CONTACT_SINGLE + String(id), params: AFHttp.paramsContactWith(id: id), handler: { response in
            switch response.result {
            case .success:
                let decode = try! JSONDecoder().decode(Contact.self, from: response.data!)
                completion(decode)
            case let .failure(error):
                print(error)
                completion(Contact())
            }
        })
    }
    
    func apiContactUpdate(id: Int, contact: Contact, completion: @escaping (Bool) -> Void) {
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + String(id), params: AFHttp.paramsContactUpdate(contact: contact)) { response in
            switch response.result {
            case .success:
                print("SUCCESS")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                completion(true)
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }
}
