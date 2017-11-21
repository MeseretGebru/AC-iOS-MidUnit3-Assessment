//
//  JeopardyModel.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//
import Foundation

//    class Jeopardy {
//        let question: String
//        let answer: String
//        let value: Double
//        let catagory: String
//        init(question: String, answer: String, value: Double, catagory: String){
//            self.question = question
//            self.answer = answer
//            self.value = value
//            self.catagory = catagory
//        }
//    convenience init?(from dictQuestions: [String: Any]) {
//        guard let question = dictQuestions["question"] as? String else {return nil}
//        guard let answer = dictQuestions["answer"] as? String else {return nil}
//        let value = dictQuestions["Value"] as? Double ?? 0.0
//        guard let catagory = dictQuestions["catagory"] as? [String:Any] else {return nil}
//        guard let title = catagory["title"] as? String else {return nil}
//        self.init(question:question, answer:answer, value:value, catagory:catagory[title])
//    }
//
//
//        class func getInfo(from data: Data) -> [Jeopardy]{
//
//        var allQuestions = [Jeopardy]()
//            do{
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                guard let arrOfDicQuestions = json as? [[String: Any]] else {return []}
//            for dictQuestions in arrOfDicQuestions {
//                if let questionSDict = Jeopardy(from:dictQuestions) {
//                    allQuestions.append(questionSDict)
//                    }
//                }
//             }
//            catch let error {
//            print("Error serializating data: \(error)")
//            }
//            return allQuestions
//}
//
//}

struct Jeopardy: Codable {
    let answer: String
    let question: String
    let value: Int?
    let category: Category
}

struct Category: Codable {
    let title: String
}

