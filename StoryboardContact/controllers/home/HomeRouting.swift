//
//  HomeRouting.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol HomeRoutingProtocol{
    func navigateCreateScreen()
    func navigateEditScreen()
}

class HomeRouting: HomeRoutingProtocol{
    
    weak var viewController: HomeViewController!
    
    func navigateCreateScreen() {
        viewController.callCreateViewController()
    }
    
    func navigateEditScreen() {
        viewController.callEditViewController(contactId: viewController.postId)
    }
}
