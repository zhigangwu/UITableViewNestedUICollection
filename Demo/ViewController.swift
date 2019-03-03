//
//  ViewController.swift
//  Demo
//
//  Created by 吴志刚 on 2019/3/2.
//  Copyright © 2019 HJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SelectCollectionItemDelegate {
    
    var tabeleView = UITableView()
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tabeleView = UITableView(frame: CGRect(x: 0, y: 0,
                                                    width: self.view.bounds.width,
                                                    height: self.view.bounds.height))
        self.tabeleView.delegate = self
        self.tabeleView.dataSource = self
        self.tabeleView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tabeleView.register(CustomizeTableViewCell.self, forCellReuseIdentifier: "customize")
        self.view.addSubview(self.tabeleView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let collectioncell = tableView.dequeueReusableCell(withIdentifier: "customize", for: indexPath) as! CustomizeTableViewCell
            
            collectioncell.collectionDataArr = ["1","2","3","4","5","6","7","8"]
            collectioncell.delegate = self
            
            return collectioncell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "样式"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return (kScreenWidth - 25) / 4 * 3
        } else {
            return 44
        }
    }
    
    func selectCollectionItem(indexPath: IndexPath) {
        print(indexPath)
    }

}


