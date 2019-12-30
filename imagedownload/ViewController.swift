//
//  ViewController.swift
//  imagedownload
//
//  Created by Student P_04 on 30/12/19.
//  Copyright © 2019 Felix ITs. All rights reserved.
//https://media.gettyimages.com/photos/red-barberton-daisy-flower-against-black-background-picture-id636167826?s=612x612

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
   
    
    @IBAction func dowmload(_ sender: UIButton) {
        let operationQueue = OperationQueue()
        let operation1 : BlockOperation = BlockOperation (block:
            {
                let str = "https://images.pexels.com/photos/85773/pexels-photo-85773.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                let url = URL(string: str)
                let session = URLSession(configuration: .default)
                let dataTask = session.dataTask(with: url!) { (data, response, error) in
                    guard let data = data
                        else{
                            return
                    }
                    //self.indicator.startAnimating()
                    let image = UIImage(data: data)
                    self.indicator.stopAnimating()
                    self.imageView.image = image
                }
                dataTask.resume()
                

            
        })
        operationQueue.addOperation(operation1)
    }
    
    @IBAction func Button(_ sender: UIButton) {
        let queue = DispatchQueue(label: "", attributes: .concurrent)
        queue.async {
            self.downloadfromweb()
        }

        
    }
    func downloadfromweb()
    {
        let str = "https://media.gettyimages.com/photos/red-barberton-daisy-flower-against-black-background-picture-id636167826?s=612x612"
        let url = URL(string: str)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            guard let data = data
                else{
                    return
            }
            //self.indicator.startAnimating()
            let image = UIImage(data: data)
            self.indicator.stopAnimating()
            self.imageView.image = image
        }
        dataTask.resume()
        
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

