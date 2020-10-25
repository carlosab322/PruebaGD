//
//  BaseResponse.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/24/20.
//

import Foundation
class BaseResponse: Decodable {
   
    var closeSession = false
    var requestData: Any?
    var rawResponse: Data?

      init() {
      
    }
    private enum CodingKeys: String, CodingKey {
        case msj = "Msj"

    }

    required init(from decoder: Decoder) throws {
        _ = try decoder.container(keyedBy: CodingKeys.self)
    }
}
