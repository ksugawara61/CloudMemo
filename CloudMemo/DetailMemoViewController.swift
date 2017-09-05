//
//  DetailMemoViewController.swift
//  CloudMemo
//
//  Created by 菅原勝也 on 2017/09/05.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class DetailMemoViewController: UIViewController {
    
    var selectedMemo: NCMBObject!
    @IBOutlet var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = selectedMemo.object(forKey: "memo") as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update() {
        selectedMemo.setObject(memoTextView.text, forKey: "memo")
        selectedMemo.saveInBackground { (error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            } else {
                // 更新が成功
                let alertController = UIAlertController(title: "更新完了", message: "メモの更新が完了しました。メモ一覧に戻ります。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func delete() {
        selectedMemo.deleteInBackground { (error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            } else {
                // 削除が成功
                let alertController = UIAlertController(title: "削除完了", message: "メモの削除が完了しました。メモ一覧に戻ります。", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}
