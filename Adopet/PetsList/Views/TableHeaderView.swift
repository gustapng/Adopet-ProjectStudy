//
//  TableHeaderView.swift
//  Adopet
//
//  Created by Giovanna Moeller on 20/02/24.
//

import UIKit

class TableHeaderView: UIView {
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá! Veja os amigos disponíveis para adoção!"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var shapeImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(shapeImage)
        addSubview(helloLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            shapeImage.topAnchor.constraint(equalTo: topAnchor),
            shapeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            shapeImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            helloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            helloLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}
