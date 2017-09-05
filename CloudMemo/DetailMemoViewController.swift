//
//  DetailMemoViewController.swift
//  CloudMemo
//
//  Created by 菅原勝也 on 2017/09/05.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit
import NCMB

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
    
}
