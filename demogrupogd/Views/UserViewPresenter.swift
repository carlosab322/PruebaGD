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
    func reposListado() {
        self.view?.showWait("Obteniendo información de repos")
        DmServices.shared.reposList(tipo: ServiceData.repos,
                                    success: { (response) in
            self.view?.dismissMsg()
            self.view?.verRepos(repos: response)
        }, fail: { (msj) in
               self.view?.showError(msj)
        }, finally: {
            //implementación para la finalización de la accion
        })
    }
    func crearListadoBuscar(nombre: String) {
        Constants.user = nombre 
        Constants.commandUrlSearch =  "/" + Constants.user + ""
        self.view?.showWait("Obteniendo información de busqueda")
        DmServices.shared.user(tipo: Constants.commandUrlSearch,
                                    success: { (response) in
            self.view?.dismissMsg()
            self.view?.verListaUsuarioSearch(usuario: response)
        }, fail: { (msj) in
               self.view?.showError(msj)
        }, finally: {
            //implementación para la finalización de la accion
        })
    }
}
protocol UserView: BaseView {
    func verListaUsuario(usuario:[UserResponse])
    func verRepos(repos:[ReposResponse])

    func verListaUsuarioSearch(usuario:UserResponse)
}

