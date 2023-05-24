//
//  SugarContainer.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SpriteKit
import SwiftUI

class SugarContainerScene: SKScene {
    
    var sugarCubes: Int
//    @Binding var sugarCubes: Int
//    var box: SKSpriteNode = SKSpriteNode(imageNamed: ["Sugar1", "Sugar2", "Sugar3"].randomElement()!)
    
    init(_ sugarCubes: Int) {
        self.sugarCubes = sugarCubes
//        _sugarCubes = sugarCubes
        super.init(size: CGSize(width: 350, height: 450))
        self.scaleMode = .fill
        self.backgroundColor = UIColor(named: "PastelGray")!
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sugarCubes = 1
//        _sugarCubes = .constant(1)
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        for _ in 0..<sugarCubes {
            let box = SKSpriteNode(imageNamed: ["Sugar1", "Sugar2", "Sugar3"].randomElement()!)
            box.position = view.center
            box.size = CGSize(width: 60, height: 40)
            box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
            addChild(box)
        }
    }
    
    func addNewSugar() {
        let box = SKSpriteNode(imageNamed: ["Sugar1", "Sugar2", "Sugar3"].randomElement()!)
        box.position = CGPoint(x: 100, y: 100)
        box.size = CGSize(width: 60, height: 40)
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
        addChild(box)
    }
    
    func substractSugar() {
        self.children.first?.removeFromParent()
    }
}
