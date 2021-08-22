//
//  MarsViewController.swift
//  Mars&Beyond
//
//  Created by AyoubHan on 22/08/2021.
//

import UIKit
import SceneKit

class MarsViewController: UIViewController {

    
    @IBOutlet weak var scene: SCNView!
    
    let marsScene = SCNScene(named: "mars.scn")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.scene = marsScene
        scene.allowsCameraControl = true
        createMars()
    }
    
    @IBAction func earthTapped(_ sender: UIButton) {
        let earthViewController = storyboard?.instantiateViewController(identifier: "earthVC") as? EarthViewController
        view.window?.rootViewController = earthViewController
        view.window?.makeKeyAndVisible()
    }
    
    private func createMars() {
        let marsSphere = SCNSphere(radius: 0.52)
        let marsNode = SCNNode(geometry: marsSphere)
        let texture = UIImage(named: "mars")
        marsScene?.rootNode.addChildNode(marsNode)
        marsNode.position = SCNVector3(0.0, 0.0, 0.0)
        marsNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
        marsNode.geometry?.firstMaterial?.diffuse.contents = texture
    }
    
    private func createCamera() {
        let camera = SCNCamera()
        let structure = SCNSphere(radius: 0.2)
        let cameraNode = SCNNode(geometry: structure)
        marsScene?.rootNode.addChildNode(cameraNode)
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0.0, 0.0, 7.0)
        cameraNode.eulerAngles = SCNVector3(0.0, 0.0, 0.0)
    }
}
