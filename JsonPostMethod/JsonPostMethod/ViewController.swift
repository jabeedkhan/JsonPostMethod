//
//  ViewController.swift
//  JsonPostMethod
//
//  Created by jabeed on 11/10/19.
//  Copyright © 2019 jabeed. All rights reserved.
//

import UIKit
struct post:Codable {
    var userId:Int
    var id:Int
    var title:String
    var body:String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.PostMethod()
    
        
    }
    func PostMethod() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) { data,response,error in
            if let data = data {
                print(data)
                let posts = try? JSONDecoder().decode([post].self, from: data)
                print(posts)
            }
            
        }.resume()
    }

}

