//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var userManager = UserManager()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var shapeOneImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var shapeTwoImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "paws"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.doesnHaveAnAccount
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorBlue")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameInputField: APLabeledTextField = {
        return APLabeledTextField(title: Constants.nameLabelTitle, placeholder: Constants.nameTextFieldPlaceholder)
    }()
    
    private lazy var emailInputField: APLabeledTextField = {
        let inputField = APLabeledTextField(title: "Email", placeholder: "Escolha seu melhor email")
        inputField.textField.addTarget(self, action: #selector(txtFieldChanging(_:)), for: .editingChanged)
        inputField.textField.keyboardType = .emailAddress
        return inputField
    }()
    
    private lazy var phoneNumberInputField : APLabeledTextField = {
        let inputField = APLabeledTextField(title: "Telefone com DDD", placeholder: "Insira seu telefone/whatsapp")
        inputField.textField.keyboardType = .phonePad
        return inputField
    }()
    
    private lazy var passwordInputField: APLabeledTextField = {
        return APLabeledTextField(title: "Senha", placeholder: "Crie uma senha", isSecureEntry: true)
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameInputField, emailInputField, phoneNumberInputField, passwordInputField, signButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.UIConstants.stackSpacing
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var signButton: APButton = {
        let signButton = APButton(title: "Teste")
        signButton.isUserInteractionEnabled = true
        signButton.button.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        return signButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupScrollView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        contentView.addSubview(shapeOneImage)
        contentView.addSubview(registerLabel)
        contentView.addSubview(stack)
        contentView.addSubview(signButton)
        contentView.addSubview(shapeTwoImage)
    }
    
    private func setupScrollView() {
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.addSubview(contentView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            shapeTwoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            shapeTwoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            shapeOneImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            shapeOneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shapeOneImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            registerLabel.topAnchor.constraint(equalTo: shapeOneImage.bottomAnchor, constant: -120),
            registerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
            registerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            
            stack.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 32),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            signButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 32),
            signButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            signButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
        ])
    }
    
    @objc func signUpButton() {
        print("teste")
        guard let name = nameInputField.textField.text,
              let email = emailInputField.textField.text,
              let phoneNumber = phoneNumberInputField.textField.text,
              let password = passwordInputField.textField.text else { return }
        
        let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
        userManager.saveUser(userData: userData)
        
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @objc func txtFieldChanging(_ textField: UITextField) {
        guard let txt = textField.text else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            return
        }
        if txt.contains("@") {
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0.0
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        }
    }
}
