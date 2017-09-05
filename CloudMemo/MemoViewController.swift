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
        
        // TableViewの不要な線を削除
        memoTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailMemo", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailMemo" {
            // 次のコントローラを取得
            let detailMemoViewController = segue.destination as! DetailMemoViewController
            
            let selectedIndex = memoTableView.indexPathForSelectedRow!
            detailMemoViewController.selectedMemo = memoArray[selectedIndex.row]
        }
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
