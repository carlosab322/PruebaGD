//
//  UserViewPresenter.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import Foundation
import UIKit
class UserViewPresenter {
    var view: UserView?
    func attachView(view: UserView) {
        self.view = view
    }
    /// call list of user
    ///
    /// - Parameters:
    func crearListado() {
        self.view?.showWait("Obteniendo información de usuarios")
        DmServices.shared.userList(tipo: ServiceData.usersGeneral,
                                    success: { (response) in
            self.view?.dismissMsg()
            self.view?.verListaUsuario(usuario: response)
        }, fail: { (msj) in
               self.view?.showError(msj)
        }, finally: {
            //implementación para la finalización de la accion
        })
    }
    func crearListadoRepos() {
        self.view?.showWait("Obteniendo información de repositorios")
        DmServices.shared.userList(tipo: ServiceData.usersGit,
                                    success: { (response) in
            self.view?.dismissMsg()
            self.view?.verListaUsuario(usuario: response)
        }, fail: { (msj) in
               self.view?.showError(msj)
        }, finally: {
            //implementación para la finalización de la accion
        })
    }
}
protocol UserView: BaseView {
    func verListaUsuario(usuario:[UserResponse])
}

