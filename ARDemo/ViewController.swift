//
//  ViewController.swift
//  ARDemo
//
//  Created by Maxim Spiridonov on 06/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        
        let boxGeometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.brown
        let boxNode = SCNNode(geometry: boxGeometry)
        boxNode.geometry?.materials = [material]
        boxNode.position = SCNVector3(0, 0, -1.0)
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
