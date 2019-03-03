//
//  NestingCollectionViewCell.swift
//  Demo
//
//  Created by 吴志刚 on 2019/3/2.
//  Copyright © 2019 HJ. All rights reserved.
//

import UIKit

class NestingCollectionViewCell: UICollectionViewCell {
    
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height

    
    var iconImageV = UIImageView()
    var titleLab = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageV = UIImageView(frame: CGRect(x: 4, y: 4,
                                               width: (kScreenWidth - 25) / 4 - 8 ,
                                               height: (kScreenWidth - 25) / 4 - 8 ))
        
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        
        iconImageV.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        self.contentView.addSubview(iconImageV)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
