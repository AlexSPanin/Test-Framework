//
//  ViewController.swift
//  Tets Framework
//
//  Created by Александр Панин on 11.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var labelAnimationSpringView: SpringView!
    @IBOutlet weak var labelSpringButton: SpringButton!
   
    @IBOutlet var pressetLabel: [UILabel]!
    
    
    
    private var pressed = ""
    private var curve = ""
    private var force: CGFloat = 0
    private var delay: CGFloat = 0
    private var duration: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPresset()
        
    }
    

    @IBAction func runAnimationSpringButton(_ sender: SpringButton) {
        
        setRandomPressetSpring()
        
//        for count in Spring.AnimationPreset.allCases {

        labelAnimationSpringView.animation = Spring.AnimationPreset.fadeInLeft.rawValue
        labelSpringButton.setTitle("RUN \(pressed)", for: .normal)

            labelAnimationSpringView.curve = Spring.AnimationCurve.easeOut.rawValue
        labelAnimationSpringView.force = force
        labelAnimationSpringView.delay = delay
        labelAnimationSpringView.duration = duration
            labelAnimationSpringView.animate()
            
 //       }
    }
}

extension ViewController {
    
    private func setRandomPressetSpring() {
        force = CGFloat.random(in: 0...2)
        delay = CGFloat.random(in: 0...1)
        duration = CGFloat.random(in: 0...3)
        
        
    }
    
    private func viewPresset() {
        pressetLabel[0].text = labelAnimationSpringView.animation
        pressetLabel[1].text = labelAnimationSpringView.curve
        pressetLabel[2].text = String(Float(force))
        pressetLabel[3].text = String(Float(delay))
        pressetLabel[4].text = String(Float(duration))
    }
}


