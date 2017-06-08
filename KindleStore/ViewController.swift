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
        setupnavigationbarstyles()
        setupnavbuttons()
        navigationItem.title="Kindle"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellid")
        tableView.tableFooterView=UIView()
        //setupBooks()
        fetchBooks()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle=UIStatusBarStyle.lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle=UIStatusBarStyle.default
    }
    
    func setupnavbuttons(){
        let imageview=UIImageView(image: UIImage(named: "menu"))
        imageview.bounds.size=CGSize(width: 30, height: 30)
        navigationItem.leftBarButtonItem=UIBarButtonItem(customView: imageview)
        navigationItem.leftBarButtonItem?.style=UIBarButtonItemStyle.plain
        navigationItem.leftBarButtonItem?.target=self
        navigationItem.leftBarButtonItem?.action=#selector(menuclicked)
        
        let imageview2=UIImageView(image: UIImage(named: "amazon2"))
        imageview2.bounds.size=CGSize(width: 30, height: 30)
        navigationItem.rightBarButtonItem=UIBarButtonItem(customView: imageview2)
        
        
//        navigationItem.leftBarButtonItem=UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector (menuclicked))
    }
    
    func menuclicked(){
        print("menu clicked")
    }
    
    
    
    func setupnavigationbarstyles(){
        
        navigationController?.navigationBar.barTintColor=UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
//        var textattributes=[String:Any]()
//        textattributes[NSForegroundColorAttributeName]=UIColor.red
        navigationController?.navigationBar.isTranslucent=false
        navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:UIColor.white]
    }
    
    func fetchBooks(){
        let url=URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json")
        if let bookurl = url {
                URLSession.shared.dataTask(with: bookurl, completionHandler: { (data, response, error) in
                    if let err=error{
                        print("Failed to fetch json books",err)
                        return
                    }
                    if let datax=data,let datastring=String(data: datax, encoding: .utf8){
                        do{
                            //print(datastring)
                            self.books=[]
                            let json=try JSONSerialization.jsonObject(with: datax, options: JSONSerialization.ReadingOptions.mutableContainers)
                            if let bookdictonaries = json as? [[String:Any]]{
                                for bookdictonary in bookdictonaries{

                                    let tmpBook=Book(bookdictionary: bookdictonary)
                                    self.books?.append(tmpBook)
                                    
//                                    if let title=bookdictonary["title"] as? String, let author=bookdictonary["author"] as? String{
//                                        print(title,author)
//                                        self.books?.append(Book(title: title, author: author, bookcover: #imageLiteral(resourceName: "stevejobs"), pages: []))
//                                    }
                                }
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                                
                            }

                        }catch let nserr{
                            print("Failed to serialize",nserr)
                        }
                        
                                            }
                    
                }).resume()
        }
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

