//
//  PagesViewController.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/24.
//  Copyright © 2016年 js. All rights reserved.
//

import UIKit
import RxSwift


func requestFriendsList(page: Int) -> Observable<[User]>{
    return Observable<[User]>.create({ (observer) -> Disposable in
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            sleep(2)
            
            
            let users = [User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User(),User()]
            
            observer.onNext(users)
            observer.on(.Completed)
        })
        
        
        return NopDisposable.instance
    })
}

class PagesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    private let CellIdentity = "cell"
    private let pageVariable = Variable(0)
    private var isLoading = false
    
    private var dataList: Array<User> = {
        Array<User>()
    }()
    
    @IBOutlet var tableView: UITableView!
    
    
    deinit{
        print("分页页面释放")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "分页"
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentity)
        
        _ = self.tableView.rx_contentOffset.subscribeNext(
            {
                [weak self] (offset) in
                if !((self?.isLoading)!){
                    if offset.y + (self?.tableView.frame.height)! > (self?.tableView.contentSize.height)! + 60{
                        self?.pageVariable.value = (self?.pageVariable.value)! + 1
                    }
                }
               
            }
        )
        
        _ = self.pageVariable.asObservable().subscribeNext { (page) in
            self.isLoading = true
           
            _ = requestFriendsList(self.pageVariable.value).observeOn(MainScheduler.instance).subscribeNext({ (users) in
                self.dataList.appendContentsOf(users)
                self.tableView.reloadData()
                self.isLoading = false
            })
            
       
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - TableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentity)
        cell?.textLabel?.text = "Item \(indexPath.row)"
        return cell!
    }
    

}
