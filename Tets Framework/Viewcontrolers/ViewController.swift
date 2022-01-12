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
    
    
    
    private var preset = ""
    private var curve = ""
    private var force: CGFloat = 0
    private var delay: CGFloat = 0
    private var duration: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preset = getNamesPreset()
        curve = getNameCurve()
        setRandomPresetSpring()
        
        
    }
    

    @IBAction func runAnimationSpringButton(_ sender: SpringButton) {
        
        viewPreset()
        
        labelAnimationSpringView.animation = preset
        labelAnimationSpringView.curve = curve
        
        labelAnimationSpringView.force = force
        labelAnimationSpringView.delay = delay
        labelAnimationSpringView.duration = duration
        
        
        labelAnimationSpringView.animate()
        
       
        
        
        preset = getNamesPreset()
        curve = getNameCurve()
        setRandomPresetSpring()
        
        labelSpringButton.setTitle("RUN \(preset)", for: .normal)
        
        

        
        
       
    }
}

extension ViewController {
    
    private func getNamesPreset() -> String {
        let index = Int.random(in: 0..<Spring.AnimationPreset.allCases.count)
        return Spring.AnimationPreset.allCases[index].rawValue
    }
    
    private func getNameCurve() -> String {
        let index = Int.random(in: 0..<Spring.AnimationCurve.allCases.count)
        return Spring.AnimationCurve.allCases[index].rawValue
    }
    
    private func setRandomPresetSpring() {
        force = CGFloat.random(in: 0...2)
        delay = CGFloat.random(in: 0...1)
        duration = CGFloat.random(in: 1...3)
    }
    
    private func viewPreset() {
        pressetLabel[0].text = preset
        pressetLabel[1].text = curve
        pressetLabel[2].text = String(Float(force))
        pressetLabel[3].text = String(Float(delay))
        pressetLabel[4].text = String(Float(duration))
    }
}


