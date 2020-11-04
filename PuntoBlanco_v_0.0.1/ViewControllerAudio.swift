//
//  ViewControllerAudio.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 04.11.20.
//

import UIKit
import AVFoundation

class ViewControllerAudio: UIViewController {

    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var moveM: UISlider!
    @IBOutlet weak var nexxt: UIButton!
    
    
    
    
    var NombreMedi : String!
    
   var player : AVAudioPlayer?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tfName.text = NombreMedi
            
            let urlString = Bundle.main.path(forResource: "Elegy2", ofType: "mp3")
            
            do {
                       try AVAudioSession.sharedInstance().setMode(.default)
                       try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                       guard let urlString = urlString else {
                           print("urlstring is nil")
                           return
                       }

                       player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

                       guard let player = player else {
                           print("player is nil")
                           return
                       }

                       player.play()
                   }
                   catch {
                       print("error occurred")
                   }
             moveM.maximumValue = Float(player!.duration)
            _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewControllerAudio.updateSlider), userInfo: nil, repeats: true)
        
        }
        
  
    @IBAction func MoveMusic(_ sender: UISlider) {
            player?.stop()
            player?.currentTime = TimeInterval(moveM.value)
            player?.prepareToPlay()
            player?.play()
        }
        
        @objc func updateSlider(){
            moveM.value = Float(player!.currentTime)
            if moveM.value >= moveM.maximumValue * 0.999{
                nexxt.isHidden = false
                
            }
        }
        
    
        @IBAction func playPause(_ sender: UIButton) {
            if player?.isPlaying == true {
                       // pause
                       player?.pause()
                   }
                   else {
                       // play
                       player?.play()
                      
                                    }
        }
    }



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
