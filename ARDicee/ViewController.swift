//
//  ViewController.swift
//  ARDicee
//
//  Created by 張書涵 on 2019/11/6.
//  Copyright © 2019 張書涵. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ARWorldTrackingConfiguration.isSupported {
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()

            // Run the view's session
            sceneView.session.run(configuration)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "AR is not supported on your phone", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
