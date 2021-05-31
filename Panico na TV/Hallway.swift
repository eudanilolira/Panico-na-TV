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
    
    func moveCharacter() {
        let rooms = Rooms.shared.getNextRooms()
        let leftRoom = rooms.0
        let rightRoom = rooms.1
        
        leftRoomNumber.text = "Quarto \(leftRoom.number)"
        rightRoomNumber.text = "Quarto \(rightRoom.number)"
        
    }
}
