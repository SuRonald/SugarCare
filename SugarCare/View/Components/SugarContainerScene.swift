//
//  SugarContainer.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SpriteKit
import SwiftUI

class SugarContainerScene: SKScene {
    
    var nodeCount: Int
    var nodeType: String
    
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
//        print(nodeType)
        let standardSize = UIScreen.main.bounds.size.width / 3
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        for _ in 0..<nodeCount {
            var node = SKSpriteNode(imageNamed: ["\(nodeType)/1", "\(nodeType)/2", "\(nodeType)/3"].randomElement()!)
            
            if nodeCount > Int(UserHealthViewModel.shared.limitSugarGrams) && nodeType == "Sugar" {
                node = SKSpriteNode(imageNamed: "Sugar/6")
                
                makeWarning("Xwarning")
            }
            else if nodeCount > Int(UserHealthViewModel.shared.recomendSugar) && nodeType == "Sugar" {
                node = SKSpriteNode(imageNamed: ["Sugar/4", "Sugar/5"].randomElement()!)
                
                makeWarning("Ywarning")
            }
            
            node.position = view.center
            node.size = CGSize(width: 60, height: 40)
            node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 40))
            addChild(node)
        }
    }
    
    func addNewSugar() {
        let node = SKSpriteNode(imageNamed: ["\(nodeType)/1", "\(nodeType)/2", "\(nodeType)/3"].randomElement()!)
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
        warningNode.position = view.center
        warningNode.size = CGSize(width: standardSize, height: standardSize)
        warningNode.alpha = 0
        self.addChild(warningNode)
        
        warningNode.run(SKAction.repeatForever(fadeInOut))
    }
}
