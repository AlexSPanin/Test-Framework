//
//  ViewController.swift
//  Tets Framework
//
//  Created by Александр Панин on 11.01.2022.
//

import Spring

class MainViewController: UIViewController {

    @IBOutlet weak var viewAnimationSpringView: SpringView!
    @IBOutlet weak var labelSpringButton: SpringButton!
    @IBOutlet var presetLabel: [UILabel]!
    
    private var animation = ""
    private var curve = ""
    private var force: CGFloat = 0
    private var delay: CGFloat = 0
    private var duration: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPresetSpring()
        setPresetSpring()
    }
    
    @IBAction func runAnimationSpringButton(_ sender: SpringButton) {
        setAnimationView()
        viewPresetSpring()
        viewAnimationSpringView.animate()
        
        setPresetSpring()
        labelSpringButton.setTitle("RUN \n\(animation) \n\(curve)", for: .normal)
    }
}

extension MainViewController {
    
    private func setAnimationView() {
        viewAnimationSpringView.animation = animation
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
        animation = getNamesPresetSpring()
        curve = getNameCurveSpring()
        force = CGFloat.random(in: 0...2)
        delay = CGFloat.random(in: 0...2)
        duration = CGFloat.random(in: 1...2)
    }
    
    private func viewPresetSpring() {
        presetLabel[0].text = viewAnimationSpringView.animation
        presetLabel[1].text = viewAnimationSpringView.curve
        presetLabel[2].text = String(format: "%.3f", Float(viewAnimationSpringView.force))
        presetLabel[3].text = String(format: "%.3f", Float(viewAnimationSpringView.delay))
        presetLabel[4].text = String(format: "%.3f", Float(viewAnimationSpringView.duration))
    }
}


