//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 26/08/24.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler = URLHandler()
    
    func openTelephoneUrl(phoneNumber: String) {
        if let telephoneUrl = URL(string: "tel://\(phoneNumber)") {
            urlHandler.openUrl(telephoneUrl)
        }
    }
    
    func openWhatsappUrl(phoneNumber: String, message: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
        if urlHandler.canOpenUrl(whatsappURL) {
            urlHandler.openUrl(whatsappURL)
        } else {
            openWhatsappInAppStore()
        }
    }
    
    func openWhatsappInAppStore() {
        guard let appStoreUrl = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
        urlHandler.openUrl(appStoreUrl)
    }
}
