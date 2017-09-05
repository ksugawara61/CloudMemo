//
//  MemoViewController.swift
//  CloudMemo
//
//  Created by 菅原勝也 on 2017/09/05.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit
import NCMB

class MemoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memoArray = [NCMBObject]()
    @IBOutlet var memoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        memoTableView.dataSource = self
        memoTableView.delegate   = self
        
        loadMemo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memoArray[indexPath.row].object(forKey: "memo") as? String
        return cell
    }
    
    func loadMemo() {
        let query = NCMBQuery(className: "Memo")
        query?.findObjectsInBackground({ (result, error) in
            if error != nil {
                print(error)
            } else {
                self.memoArray = result as! [NCMBObject]
                self.memoTableView.reloadData()
            }
        })
    }

}
