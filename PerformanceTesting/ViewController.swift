//
//  ViewController.swift
//  PerformanceTesting
//
//  Created by Peter de Tagyos on 1/18/20.
//  Copyright © 2020 Peter de Tagyos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        doneButton.isHidden = true
    }

    @IBAction func buttonTapped(_ sender: Any) {
        doneButton.isHidden = true
        let trace = PerformanceMeasurement.startTrace(with: "button")
        longRunningTask(delay: 1) {
            PerformanceMeasurement.endTrace(trace)
        }
    }

    private func initialSetup() {
        let trace = PerformanceMeasurement.startTrace(with: "setup")
        longRunningTask(delay: 2) {
            PerformanceMeasurement.endTrace(trace)
        }
    }
    
    func longRunningTask(delay: Double, _ completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.doneButton.isHidden = false
            completion()
        }
    }
}

