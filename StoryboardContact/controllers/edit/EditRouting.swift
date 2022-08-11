//
//  EditRouting.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 11/8/22.
//

import Foundation

protocol EditRoutingProtocol{
    func lefTapped()
}

class EditRouting: EditRoutingProtocol{
    
    var viewController: EditViewController!
    
    func lefTapped() {
        viewController.leftTapped()
    }
}
