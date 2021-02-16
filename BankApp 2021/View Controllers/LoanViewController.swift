//
//  LoanViewController.swift
//  BankApp 2021
//
//  Created by Сергей Медведев on 13.02.2021.
//

import UIKit

class LoanViewController: UIViewController {
    // Mark: - Outlets
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    @IBOutlet weak var nperTextField: UITextField!
    @IBOutlet weak var pvTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    
    // MARK: - Inherited Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMonthlyPaymentLabel()
    }
    
    // MARK: - Methods
    func updateMonthlyPaymentLabel() {
        monthlyPaymentLabel.text = nil
        
        guard let nper = Double(nperTextField.text ?? "") else { return }
        guard let pv = Double(pvTextField.text ?? "") else { return }
        guard let rate = Double(rateTextField.text ?? "") else { return }

        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate, nper: nper, pv: pv))
        
        let formatter = NumberFormatter()
        formatter.currencySymbol = "₽"
        formatter.numberStyle = .currency
        guard let monthlyPaymentText = formatter.string(from: NSNumber(value: monthlyPayment)) else { return }
        
        monthlyPaymentLabel.text = "Ежемесячный платеж: \(monthlyPaymentText)"
    }

    // MARK: Actions
    @IBAction func fieldEditingChanged(_ sender: UITextField) {
        updateMonthlyPaymentLabel()
    }
}
