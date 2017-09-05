//
//  AddMemoViewController.swift
//  CloudMemo
//
//  Created by 菅原勝也 on 2017/09/05.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit
import NCMB

class AddMemoViewController: UIViewController {
    
    @IBOutlet var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        memoTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil {
                print(error)
            } else {
                let alertController = UIAlertController(title: "保存完了", message: "メモの保存が完了しました。メモ一覧に戻ります。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }

}
