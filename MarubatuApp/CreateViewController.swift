//
//  CreateViewController.swift
//  MarubatuApp
//
//  Created by 西谷恭紀 on 2019/06/13.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    @IBOutlet var questionTextField: UITextField!
    var answerSelect: Bool!                 //真偽値を定義
    var questionData: [[String: Any]] = []  //問題と正解が格納される
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "mondai") != nil {
           questionData = UserDefaults.standard.object(forKey: "mondai") as! [[String : Any]]
        }
    }
    
     //アラート発報
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message , preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //○×ボタン
    //選択した答えの真偽を判定
    @IBAction func questionBool(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            answerSelect = false
            case 1:
            answerSelect = true
            default:
            break
        }
    }
    
    //問題を作成
    @IBAction func createQuestionButton(_ sender: UIButton) {
            
        if questionTextField.text == "" {
            showAlert(message: "問題が記入されていません")
        }else{
            var que = questionTextField.text!
            questionData.append(["question":que,"answer":answerSelect])
            UserDefaults.standard.set(questionData, forKey: "mondai")
            questionTextField.text = ""
        }
    }
    
    //問題を削除する
    @IBAction func deleteQuestionButtom(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "mondai")
        showAlert(message: "すべて削除しました")
    }


}
