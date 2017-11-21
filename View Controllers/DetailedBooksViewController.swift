//
//  DetailedBooksViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailedBooksViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
      loadLabels()
        // Do any additional setup after loading the view.
    }
    var abook: Items!
    
    //MARK: - Outletes
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    func loadLabels(){
         imageView.image = #imageLiteral(resourceName: "defaultBook")
         bookTitle.text = abook.volumeInfo.title
         subtitle.text = abook.volumeInfo.subtitle
         priceLabel.text = "\( abook.saleInfo.listPrice.amount)"
         authorLabel.text = "\(abook.volumeInfo.authors)"
         textView.text = abook.volumeInfo.description
    }
    

}
