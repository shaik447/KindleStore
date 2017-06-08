//
//  PagerController.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/7/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class PagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.isPagingEnabled=true

        let layout=collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.plain, target: self, action: #selector (hidevc))
        //layout.minimumInteritemSpacing = 0.0
        //automaticallyAdjustsScrollViewInsets=false       
        
    }
    
    func hidevc(){
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.Pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PageCell
        cell.updateUI(page: (book?.Pages[indexPath.item]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //substracting navigation bar(44) and status bar height(20)
        return CGSize(width: view.bounds.width, height: view.bounds.height-44.0-20.0)
    }
    
    
    
    

}
