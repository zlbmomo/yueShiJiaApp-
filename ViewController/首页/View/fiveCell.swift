//
//  fiveCell.swift
//  yueShiJiaApp
//
//  Created by qianfeng on 16/9/22.
//  Copyright © 2016年 张连宝. All rights reserved.
//

import UIKit




/**
 1. fiveCell 能够显示detailCell,但是不能够创建cell,原因是没有数据
 
 
 
 
 2. FirstViewController 有能够创建 detailCell的数据，也能够创建cell
 
 
 
 
 3. 我们希望fiveCell 要显示具体的detailCell的时候，去找FirstViewController获取
 
 
 1> 每一行的collentionView中要显示侧item 个数
 
 
 2> 显示的具体的cell
 
 4.fiveCell 去获取数据或cell需要告诉 FirstViewController 自己所在的位置，获取item 个数时，需要提供所在的行下标；获取具体的cell 时要提供所在的行下标，和 在collectionView中的item下标
 */

protocol fiveCellDataSource:class {
    
    
    //从FirstViewController 获取某一行的item个数
    func numberOfItemsInRow(row:NSInteger)->NSInteger
    //从FirstViewController 中获取某一个具体的cell
    func cellForItemInRow(row:NSInteger,index:NSInteger,collectionView:UICollectionView)->UICollectionViewCell
    //布局相关的，返回某一个cell的大小
    func sizeForItemInRow(row:NSInteger,index:NSInteger)->CGSize
    
    
}









/**
 1. 点击title时，通知RecommendView执行 获取相关信息（达人、精选作品,专题）,创建一个ViewController
 2.RecommendView 把第一种创建的ViewController 传递个RecommunityViewController,并将其push到下一层
 */
/**这一个协议只实现第1步的操作*/
//protocol fiveCellDelegate:class {
//    //选中某一行的标题
//    func didSelectedTitleInRow(row:NSInteger)->Void
//    
//    //选中具体的某一个collectionViewCell
//    func didSelectedCellInRow(row:NSInteger,index:NSInteger)->Void
//}



class fiveCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    @IBOutlet weak var iconimage: UIImageView!
    
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    weak var dataSouce:fiveCellDataSource!
//    weak var delegate:fiveCellDelegate?
    
    
    //记录索引
    var indexPath:NSIndexPath!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.collectionVIew.backgroundColor = UIColor.whiteColor()
        
        
        self.collectionVIew.registerNib(UINib.init(nibName: "detailCell", bundle: nil), forCellWithReuseIdentifier: "detailCell")
        
        
        self.collectionVIew.delegate = self
        self.collectionVIew.dataSource = self
        
        
        self.collectionVIew.showsHorizontalScrollIndicator = false
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    //MARK:-UICollectionView 的协议方法
    
    
    
    //设置每个分区有多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSouce.numberOfItemsInRow(self.indexPath.row)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        return self.dataSouce.cellForItemInRow(self.indexPath.row, index: indexPath.item, collectionView: collectionView)
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        return self.dataSouce.sizeForItemInRow(self.indexPath.row, index: indexPath.item)
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        
        return 1
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 2
    }
    
    
    
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        self.delegate?.didSelectedCellInRow(self.indexPath.row, index: indexPath.item)
//    }
//
//    
//    
    
    
    
    
    
}
