//
//  ViewController.swift
//  CatSound
//
//  Created by Katheryne Graf on 17/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var labelMeow: UILabel!
    @IBOutlet weak var buttonMeow: UIButton!
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Para evitar que a imagem sofra deformaçoes dependendo do aparelho que for rodas a aplicação
        buttonMeow.imageView?.contentMode = .scaleAspectFit
        labelMeow.isHidden = true
        
        //Retorna o caminho onde o arquivo está salvo
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        } catch {
            print(error)
        }
        
    }

    @IBAction func pressMeowButton(_ sender: Any) {
        labelMeow.isHidden = false
        catSound.play()
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(labelHidden), userInfo: nil, repeats: false)
    }
    
    @objc func labelHidden (){
        labelMeow.isHidden = true
    }
    
}

