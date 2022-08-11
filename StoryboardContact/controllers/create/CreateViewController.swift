//
//  CreateViewController.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 19/7/22.
//

import UIKit


protocol CreateRequestProtocol{
    func apiContactCreate(contact: Contact)
    
    func leftButton()
}

protocol CreateResponseProtocol{
    func onContactCreate(isCreated: Bool)
}

class CreateViewController: BaseViewController, CreateResponseProtocol{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        presenter?.apiContactCreate(contact: Contact(name: nameTextField.text!, phone: phoneTextField.text!))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    @IBOutlet weak var button1: UIButton!
    
    var presenter: CreateRequestProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    func initViews(){
        initNavigation()
        configureViper()
        button1.layer.cornerRadius = 15
    }
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = CreatePresenter()
        let interactor = CreateInteractor()
        let routing = CreateRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    func initNavigation(){
        title = "Add Contact"
        let back = UIImage(systemName: "chevron.backward")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
    }
    
    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    func onContactCreate(isCreated: Bool) {
        if isCreated {
            self.hideProgress()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
