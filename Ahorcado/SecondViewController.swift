//
//  SecondViewController.swift
//  Ahorcado
//
//  Created by Yuna114 on 5/2/17.
//  Copyright © 2017 Yuna114. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textoResultado: UILabel!
    
    @IBOutlet weak var imagenResultado: UIImageView!
    
    @IBAction func volverAJugar(_ sender: AnyObject) {
       /* override func prepareForSegue(segue:
            UIStoryboardSegue, sender: AnyObject?) {
            let juego: ViewController  = segue.destination as! ViewController
        }*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
