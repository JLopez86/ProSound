//
//  ReproductorViewController.swift
//  ProSound
//
//  Created by Jose Lopez on 10/2/18.
//  Copyright © 2018 Jose Lopez. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ReproductorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var tituloLabe: UILabel!
    var reproductor: AVAudioPlayer!
    var musicaActual : String = "13 tuyuti"


    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var portadaImageView: UIImageView!
    @IBOutlet weak var volumenSlider: UISlider!
    @IBOutlet weak var imagenDiscoImageView: UIImageView!
    
    let musica = ["13 tuyuti", "ai se eu te pego", "Deja que te bese", "solito", "todo viento"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musica[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musica.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        musicaActual = musica[row]
        playMusic()
        mostrarPortada()
        reproductor.play()
    }
    
    
    func playMusic(){
        let path = Bundle.main.path(forResource: musicaActual, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        
        
        do{
            reproductor = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error al cargar el archivo de sonido")
        }
    }
    
    func mostrarPortada(){
        switch musicaActual {
        case "13 tuyuti" :
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual
        case "ai se eu te pego" :
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual
        case "Deja que te bese" :
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual
        case "solito" :
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual
        case "todo viento" :
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual

        default:
            portadaImageView.image = UIImage(named: musicaActual)
            imagenDiscoImageView.image = UIImage(named: musicaActual)
            tituloLabe.text = musicaActual
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButtom() {
        playMusic()
        if !reproductor.isPlaying{
            reproductor.play()
        }
    }
    
    @IBAction func pauseButtom() {
        if reproductor.isPlaying{
            reproductor.pause()
        }
    }
    
    @IBAction func stopButtom() {
        if reproductor.isPlaying{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func volumenSliderChanged(_ sender: UISlider) {
        reproductor.volume = volumenSlider.value
        
    }
    
    
    @IBAction func shuffleButtom() {
        let random = musica[Int(arc4random_uniform(UInt32(musica.count)))]
        print(random)
        musicaActual = random
        playMusic()
        reproductor.play()
        mostrarPortada()
        
    }
    

}
