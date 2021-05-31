//
//  GameScene.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 28/05/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
    }
    
    func moveCharacter() {
        let hallway = self.childNode(withName: "MyHallway") as! Hallway
        hallway.moveCharacter()
    }
}
