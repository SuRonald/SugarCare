//
//  SugarContainer.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SpriteKit
import SwiftUI
import CoreMotion

class SugarContainerScene: SKScene {
    
    var nodeCount: Int
    var nodeType: String
    var motionManager: CMMotionManager?
    var shakeState: Bool = false
    
    let standardSize = UIScreen.main.bounds.size.width / 3
    let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 0.5), .fadeOut(withDuration: 0.5)])
    
    init(_ nodeCount: Int, nodeType: String) {
        self.nodeCount = nodeCount
        self.nodeType = nodeType
        super.init(size: CGSize(width: 350, height: 450))
        self.scaleMode = .fill
        self.backgroundColor = UIColor(named: "PastelGray")!
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nodeCount = 1
        self.nodeType = ""
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        for _ in 0..<nodeCount {
            addNewSugar()
        }
        
//        print(physicsWorld.gravity.dy)
//        print(physicsWorld.gravity.dx)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if shakeState {
//            print("Update")
            guard let accelerometerData = motionManager?.accelerometerData else {
                return
            }
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * 30, dy: accelerometerData.acceleration.x * -30)
        }
        else {
            physicsWorld.gravity = .init(dx: 0.0, dy: -9.800000190734863)
        }
    }
    
    func setShakeState(_ state: Bool) {
        self.shakeState = state
        print("Masuk state \(self.shakeState)")
    }
    
    func addNewSugar() {
        var node = SKSpriteNode(imageNamed: ["\(nodeType)/1", "\(nodeType)/2", "\(nodeType)/3"].randomElement()!)
        
        if nodeCount > Int(UserHealthViewModel.shared.limitSugarGrams) && nodeType == "Sugar" {
            node = SKSpriteNode(imageNamed: "Sugar/6")
            makeWarning("Xwarning")
        }
        else if nodeCount > Int(UserHealthViewModel.shared.recomendSugar) && nodeType == "Sugar" {
            node = SKSpriteNode(imageNamed: ["Sugar/4", "Sugar/5"].randomElement()!)
            makeWarning("Ywarning")
        }
        
        node.position = CGPoint(x: 100, y: 100)
        node.size = CGSize(width: 60, height: 40)
        node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
        addChild(node)
    }
    
    func substractSugar() {
        self.children.first?.removeFromParent()
    }
    
    func makeWarning(_ imageName: String) {
        let warningNode = SKSpriteNode(imageNamed: imageName)
        warningNode.position = self.view!.center
        warningNode.size = CGSize(width: standardSize, height: standardSize)
        warningNode.alpha = 0
        warningNode.zPosition = .infinity
        addChild(warningNode)
        
        warningNode.run(SKAction.repeatForever(fadeInOut))
    }
}
