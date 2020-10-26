//
//  ServiceAction.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/24/20.
//

struct ServiceData: RawRepresentable {

    let rawValue: ServiceAction
    //user
    static let usersGeneral = ServiceAction(action: "", name: "user")
    static let usersGit = ServiceAction(action: Constants.commandUrl, name: "user")
}

class ServiceAction {
    var action: String
    var name: String
    init(action: String,  name: String) {
        self.action = action
        self.name = name
    }
}
