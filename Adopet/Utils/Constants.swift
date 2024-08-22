//
//  Constants.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 21/08/24.
//

import Foundation

enum Constants {
    static let doesnHaveAnAccount = "Ainda não tem cadastro? Então, antes de buscar seu melhor amigo, precisamos de alguns dados:"
    static let nameLabelTitle = "Nome"
    static let nameTextFieldPlaceholder = "Digite o seu nome completo"
    
    enum UIConstants {
        static let stackSpacing: CGFloat = 16.0
    }
    
    // MARK: Exemplos
    enum LayoutConstants {
        // Margens padrão
        static let standardMargin: CGFloat = 16.0
        static let largeMargin: CGFloat = 24.0
        
        // Alturas e larguras padrão
        static let buttonHeight: CGFloat = 44.0
        static let textFieldHeight: CGFloat = 36.0
        
        // Tamanhos de fonte padrão
        static let titleFontSize: CGFloat = 24.0
        static let bodyFontSize: CGFloat = 16.0
        
        // Espaçamentos entre elementos
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalSpacing: CGFloat = 12.0
        
        // Alturas de células de tabela padrão
        static let tableViewCellHeight: CGFloat = 64.0
        
        // Tamanhos de ícones
        static let smallIconSize: CGSize = CGSize(width: 24.0, height: 24.0)
        static let largeIconSize: CGSize = CGSize(width: 36.0, height: 36.0)
    }
}
