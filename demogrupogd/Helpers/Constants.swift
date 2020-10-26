//
//  Constants.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/24/20.
//

import Foundation
import UIKit
enum Constants{
    static let baseUrl = "https://api.github.com/users"
    static var user = ""
    static let timeOut = 50.0
    static let errorGeneral = "error in"
    static var commandUrlSearch = "/" + user + ""
    static var commandUrl = "/" + user + "/repos/"
    static var colorPrimario = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    // 2 # F6F7FC
      static var colorFondo = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    // 3 # D1A758
    static var colorSecundario = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
}
