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
                leftLabel.fontColor = .blue
                rightLabel.fontColor = .white

                
            }else{
                rightLabel.fontColor = .blue
                leftLabel.fontColor = .white
            }
        }
    }
    
    override func sceneDidLoad() {
        hallway = self.childNode(withName: "MyHallway") as! Hallway
        leftLabel = hallway!.childNode(withName: "leftRoomNumber") as! SKLabelNode
        rightLabel = hallway!.childNode(withName: "rightRoomNumber") as! SKLabelNode


    }
    
    func moveCharacter() {
        hallway!.moveCharacter()
    }
    
    func changeRoom(direction: String){
        selectedRoom = direction
        
        //Change UI
    }
    
    func goToRoom(){
        let sceneMoveTo = FirstRoomScene()
        sceneMoveTo.scaleMode = .aspectFill
        let transition = SKTransition.moveIn(with: .down, duration: 0.3)
        view?.presentScene(sceneMoveTo ,transition: transition)

    }
}
