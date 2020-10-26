//
//  ReposViewController.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/26/20.
//

import Foundation
import  UIKit
class ReposViewController: BaseViewController{
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ret: UILabel!
    var titulo:String?
    var listRepos:[ReposResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ret.text = titulo
    }
    static func instantiate() -> ReposViewController {
        return UIStoryboard(name: "Main",
                            bundle: nil)
            .instantiateViewController(withIdentifier: "Repos")
            as! ReposViewController
    }
}
extension ReposViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listRepos.count == 0 {
            tableView.setEmptyView(title: "You don't have any repos.", message: "Check again.", ishidden: false)
        } else {
            tableView.setEmptyView(title: "", message: "", ishidden: true)
        }
        return listRepos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "Cell", for: indexPath) as? UserCellView
        let reposs = listRepos[indexPath.row]
        cell?.title?.text = reposs.fullName ?? ""
        cell?.subTile?.text = reposs.nodeID ?? "" 
        cell?.selectionStyle = .none
        return cell!
    }
    /// accion para  enlazar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repos = listRepos[indexPath.row]
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}

