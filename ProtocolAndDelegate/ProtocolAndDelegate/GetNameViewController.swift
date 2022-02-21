//
//  GetNameViewController.swift
//  ProtocolAndDelegate
//
//  Created by Amanda on 2022/2/20.
//

import UIKit

protocol sendFirstAndLastNameDelegate {
    func setFistAndLastName(firstName : String, lastName : String )
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : sendFirstAndLastNameDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        guard let first = firstName else{
            return
        }
        guard let last = lastName else{
            return
        }
        
        txtFirstName.text = first
        txtLastName.text = last 
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else{return}
        guard let last = txtLastName.text else {return}
        
        sendFirstAndLastNameDelegate?.setFistAndLastName(firstName : first, lastName : last )
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
