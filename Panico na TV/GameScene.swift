//
//  GameScene.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 28/05/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftLabel: SKLabelNode = SKLabelNode()
    var rightLabel: SKLabelNode = SKLabelNode()
    var hallway: Hallway? = nil

    
    var selectedRoom: String = "left" {
        didSet{
            if (selectedRoom == "left"){
                leftLabel.fontColor = .red
                rightLabel.fontColor = .white
                
            }else{
                rightLabel.fontColor = .red
                leftLabel.fontColor = .white
            }
        }
    }
    
    override func sceneDidLoad() {
        hallway = self.childNode(withName: "MyHallway") as! Hallway
        leftLabel = hallway!.childNode(withName: "leftRoomNumber") as! SKLabelNode
        rightLabel = hallway!.childNode(withName: "rightRoomNumber") as! SKLabelNode
        Rooms.shared.getNextRooms()
        
        leftLabel.fontSize = 150
        rightLabel.fontSize = 150
        
        leftLabel.zPosition = 10000
        rightLabel.zPosition = 10000
    }
    
    override func update(_ currentTime: TimeInterval) {
        hallway!.moveCharacter(leftRoom: Rooms.shared.leftRoomNumber, rightRoom: Rooms.shared.rightRoomNumber)
    }
    
    func changeRoom(direction: String){
        selectedRoom = direction
    }
}
