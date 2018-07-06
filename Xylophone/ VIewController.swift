//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playNote(key: sender.tag)
        animate(sender: sender)
    }
    
    private func playNote(key: Int) {
        let soundUrl = Bundle.main.url(forResource: "note\(key)", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        } catch {
            print(error.localizedDescription)
        }
        
        audioPlayer.play()
    }
    
    func animate(sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(1.0),
                       initialSpringVelocity: CGFloat(0.1),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: { sender.transform = CGAffineTransform.identity },
                       completion: { Void in() })
    }
}

