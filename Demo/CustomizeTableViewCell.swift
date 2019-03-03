//
//  CustomizeTableViewCell.swift
//  Demo
//
//  Created by 吴志刚 on 2019/3/2.
//  Copyright © 2019 HJ. All rights reserved.
//

import UIKit

class CustomizeTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    weak var delegate : SelectCollectionItemDelegate?
    
    var collectionDataArr = NSArray()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: (kScreenWidth - 25) / 4, height: (kScreenWidth - 25) / 4)
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: (kScreenWidth - 25) / 4 * 3), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(NestingCollectionViewCell.self, forCellWithReuseIdentifier: "Nesting")
        collectionView.delegate = self
        collectionView.dataSource = self;
        self.contentView.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Nesting", for: indexPath)
        
        cell.backgroundColor = UIColor.yellow
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate!.selectCollectionItem!(indexPath: indexPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

@objc protocol SelectCollectionItemDelegate {
    @objc optional func selectCollectionItem(indexPath : IndexPath)
}
