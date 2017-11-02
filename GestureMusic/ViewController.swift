//
//  ViewController.swift
//  GestureMusic
//
//  Created by 6272 on 11/2/2560 BE.
//  Copyright © 2560 6272. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer?

    var currentSong = 0
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEventSubtype.motionShake){
            print("shake")
            if(currentSong == 0)
            {
                let mySound2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "love",ofType:"mp3")!)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: mySound2 as URL)
                }catch let error as NSError{
                    audioPlayer = nil
                }
                currentSong = 1
            }
            else{
                let mySound1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "song",ofType:"mp3")!)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: mySound1 as URL)
                }catch let error as NSError{
                    audioPlayer = nil
                }
                currentSong = 0
            }
            
            audioPlayer?.play()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }catch _{
        }
        do{
            try AVAudioSession.sharedInstance().setActive(true)
        }catch _{
            
        }

        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
        audioPlayer?.volume = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

