//
//  ViewController.swift
//  Counter
//
//  Created by Dmitry Markovskiy on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var history: String = "История изменений:"
    var currentDate = Date()
    let dateFormatter = DateFormatter()
    
    
    

    @IBOutlet weak var changeHistoryTextView: UITextView!
    @IBAction func resetButtonDidTap(_ sender: Any) {
        count = 0
        counterLabel.text = String(count)
        let dateString = dateFormatter.string(from: currentDate)
        history = history + "\n" + "[\(dateString)]: " + "значение сброшено"
        changeHistoryTextView.text = history
    }
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterLabel.text = String(count)
            let dateString = dateFormatter.string(from: currentDate)
            history = history + "\n" + "[\(dateString)]: " + "значение изменено на -1"
            changeHistoryTextView.text = history
        } else {
            let dateString = dateFormatter.string(from: currentDate)
            history = history + "\n" + "[\(dateString)]: " + "попытка уменьшить значение счётчика ниже 0"
            changeHistoryTextView.text = history
        }
        
    }
    @IBAction func plusButtonDidTap(_ sender: Any) {
        count += 1
        counterLabel.text = String(count)
        let dateString = dateFormatter.string(from: currentDate)
        history = history + "\n" + "[\(dateString)]: " + "значение изменено на +1"
        changeHistoryTextView.text = history
    }


    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = String(count)
        plusButton.tintColor = UIColor.red
        resetButton.tintColor = UIColor.darkGray
        changeHistoryTextView.text = history
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        
    }


}

