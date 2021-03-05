//
//  ViewController.swift
//  tictactoe
//
//  Created by Mathilde M on 20/02/2021.
//

import UIKit

class ViewController: UIViewController {

    var joueur=1 //rond1,croix2
    var partie=true
    var ww=0
    @IBOutlet weak var header: UILabel!
    
    var etat = [0,0,0,0,0,0,0,0,0]
    let combinaisons = [[0,1,2],   [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func reset(_ sender: Any) {
        joueur=1
        etat = [0,0,0,0,0,0,0,0,0]
        partie=true
        playAgain.isHidden=true
        header.text=""
        for i in 0...8{
            let bouton=view.viewWithTag(i) as! UIButton
            //print("reset bouton\(bouton.tag)")
            bouton.setImage(nil,for: .normal)
            bouton.isEnabled=true
        }
    }
    
   
    @IBAction func enfoncer(_ sender: AnyObject) {
        if partie==true{
            let but=view.viewWithTag(sender.tag) as! UIButton
            etat[sender.tag]=joueur
            if joueur==1 {
                sender.setImage(UIImage(named: "rond.png"), for: .normal)
                joueur=2
            }
            else{
                sender.setImage(UIImage(named: "croix.png"), for: .normal)
                joueur=1
            }
            but.isEnabled=false
            for c in combinaisons{
                if etat[c[0]] != 0 && etat[c[0]] == etat[c[1]] && etat[c[1]] == etat[c[2]]{
                    if etat[c[0]] == 1{
                        ww=1
                        header.text="Joueur 1 a gagné"
                        partie=false
                        playAgain.isHidden=false
                    }
                    else if etat[c[0]] == 2{
                        ww=2
                        header.text="Joueur 2 a gagné"
                        partie=false
                        playAgain.isHidden=false
                    }
                }
            }
            if etat[0] != 0 && etat[1] != 0 && etat[2] != 0 && etat[3] != 0 && etat[4] != 0 && etat[5] != 0 && etat[6] != 0 && etat[7] != 0 && etat[8] != 0 && ww==0{
                playAgain.isHidden=false
                header.text="Match nul"
                partie=false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

