//
//  SingleViewController.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 3/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import UIKit
import Foundation

class SingleViewController: UIViewController {
    
    var recipes : [Recipe] = []
    
    
    @IBOutlet var tableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Personalizar botón atrás
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        //Esconder la barra de navegación on Swipe
        navigationController?.hidesBarsOnSwipe = true
        
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

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
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


//El data source optiene los datos


extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        
        cell.nameLabel?.text = recipe.name
        cell.thumbnailImageView?.image = recipe.image
        cell.timeLabel?.text = "\(recipe.time!) minutos."
        cell.ingredientsLabel.text = "\(recipe.ingredients.count) ingredientes."
        
        /*if recipe.isFavorite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
    //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la app de Recetas."
            
            let activityViewController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        //Borrar
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return [deleteAction, shareAction]
    }
    
}


//El delegate delega al controlador de table las acciones
extension SingleViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("He seleccionado la fila \(indexPath.row)")
        
        /* Forma de hacer una alerta que eliga favorita la receta
         
         let recipe = self.recipes[indexPath.row]
        
        //Crear una alerta:
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert) //Creas el controlador
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil) //Creas la acción
        alertController.addAction(cancelAction) //añades la acción al controlador
        
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavorite {
            favoriteActionTitle = "No favorito"
            favoriteActionStyle = UIAlertActionStyle.destructive
        }
        
    
        
        //Creas un botón que sí tiene un código de ejecución, que es favorito
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData() //Refrescar después de cambiar
        }
        alertController.addAction(favoriteAction) //añades la acción al controlador
        
        
        self.present(alertController, animated: true, completion: nil) //muestras en pantalla el controlador
        */
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row] //Asignamos la receta seleccionada a una variable llamada receta seleccionada
                let destinationViewController = segue.destination as! DetailViewController //Creamos el View Controller de destino, y se lo asignamos al destino del segue, pero le hacemos un casting 'as!' a DetailViewController porque sabemos que el destino va a ser un DetailViewController
                destinationViewController.recipe = selectedRecipe //asignamos la receta seleccionada a la receta creada en el ViewController de destino.
                
            }
        }
    }
    

    
}
