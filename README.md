# Geometry Figure


## SCNText

```
let textGeometry = SCNText(string: "Это кубик", extrusionDepth: 2.0)
let textMaterial = SCNMaterial()

textMaterial.diffuse.contents = UIColor.white

let textNode = SCNNode(geometry: textGeometry)
textNode.geometry?.materials = [textMaterial]
textNode.scale = SCNVector3(0.005, 0.005, 0.005)
textNode.position = SCNVector3(0,0.2,-1.0)
scene.rootNode.addChildNode(textNode)
```




## Default SCNGeometry

```
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
```

## SCNMaterial with texture

```
let earthGeometry = SCNSphere(radius: 0.1)
let earthMaterial = SCNMaterial()

earthMaterial.diffuse.contents = UIImage(named: "earth.jpg")
let earthNode = SCNNode(geometry: earthGeometry)
earthNode.geometry?.materials = [earthMaterial]

earthNode.position = SCNVector3(-0.5, 0, -1.0)

scene.rootNode.addChildNode(earthNode)
```


### Add default light figure

```
 sceneView.autoenablesDefaultLighting = true
```
