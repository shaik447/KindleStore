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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
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
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let book = books?[indexPath.row]
        cell.textLabel?.text = book?.Title
        return cell
        
    }
    
    func setupBooks() {
        
        var pages=[Page]()
        pages.append(Page(pageNo: 1, pageText: "This is text from page 1"))
        pages.append(Page(pageNo: 2, pageText: "This is text from page 2"))
        
        let book1=Book(title: "Steve Jobs", author: "Shaik", pages: pages)
        let book2=Book(title: "Steve Jobs", author: "Shaik", pages: [
            Page(pageNo: 1, pageText: "Text form first page"),
            Page(pageNo: 2, pageText: "Text form 2nd page"),
            Page(pageNo: 3, pageText: "Text form 3rd page")
            ])
        books=[Book]()
        books?.append(book1)
        books?.append(book2)
        
        
        print(books?.count ?? 456)
    }
}

