//
//  SecondViewController.swift
//  Ahorcado
//
//  Created by Yuna114 on 5/2/17.
//  Copyright © 2017 Yuna114. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //Creamos los IBOutlets necesarios
    @IBOutlet weak var textoResultado: UILabel!
    @IBOutlet weak var imagenResultado: UIImageView!
    //creamos las variables para poder pasar la informaicón
    var imagen : UIImage = #imageLiteral(resourceName: "lose.jpg")
    var texto : String = ""
    //Hacemos el override para crear el ViewController y jugar otra vez
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let juego: ViewController  = segue.destination as! ViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Modificamos los IBOutlets con la información que hemos recibido del otro ViewController
        textoResultado.text = texto
        imagenResultado.image = imagen
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
