//
//  ViewController.swift
//  Ahorcado
//
//  Created by Yuna114 on 5/2/17.
//  Copyright © 2017 Yuna114. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Iboutlets necesarios
    @IBOutlet weak var palabraAdivinar: UILabel!
    @IBOutlet weak var letraIntroducida: UITextField!
    @IBOutlet weak var imagenAhorcado: UIImageView!
    //Array de palabras
    var peliculas = ["La Historia Interminable", "Harry Potter", "El Señor de los Anillos", "El Hobbit", "Los Juegos del Hambre", "Star Wars", "El Juego de Ender", "Animales Fantasticos y donde encontrarlos", "Divergente", "Piratas del Caribe"]
    //Array de imagenes
    var ahorcado = [#imageLiteral(resourceName: "inicio.jpg"), #imageLiteral(resourceName: "primerFallo.jpg"), #imageLiteral(resourceName: "segundoFallo.jpg"), #imageLiteral(resourceName: "tercerFallo.jpg"), #imageLiteral(resourceName: "cuartoFallo.jpg"), #imageLiteral(resourceName: "quintoFallo.jpg"), #imageLiteral(resourceName: "sextoFallo.jpg")]
    var fail = 0;
    //Array de char de la palabra seleccionada y de lo que se muestra mediante va acertando
    var palabraSeleccionada = [Character]()
    var arrayPalabraMostrada = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //indicamos que somos delegate para poder limitar a 1 el TextField
        letraIntroducida.delegate = self
        //hacemos un random para saber que palabra toca
        let random = Int(arc4random_uniform(UInt32(peliculas.count)))
        //pasamos la palabra seleccionada a char
        palabraSeleccionada = Array(peliculas[random].characters)
        //introducimos tantos "_" como letras tenga la palabra y espacios
        for i in 0...palabraSeleccionada.count-1{
            if palabraSeleccionada[i] == " "{
                arrayPalabraMostrada.append(" ")
            }else{
                arrayPalabraMostrada.append("_")
            }
            arrayPalabraMostrada.append(" ")
           
        }
        palabraAdivinar.text = String(arrayPalabraMostrada)
        imagenAhorcado.image = ahorcado[fail]
    }
    
    
    @IBAction func comprobar(_ sender: AnyObject) {
        //creamos una variable texto para comparar la letra introducida
        var letraIntro = letraIntroducida.text
        //creamos un boolean para ver si ha sido o no un fallo
        var letraCorrecta = false
        //recorremos el array de char de la palabra seleccionada
        for i in 0...palabraSeleccionada.count-1{
            //si no es un caracter " " comprobamos
            if(palabraSeleccionada[i] != " "){
                //pasamos el caracter a string para poder usar el caseInsensitive al comparar
                var palabra = String(palabraSeleccionada[i])
                //comprobamos si la letra introducida equivale a la letra de la palabra indistintamente si es con mayúscula o minúscula
                if palabra.caseInsensitiveCompare(letraIntro!) == ComparisonResult.orderedSame {
                    //en caso de ser igual indicamos que no es incorrecta la letra y sustituimos la "_"
                    //multiplico el indice por 2 a causa de los espacios
                    arrayPalabraMostrada[i*2] = palabraSeleccionada[i]
                    letraCorrecta = true
                }
            }
        }
        
        //volvemos a mostrar la palabra con la letra sustituida
        palabraAdivinar.text = String(arrayPalabraMostrada)
        //si la letra no es correcta y por lo tanto la variable sigue en false
        if letraCorrecta == false {
            //sumamos 1 a la variable fail
            fail+=1
            //modificamos la imagen del ahorcado
            imagenAhorcado.image = ahorcado[fail]
        }
        //Comprobamos si ha acertado la palabra
        var palabraCompletada = true
        for i in 0...arrayPalabraMostrada.count-1{
            if arrayPalabraMostrada[i] == "_"{
                palabraCompletada = false
            }
        }
        if palabraCompletada == true{
            print("Has ganado")
        }
        //Comprobamos si ha pasado el limite de fallos
        if fail == 6{
         /*  let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as SecondViewController
            self.showViewController(secondViewController, sender: self)*/
            print("has perdido")
        }
        //reseteamos el TextField
        letraIntroducida.text = ""
    }
    

    //función que delimita el TextField a 1
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

