//
//  ViewController.swift
//  Mars&Beyond
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit
import SceneKit

class SpaceViewController: UIViewController {

    @IBOutlet weak var scene: SCNView!
    
    let spaceScene = SCNScene(named: "space.scn")
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.scene = spaceScene
        scene.allowsCameraControl = true
        createEarth()
        createCamera()
    }
    
    private func createEarth() {
        let earthSphere = SCNSphere(radius: 1.0)
        let earthNode = SCNNode(geometry: earthSphere)
        spaceScene?.rootNode.addChildNode(earthNode)
        earthNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
        earthNode.position = SCNVector3(0.0, 0.0, 0.0)
    }
    
    private func createCamera() {
        let camera = SCNCamera()
        let shape = SCNSphere()
        let cameraNode = SCNNode(geometry: shape)
        cameraNode.camera = camera
        spaceScene?.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(0.0, 0.0, 10.0)
        cameraNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
    }
}

