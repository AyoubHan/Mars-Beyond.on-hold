//
//  ViewController.swift
//  Mars&Beyond
//
//  Created by AyoubHan on 20/08/2021.
//

import UIKit
import SceneKit

class EarthViewController: UIViewController {

    @IBOutlet weak var scene: SCNView!
    
    let earthScene = SCNScene(named: "earth.scn")
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.scene = earthScene
        scene.allowsCameraControl = true
        createEarth()
        createCamera()
    }
    
    @IBAction func marsTapped(_ sender: UIButton) {
        let marsViewController = storyboard?.instantiateViewController(identifier: "marsVC") as? MarsViewController
        view.window?.rootViewController = marsViewController
        view.window?.makeKeyAndVisible()
    }
    
    private func createEarth() {
        let earthSphere = SCNSphere(radius: 1.0)
        let earthNode = SCNNode(geometry: earthSphere)
        let earthTexture = UIImage(named: "earth")
        earthScene?.rootNode.addChildNode(earthNode)
        earthNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
        earthNode.position = SCNVector3(0.0, 0.0, 0.0)
        earthNode.geometry?.firstMaterial?.diffuse.contents = earthTexture
    }
    
    private func createCamera() {
        let camera = SCNCamera()
        let shape = SCNSphere(radius: 0.2)
        let cameraNode = SCNNode(geometry: shape)
        cameraNode.camera = camera
        earthScene?.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(0.0, 0.0, 7.0)
        cameraNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
    }
}

