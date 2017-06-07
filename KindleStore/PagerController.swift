//
//  PagerController.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/7/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class PagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.isPagingEnabled=true

        let layout=collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        
//        navigationItem.backBarButtonItem=UIBarButtonItem(barButtonSystemItem: , target: <#T##Any?#>, action: <#T##Selector?#>)
        
        //layout.minimumInteritemSpacing = 0.0
        //automaticallyAdjustsScrollViewInsets=false
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PageCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //substracting navigation bar(44) and status bar height(20)
        return CGSize(width: view.bounds.width, height: view.bounds.height-44.0-20.0)
    }
    
    
    
    

}
