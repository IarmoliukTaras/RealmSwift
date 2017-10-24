//
//  ViewController.swift
//  RealmCRUD
//
//  Created by 123 on 23.10.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pickUpLines: Results<PickUpLine>!
    
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        self.pickUpLines = realm.objects(PickUpLine.self)
        self.notificationToken = realm.observe { (_, _) in
            self.tableView.reloadData()
        }
        
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            print(error ?? "no error finded")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    @IBAction func onAddTapped(_ sender: Any) {
        AlertService.addAlert(in: self) { (line, score, email) in
            let newPickUpLine = PickUpLine(line: line, score: score, email: email)
            RealmService.shared.create(newPickUpLine)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pickUpLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpLineCell") as? PickUpLineCell else { return UITableViewCell() }
        cell.configure(with: self.pickUpLines[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let pickUpline = self.pickUpLines[indexPath.row]
        AlertService.updateAlert(in: self, pickUpLine: pickUpline) { (line, score, email) in
            let dict: [String: Any?] = ["line": line,
                                        "score": score,
                                        "email": email]
            RealmService.shared.update(pickUpline, with: dict)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        print("delete")
        let pickUpline = self.pickUpLines[indexPath.row]
        RealmService.shared.delete(pickUpline)
    }
    
}

