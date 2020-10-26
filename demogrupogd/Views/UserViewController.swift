//
//  UserViewController.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import Foundation
import UIKit
import SVProgressHUD
import SDWebImage
class UserViewController : BaseViewController, UITextFieldDelegate{
    var listUser:[UserResponse]=[]
    let presenter = UserViewPresenter()
    @IBOutlet var tableView: UITableView!
    var searchActive : Bool = false
    @IBOutlet weak var searchBar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        //llamar servicio de lista
        presenter.crearListado()
        searchBar.delegate = self
    }
    static func instantiate() -> UserViewController {
        return UIStoryboard(name: "Main",
                            bundle: nil)
            .instantiateViewController(withIdentifier: "usersList")
            as! UserViewController
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(!(textField.text?.isEmpty ?? false)){
            presenter.crearListadoBuscar(nombre: textField.text ?? "")
            }
        else {
            presenter.crearListado()
        }
        self.tableView.reloadData()
        textField.resignFirstResponder()
            return true
        }
}
extension UserViewController: UserView {
    func verListaUsuario(usuario: [UserResponse]) {
        listUser = usuario
        tableView.reloadData()
    }
    
    func verListaUsuarioSearch(usuario: UserResponse) {
        listUser = []
        listUser.append(usuario)
        tableView.reloadData()
    }
    func verRepos(repos: [ReposResponse]) {
        
        let verRepos = ReposViewController.instantiate()
        verRepos.titulo = Constants.user
        verRepos.listRepos = repos
        self.navigationController?.pushViewController(verRepos, animated: false)
    }
}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listUser.count == 0 {
            tableView.setEmptyView(title: "You don't have any user.", message: "Check again.", ishidden: false)
        } else {
            tableView.setEmptyView(title: "", message: "", ishidden: true)
        }
        return listUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "cellUser", for: indexPath) as? UserCellView
        let user = listUser[indexPath.row]
        cell?.title?.text = user.login ?? ""
        cell?.subTile?.text = user.nodeID ?? "" + user.type!
        cell?.selectionStyle = .none
            cell?.logo?.sd_setImage(with: URL(string: user.avatarURL ?? ""), placeholderImage: nil, options: .allowInvalidSSLCertificates)
        cell?.logo?.roundedImage()
        return cell!
    }
    /// accion para  enlazar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = listUser[indexPath.row]
        Constants.user = user.login ?? ""
        presenter.reposListado()
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
