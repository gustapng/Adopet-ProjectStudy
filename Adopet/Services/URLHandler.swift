//
//  URLHandler.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 26/08/24.
//

import UIKit

class URLHandler {
    func openUrl(_ url: URL, 
                 options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
                 completionHandler completion: ((Bool) -> Void)? = nil)
    {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func canOpenUrl(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
