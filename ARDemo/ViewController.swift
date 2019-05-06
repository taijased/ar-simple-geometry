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
        material.diffuse.contents = UIColor.purple
        let boxNode = SCNNode(geometry: boxGeometry)
        boxNode.geometry?.materials = [material]
        boxNode.position = SCNVector3(0, 0, -1.0)
        scene.rootNode.addChildNode(boxNode)

//        text
        let textGeometry = SCNText(string: "Это кубик", extrusionDepth: 2.0)
        let textMaterial = SCNMaterial()

        textMaterial.diffuse.contents = UIColor.white

        let textNode = SCNNode(geometry: textGeometry)
        textNode.geometry?.materials = [textMaterial]
        textNode.scale = SCNVector3(0.005, 0.005, 0.005)
        textNode.position = SCNVector3(0,0.2,-1.0)
        scene.rootNode.addChildNode(textNode)
        
        
        
        let sphereGeometry = SCNSphere(radius: 0.1)
        let sphereMaterial = SCNMaterial()
        
        sphereMaterial.diffuse.contents = UIImage(named: "head.jpg")
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.geometry?.materials = [sphereMaterial]
        
        sphereNode.position = SCNVector3(0.5, 0, -1.0)
        
        scene.rootNode.addChildNode(sphereNode)
        
        
        let earthGeometry = SCNSphere(radius: 0.1)
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "earth.jpg")
        let earthNode = SCNNode(geometry: earthGeometry)
        earthNode.geometry?.materials = [earthMaterial]
        
        earthNode.position = SCNVector3(-0.5, 0, -1.0)
        
        scene.rootNode.addChildNode(earthNode)
        
        
        
        createFigures(in: scene)
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = scene

    }
    
    private func createFigures(in scene: SCNScene) {
        let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
        var xCoordinate: Double = 1
       
        for geometryShape in array {
            let node = SCNNode(geometry: geometryShape)
            let geometryMaterial = SCNMaterial()
            geometryMaterial.diffuse.contents = UIColor.red
            
            node.geometry?.materials = [geometryMaterial]
            node.scale = SCNVector3(0.1, 0.1, 0.1)
            node.position = SCNVector3(xCoordinate, 0.5, -1.0)
            xCoordinate -= 0.2
            
            scene.rootNode.addChildNode(node)
        }
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
