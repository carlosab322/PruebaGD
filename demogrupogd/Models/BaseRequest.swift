//
//  BaseRequest.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import Foundation
class BaseRequest: Encodable {
    var token: String?
    private enum CodingKeys: String, CodingKey {
    case token = "Token"
  }

}

class CryptoRequest: Encodable {
    var data: String?
}
