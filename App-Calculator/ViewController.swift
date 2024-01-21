//
//  ViewController.swift
//  App-Calculator
//
//  Created by Ivette Fernandez on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorOperations: UILabel!
   
    @IBOutlet weak var calculatorResults: UILabel!
    
    
    var operations:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteAll()
        
    }
    
    func deleteAll()
    {
        operations = ""
        calculatorOperations.text = ""
        calculatorResults.text = ""
        
    }
    
    
    @IBAction func deleteAllTap(_ sender: Any) {
        deleteAll()
    }
    @IBAction func backTap(_ sender: Any) {
        if (!operations.isEmpty)
        {
            operations.removeLast()
            calculatorOperations.text = operations
        }
    }
    
    func addOperations(value:String){
       operations = operations + value
        calculatorOperations.text = operations
    }
    @IBAction func percentageTap(_ sender: Any) {
        addOperations(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addOperations(value: "/")
    }
    @IBAction func multiplierTap(_ sender: Any) {
        addOperations(value: "*")
    }
    @IBAction func subtractionTap(_ sender: Any) {
        addOperations(value: "-")
    }
    @IBAction func additionTap(_ sender: Any) {
        addOperations(value: "+")
    }
    @IBAction func equalsTap(_ sender: Any) {
        if (validation()){
            let checkedOperationsPercent = operations.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedOperationsPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultFormat = formatResult(result: result)
            calculatorResults.text = resultFormat
        }
        else {
            let alert = UIAlertController(
            title: "invalid Imput",
            message: "CCalculator unable to do operations based on input",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func validation() -> Bool
    {
        var count = 0
        var funcIndexes =  [Int]()
        
        for char in operations
           {
            if(specialChar(char: char))
            {
                funcIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcIndexes
        {
            if(index == 0)
            {
                return false
            }
            if(index == operations.count - 1)
            {
                return false
            }
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous =  index
        }
        return true
    }
    func specialChar (char: Character) -> Bool{
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
    }
    
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0 )
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addOperations(value: "0")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addOperations(value: ".")
    }
    
    @IBAction func nunOneTap(_ sender: Any) {
        addOperations(value: "1")
    }
    @IBAction func nunTwoTap(_ sender: Any) {
        addOperations(value: "2")
    }
    @IBAction func nunThreeTap(_ sender: Any) {
        addOperations(value: "3")
    }
    @IBAction func nunFourTap(_ sender: Any) {
        addOperations(value: "4")
    }
    @IBAction func nunFiveTap(_ sender: Any) {
        addOperations(value: "5")
    }
    @IBAction func nunSixTap(_ sender: Any) {
        addOperations(value: "6")
    }
    
    @IBAction func nunSevenTap(_ sender: Any) {
        addOperations(value: "7")
    }
    
    @IBAction func nunEightTap(_ sender: Any) {
        addOperations(value: "8")
    }
    @IBAction func nunNineTap(_ sender: Any) {
        addOperations(value: "9")
    }
    
}

