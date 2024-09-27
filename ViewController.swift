//
//  ViewController.swift
//  Calculator
//
//  Created by İzem Özer on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum : String = ""
    var operation : String = ""
    var secondNum : String = ""
    var haveResult : Bool = false
    var resultNumber : String = ""
    var numAfterResult : String = ""
    
    @IBOutlet weak var numOnScreen: UILabel!
    @IBOutlet var calcButtons: [UIButton]!
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    @IBAction func subrtact(_ sender: Any) {
        operation = "-"
    }
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    @IBAction func division(_ sender: Any) {
        operation = "/"
    }
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperation())
        let numArray = resultNumber.components(separatedBy: ".")
        print(numArray)
        if numArray[1] == "0"{
            numOnScreen.text = numArray[0]
        }
        else {
            numOnScreen.text = resultNumber
        }
        numAfterResult = ""
    }
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
        }
        else if operation != "" && !haveResult{
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }

    @IBAction func clear(_ sender: Any) {
        firstNum = ""
        operation = ""
        secondNum = ""
        haveResult = false
        resultNumber = ""
        numAfterResult = ""
        numOnScreen.text = "0"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2;
            button.titleLabel?.font = UIFont(name: "System", size: 24)
        }
    }
    func doOperation() -> Double {
        if operation == "+"{
            if !haveResult{
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else{
                return Double(resultNumber)! + Double(resultNumber)!
            }
        }
    
        else if operation == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else{
                return Double(resultNumber)! - Double(resultNumber)!
            }
        }
            else if operation == "x" {
                   if !haveResult {
                    haveResult = true
                    return Double(firstNum)! * Double(secondNum)!
                }
                else{
                    return Double(resultNumber)! * Double(resultNumber)!
                }
    }
        else if operation == "/" {
               if !haveResult {
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else{
                return Double(resultNumber)! / Double(resultNumber)!
            }
      }
      return 0
    }
  }

