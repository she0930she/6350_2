//
//  ViewController.swift
//  BMI
//
//  Created by Amanda on 2022/5/3.
//

import UIKit

class ViewController: UIViewController {

    
    //lbs
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtFeet: UITextField!
    
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var txtResult: UILabel!
    
    
    //kg
    @IBOutlet weak var txtKg: UITextField!
    
    
    @IBOutlet weak var txtCm: UITextField!
    
    
    @IBOutlet weak var txtResKg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateBMIAtion(_ sender: Any) {
        //Formula: weight (lb) / [height (in)]2 x 703
        let wt = Double(txtWeight.text!)!
        let feet = Double(txtFeet.text!)! * 12
        let inch = feet + Double(txtInches.text!)!
//        print(pow(inch,2))
        let res = (wt / pow(inch, 2)) * 703
        print(res)
        if res < 18.5 {
            txtResult.text = "BMI: Underweight"
        }else if (res >= 18.5 && res < 25) {
            txtResult.text = "BMI: Healthy weight"
        }else if (res >= 25 && res < 30){
            txtResult.text = "BMI: Overweight"
        }else{
            txtResult.text = "BMI: Obese"
        }
        //txtResult.text = "BMI: "
    }
    
    
    @IBAction func getBMIActionKG(_ sender: Any) {
        let kg = Double(txtKg.text!)!
        let m = Double(txtCm.text!)! / 100
        let res = kg / (pow(m,2))
        print(res)
        if res < 18.5 {
            txtResKg.text = "BMI: Underweight"
        }else if (res >= 18.5 && res < 25) {
            txtResKg.text = "BMI: Healthy weight"
        }else if (res >= 25 && res < 30){
            txtResKg.text = "BMI: Overweight"
        }else{
            txtResKg.text = "BMI: Obese"
        }
        
    }
    
    
    
    
}

