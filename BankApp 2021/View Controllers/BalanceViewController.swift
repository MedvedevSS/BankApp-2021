//
//  BalanceViewController.swift
//  BankApp 2021
//
//  Created by Сергей Медведев on 10.02.2021.
//

import UIKit

class BalanceViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: - Properties
    var balance = 0 {
        didSet {
            balanceLabel.text = "\(balance) ₽"
        }
    }
    
    // MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBalance()
    }

    func updateBalance() {
        balance = Int.random(in: 0...1_000_000)
    }

}

