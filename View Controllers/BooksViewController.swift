//
//  BooksViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Instance Methods
    var allBooks = [Items]()
    
    
    //MARK: - Outlates
    
    @IBOutlet weak var booksTableView: UITableView!
    
    
    //MARK: - Properties
    let cellIdentifier = "BooksInfo"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksTableView.dataSource = self
        booksTableView.delegate = self
        loadBooksInfo()
    }
    
    
    func loadBooksInfo(){
        if let path = Bundle.main.path(forResource: "bookinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do{
                    let booksDict = try myDecoder.decode(Books.self, from: data)
                    self.allBooks = booksDict.items
                    DispatchQueue.main.async {
                        self.booksTableView.reloadData()
                    }
                    
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let books = self.allBooks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = books.volumeInfo.title
        cell.detailTextLabel?.text = "\(books.saleInfo.listPrice.amount)"
        return cell
    
    }
    
    // MARK: - Navigation

    

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let detailBookVC = segue.destination as? DetailedBooksViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = booksTableView.indexPath(for: cell){
            let selectedBook = allBooks[indexPath.row]
            detailBookVC.abook = selectedBook
            }
    }
}
