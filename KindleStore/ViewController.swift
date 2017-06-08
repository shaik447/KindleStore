//
//  ViewController.swift
//  KindleStore
//
//  Created by shaik mulla syed on 6/4/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    var books:[Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        navigationItem.title="Kindle"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellid")
        tableView.tableFooterView=UIView()
        setupBooks()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count=books?.count{
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        cell.book=book        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedbook:Book=books![indexPath.row]        
        let flowlayout=UICollectionViewFlowLayout()
        let collectionView=PagerController(collectionViewLayout: flowlayout)
        collectionView.book=selectedbook
        let navController = UINavigationController(rootViewController: collectionView)
        present(navController, animated: true, completion: {
            print("view present")
        })
    }
    
    func setupBooks() {
        var pages=[Page]()
        pages.append(Page(pageNo: 1, pageText: "This is text from page 1"))
        pages.append(Page(pageNo: 2, pageText: "This is text from page 2"))        
        let book1=Book(title: "Steve Jobs", author: "Shaik",bookcover:#imageLiteral(resourceName: "stevejobs"), pages: pages)
        let book2=Book(title: "Bill Gates", author: "Shaik",bookcover:#imageLiteral(resourceName: "billgates"), pages: [
            Page(pageNo: 1, pageText: "Text form first page"),
            Page(pageNo: 2, pageText: "Text form 2nd page"),
            Page(pageNo: 3, pageText: "Text form 3rd page")
            ])
        books=[Book]()
        books?.append(book1)
        books?.append(book2)
    }
}

