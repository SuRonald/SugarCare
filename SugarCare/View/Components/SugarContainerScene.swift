//
//  SugarContainer.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SpriteKit

class SugarContainerScene: SKScene {
    var sugarCubes: Int = 1
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        for _ in 1...sugarCubes {
            
            let box = SKSpriteNode(imageNamed: ["Sugar1", "Sugar2", "Sugar3"].randomElement()!)
            box.position = view.center
            box.size = CGSize(width: 60, height: 40)
            box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
            addChild(box)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        let box = SKSpriteNode(imageNamed: ["Sugar1", "Sugar2", "Sugar3"].randomElement()!)
        box.position = location
        box.size = CGSize(width: 60, height: 40)
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
        addChild(box)
    }
}
