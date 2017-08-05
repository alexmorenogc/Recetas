//
//  ReviewViewController.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 5/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    

    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //efecto blur a la foto de fondo
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //Poner en tamaño 0 para luego poder animar el escalado
        //ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        //Poner abajo del todo para animar el subir
        //ratingStackView.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //Concatenar ambas transformaciones
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //ratingStackView.transform = scale.concatenating(translation)
        
        self.firstButton.transform = scale.concatenating(translation)
        self.secondButton.transform = scale.concatenating(translation)
        self.thirdButton.transform = scale.concatenating(translation)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Para animar el crecimiento de la StackView de los botones
        
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            /*self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)*/
        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                /*self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)*/
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                 /*self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)*/
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                    /*self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)*/
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"

        case 3:
            ratingSelected = "great"

        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
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
