//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by Aaron Torres on 5/18/19.
//  Copyright © 2019 Aaron Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentGradeTF: UITextField!
    @IBOutlet weak var desiredGradeTF: UITextField!
    @IBOutlet weak var finalWeightTF: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var needLabel: UILabel!
    //connections to the UI layout I made ^
    
    
    //=========================================================================================
    func calculate(cG: Double, fW: Double, dG: Double) -> Double
    {
        let solution = ((dG - cG*((100.0 - fW)/100.0))/fW)*100.0
        
        return solution
    }
    //========================function I wrote to find the needed grade^=======================
    

    @IBAction func submitButtonAction(_ sender: Any)//What to do when the submit button is tapped
    {
        if ((currentGradeTF.text != "") && (finalWeightTF.text != "") && (desiredGradeTF.text != ""))
        {
            //checks to see if the TFs have something inside them^
            
            let currentGrade = Double(currentGradeTF.text!)
            let finalWeight = Double(finalWeightTF.text!)
            let desiredGrade = Double(desiredGradeTF.text!)
            //takes Strings from the TFs; turns them into doubles; puts them into constants^
            
            let need = calculate(cG: currentGrade!, fW: finalWeight!, dG: desiredGrade!)
            //call my function with the constants we made from the TFs and puts the answer in a constant called "need"^
            
            needLabel.text = "You will need a "+String(format: "%.2f", need)+"% on the final."
            //sets the label to a string that has what you need on the final^
            
            if (need > 100.0) //if the needed grade is impossible
            {
                self.view.backgroundColor = .red //changes bg color
            }
            else
            {
                self.view.backgroundColor = .green //changes bg color
                
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
