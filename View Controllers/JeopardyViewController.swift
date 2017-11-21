//
//  JeopardyViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.


import UIKit

class JeopardyViewController: UIViewController {
    
        // MARK: - decleration
    
    var allquestions = [Jeopardy]()
    var counter = 0
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var answerdisplayTextfield: UITextField!
    @IBOutlet weak var rightWrongLabel: UILabel!
    @IBAction func answerTextField(_ sender: UITextField) {
        if (sender.text?.contains(allquestions[counter].answer))!{
            //rightWrongLabel.isHidden = false
            //rightWrongLabel.text = "Correct"
        } else{
            //rightWrongLabel.isHidden = false
           // rightWrongLabel.text = "Correct"
            answerdisplayTextfield.text = allquestions[counter].answer
        }
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if counter < allquestions.count - 1 {
            counter += 1
        }else {
            counter = 0
        }
        loadLabeles()
    }
    
    
    // MARK: - ViewDidLoad
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJeopardyData()
        loadLabeles()
       
    }
    
    func loadLabeles(){
        imageView.image = #imageLiteral(resourceName: "jeopardyLogo")
        categoryLabel.text = allquestions[counter].category.title
        questionLabel.text = "\(allquestions[counter].question)"
        valueLabel.text = "\(String(describing: allquestions[counter].value))"
        //rightWrongLabel.isHidden = true
    }

    //func loadJeopardyData(){
//        if let path = Bundle.main.path(forResource: "jeopardyinfo", ofType: "json"){
//            let myURL = URL(fileURLWithPath: path)
//              if let data = try? Data(contentsOf: myURL) {
//                self.allquestions = Jeopardy.getInfo(from: data)
//
//            }
//        }
//    }
        func loadJeopardyData(){
            if let path = Bundle.main.path(forResource: "jeopardyinfo", ofType: "json") {
                let myURL = URL(fileURLWithPath: path)
                if let data = try? Data(contentsOf: myURL) {
                    let myDecoder = JSONDecoder()
                    do{
                        let questionDict = try myDecoder.decode([Jeopardy].self, from: data)
                        self.allquestions = questionDict
                        
                    }
                    catch let error {
                        print(error)
                    }
                }
            }
    }
    
    

}
