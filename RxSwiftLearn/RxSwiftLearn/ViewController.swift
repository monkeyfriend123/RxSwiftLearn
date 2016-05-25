//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/23.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    private let CellIdentity = "CellIdentity"
    
    @IBOutlet var tableView: UITableView!
    var dataList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RxSwift"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentity)
        
        self.dataList = ["Empty","Never","Just","Start With","CombineLatested","Zip","Concat","RxCocoa","Variable","CustomObservable","Pages","KVO"]
        
        self.reloadData()
        
    }
    
    
    func reloadData(){
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - TableViewDataSource
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentity)
        cell?.textLabel?.text = self.dataList![indexPath.row]
        return cell!
    }
    
    
    //MARK: - TableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = EmptyViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = NeverViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = JustViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = StartWithViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = CombineLatestViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = ZipViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = ConcatViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = RxCocoaViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = VariableViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = CustomObservableViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = PagesViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = KVOViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
        
    }
}

