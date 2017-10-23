//
//  AlertService.swift
//  RealmCRUD
//
//  Created by 123 on 23.10.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit

class AlertService {
    private init() {}
    
    static func addAlert(in vc: UIViewController,
                         completion: @escaping (String, Int?, String?) -> Void) {
        let alert = UIAlertController(title: "Add Line", message: nil, preferredStyle: .alert)
        alert.addTextField { (lineTF) in
            lineTF.placeholder = "Enter pick up line"
        }
        
        alert.addTextField { (scoreTF) in
            scoreTF.placeholder = "Enter score"
        }
        
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Enter email"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?[2].text
                else { return }
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            completion(line, score, email)
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
    static func updateAlert(in vc: UIViewController, pickUpLine: PickUpLine, completion: @escaping (String, Int?, String?) -> Void) {
        
        let alert = UIAlertController(title: "Update Line", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (lineTF) in
            lineTF.placeholder = "Enter pick up line"
            lineTF.text = pickUpLine.line.capitalized
        }
        
        alert.addTextField { (scoreTF) in
            scoreTF.placeholder = "Enter score"
            scoreTF.text = pickUpLine.scoreString()
        }
        
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Enter email"
            emailTF.text = pickUpLine.email
        }
        
        let action = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?[2].text
                else { return }
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            completion(line, score, email)
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
