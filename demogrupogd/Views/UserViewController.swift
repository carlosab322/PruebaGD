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
class UserViewController : BaseViewController, UISearchBarDelegate{
    var listUser:[UserResponse]=[]
    let presenter = UserViewPresenter()
    @IBOutlet var tableView: UITableView!
    var searchActive : Bool = false
    @IBOutlet weak var searchBar: UISearchBar!
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
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchActive = true;
       }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
       }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

          
           self.tableView.reloadData()
       }
}
extension UserViewController: UserView {
    func verListaUsuario(usuario: [UserResponse]) {
        listUser = usuario
        tableView.reloadData()
    }
}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listUser.count == 0 {
        tableView.setEmptyView(title: "You don't have any user.", message: "Check again.")
        }
        return listUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "cellUser", for: indexPath) as? UserCellView
        let user = listUser[indexPath.row]
        cell?.title?.text = user.login
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
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
