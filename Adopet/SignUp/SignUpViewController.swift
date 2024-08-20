//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let db = DataManager()
    
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
        label.text = "Ainda não tem cadastro? Então, antes de buscar seu melhor amigo, precisamos de alguns dados:"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorBlue")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var nameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Digite seu nome completo"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private lazy var email: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var emailTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Escolha seu melhor email"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        txtField.addTarget(self, action: #selector(txtFieldChanging(_:)), for: .editingChanged)
        return txtField
    }()
    
    private lazy var telefone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefone com DDD"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var telefoneTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Insira seu telefone/whatsapp"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private lazy var password: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var passwordtxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Crie uma senha"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.isSecureTextEntry = true
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name, nameTxtField, email, emailTxtField, telefone, telefoneTxtField, password, passwordtxtField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var signButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupScrollView()
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
            
            nameTxtField.heightAnchor.constraint(equalToConstant: 48),
            telefoneTxtField.heightAnchor.constraint(equalToConstant: 48),
            emailTxtField.heightAnchor.constraint(equalToConstant: 48),
            passwordtxtField.heightAnchor.constraint(equalToConstant: 48),
            
            signButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            signButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            signButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 32),
            signButton.heightAnchor.constraint(equalToConstant: 48),
            signButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
    }
    
    @objc func signUpButton() {
        
        guard let name = nameTxtField.text,
              let email = emailTxtField.text,
              let phoneNumber = telefoneTxtField.text,
              let password = passwordtxtField.text else { return }
        
        let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
        db.saveUser(userData: userData)
        
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
