//
//  Hallway.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 31/05/21.
//

import SpriteKit


class Hallway: SKSpriteNode {
    
    var leftRoomNumber: SKLabelNode = SKLabelNode()
    var rightRoomNumber: SKLabelNode = SKLabelNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
        leftRoomNumber = childNode(withName: "leftRoomNumber") as! SKLabelNode
        rightRoomNumber = childNode(withName: "rightRoomNumber") as! SKLabelNode
        
    }
    
    func moveCharacter(leftRoom: Int, rightRoom: Int) {
        leftRoomNumber.text = "Quarto \(leftRoom)"
        rightRoomNumber.text = "Quarto \(rightRoom)"
    }
}
