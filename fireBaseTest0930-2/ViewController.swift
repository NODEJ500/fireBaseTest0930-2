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
        let txtRef = storage.reference(withPath: "new.text")
        
        txtRef.getMetadata() {metadata, error in
            if let err = error{
                self.data.text = err.localizedDescription
            }else{
                let formatter = DateFormatter()
                formatter .locale = NSLocale(localeIdentifier: "ja_ JP") as Locale
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                var res = "★ metadata ★\n"
                res  += metadata!.name! + "\n"
                res  += metadata!.path! + "\n"
                res  += metadata!.contentType! + "\n"
                res  += String(metadata!.size) + "\n"
                res  += formatter.string(from: metadata!.timeCreated!) + "\n"
                res  += formatter.string(from: metadata!.updated!)
                self.data.text = res
            }
        }
    }
}
