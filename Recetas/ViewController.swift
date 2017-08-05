//
//  ViewController.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 3/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        
        //creación de las recetas
        
        var recipe = Recipe(name: "Tortilla de papas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Papas", "Huevos", "Cebolla"],
                            steps: ["1. Pelar las papas y la cebolla",
                                    "2. Cortar papas y cebollas",
                                    "3. Freir",
                                    "4. Batir huevos y echarlos a la sarten con el resto"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina", "Levadura", "Aceite", "Sal", "Salsa de tomate", "Queso"],
                        steps: ["1. Hacer la masa con harina, levadura, aceite y sal",
                                "2. Dejar reposar la masa 30 minutos",
                                "3. Extendemos la masa y añadimos los demás ingredientes",
                                "4. Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa sin queso",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne"],
                        steps: ["1. Poner al fuego la carne al gusto",
                                "2. Montar la hamburguesa con sus ingredientes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada césar",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomate", "Cebolla", "Pimientos", "Salsa césar", "Pollo"],
                        steps: ["1. Limpiar verduras y trocearlas",
                                "2. Cocer el pollo al gusto",
                                "3. Juntar los ingredientes",
                                "4. Echar salsa césar"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Fresas",
                        image: #imageLiteral(resourceName: "fresas"),
                        time: 5,
                        ingredients: ["Fresas"],
                        steps: ["1. Lavar las fresas",
                                "2. Picarlas"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Fideos",
                        image: #imageLiteral(resourceName: "fideos"),
                        time: 45,
                        ingredients: ["Fideos", "Tomate", "Cebolla", "Pimientos", "Más verduras", "Pollo"],
                        steps: ["1. Limpiar verduras y trocearlas",
                                "2. Cocer los fideos",
                                "3. Juntar los ingredientes",
                                "4. Cocer durante un buen rato"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Sandwich de huevo frito",
                        image: #imageLiteral(resourceName: "sandwich"),
                        time: 10,
                        ingredients: ["Huevo", "Pan de molde", "Aceite", "Sal"],
                        steps: ["1. Freir los huevos",
                                "2. Poner los huevos encima del pan",
                                "3. Echarle sal"])
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

