//
//  EditViewController.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 19/7/22.
//

import UIKit

protocol EditRequestProtocol{
    func apiSingleContact(id: Int)
    func apiContactUpdate(id: Int, contact: Contact)
}

protocol EditResponseProtocol{
    func onCallContact(contact: Contact)
    func onEditContact(isEdited: Bool)
    
    func leftTapped()
}

class EditViewController: BaseViewController, EditResponseProtocol {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var buttonEdit: UIButton!
    var ContactId: String = "1"
    var presenter: EditRequestProtocol!
    var contact : Contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEdit.layer.cornerRadius = 15
        initNavigation()
        presenter?.apiSingleContact(id: Int(ContactId)!)
        configureViper()
    }

    func initViews(){
        DispatchQueue.main.async {
            self.nameTextField.text = self.contact.name!
            self.phoneTextField.text = self.contact.phone!
        }
    }
    
    func initNavigation(){
        title = "Edit Contact"
        let back = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
    }
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = EditPresenter()
        let routing = EditRouting()
        let interactor = EditInteractor()
        
        presenter.controller = self
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    
    func onCallContact(contact: Contact) {
        self.hideProgress()
        if contact != nil {
            self.contact = contact
            initViews()
        }else{
            // error message
        }
    }
    
    func onEditContact(isEdited: Bool) {
        self.hideProgress()
        if isEdited{
            self.dismiss(animated: false, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }else{
            // error message
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        presenter?.apiContactUpdate(id: Int(ContactId)!, contact:  Contact(name: nameTextField.text!, phone: phoneTextField.text!))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "edit"), object: nil)
    }
    
    @objc func leftTapped(){
        dismiss(animated: true, completion: nil)
    }
}
