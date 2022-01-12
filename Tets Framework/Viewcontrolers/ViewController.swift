//
//  ViewController.swift
//  Tets Framework
//
//  Created by Александр Панин on 11.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var viewAnimationSpringView: SpringView!
    @IBOutlet weak var labelSpringButton: SpringButton!
   
    @IBOutlet var pressetLabel: [UILabel]!
    
    private var preset = "slideRight"
    private var curve = "easeOut"
    private var force: CGFloat = 1
    private var delay: CGFloat = 1
    private var duration: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setPresetSpring()
        viewPresetSpring()
    }
    

    @IBAction func runAnimationSpringButton(_ sender: SpringButton) {
        
        viewPresetSpring()
        
        setAnimationView()
        viewAnimationSpringView.animate()
        
        setPresetSpring()
        
        labelSpringButton.setTitle("RUN \n\(preset) \n\(curve)", for: .normal)
    }
}

extension ViewController {
    
    private func setAnimationView() {
       
        viewAnimationSpringView.animation = preset
        viewAnimationSpringView.curve = curve
        
        viewAnimationSpringView.force = force
        viewAnimationSpringView.delay = delay
        viewAnimationSpringView.duration = duration
    }
    
    private func getNamesPresetSpring() -> String {
        let index = Int.random(in: 0..<Spring.AnimationPreset.allCases.count)
        return Spring.AnimationPreset.allCases[index].rawValue
    }
    
    private func getNameCurveSpring() -> String {
        let index = Int.random(in: 0..<Spring.AnimationCurve.allCases.count)
        return Spring.AnimationCurve.allCases[index].rawValue
    }
    
    private func setPresetSpring() {
        preset = getNamesPresetSpring()
        curve = getNameCurveSpring()
        force = CGFloat.random(in: 0...2)
        delay = CGFloat.random(in: 0...1)
        duration = CGFloat.random(in: 0...2)
    }
    
    private func viewPresetSpring() {
        pressetLabel[0].text = preset
        pressetLabel[1].text = curve
        pressetLabel[2].text = String(format: "%.3f", Float(force))
        pressetLabel[3].text = String(format: "%.3f", Float(delay))
        pressetLabel[4].text = String(format: "%.3f", Float(duration))
    }
}


