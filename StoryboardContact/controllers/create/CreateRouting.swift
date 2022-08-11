//
//  CreateRouting.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol CreateRoutingProtocol{
    func leftButton()
}

class CreateRouting: CreateRoutingProtocol{
    weak var viewController: CreateViewController!
    
    func leftButton() {
        viewController.leftTapped()
    }
    
}
