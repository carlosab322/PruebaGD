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
    //buscar
    static let usersGit = ServiceAction(action: Constants.commandUrlSearch, name: "user")
    static let repos = ServiceAction(action: Constants.commandUrl, name: "repos")
}

class ServiceAction {
    var action: String
    var name: String
    init(action: String,  name: String) {
        self.action = action
        self.name = name
    }
}
