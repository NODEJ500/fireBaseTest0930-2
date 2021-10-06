//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class ViewController: UIViewController {

   
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var data: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    @IBAction func doAction(_ sender: Any) {
       
        let storage = Storage.storage()
        let txtRef = storage.reference(withPath: "newfile.text")
        let str = data.text  + ""
        txtRef.putData(str.data(using: String.Encoding.utf8)!, metadata:nil) { metadata, error in
            if let meta = metadata {
               print("成功です！")
            }else{
               print("失敗です！")
         }
        }
    }
}
