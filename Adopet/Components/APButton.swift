//
//  APButton.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 23/08/24.
//

import UIKit

class APButton: UIView {
    
    private var title: String
    
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private func setupView() {
        updateUI()
        addSubview()
        setupConstraints()
    }
    
    private func updateUI() {
        button.setTitle(title, for: .normal)
    }
    
    private func addSubview() {
        addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
}
