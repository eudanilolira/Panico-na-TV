//
//  GameViewController.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 28/05/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var scene: GameScene? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                self.scene = sceneNode
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    setupUpSwipeGestureRecognizer()
                    setupTapGestureRecognizer()
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
    }

    func setupUpSwipeGestureRecognizer() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(moveCharacter))

        swipeRecognizer.direction = .up
        self.view?.addGestureRecognizer(swipeRecognizer)
        
        let swipeRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(switchRoom(sender:)))
        swipeRecognizerLeft.name = "left"
        swipeRecognizerLeft.direction = .left
        self.view?.addGestureRecognizer(swipeRecognizerLeft)
        
        let swipeRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(switchRoom(sender:)))
        swipeRecognizerRight.name = "right"
        swipeRecognizerRight.direction = .right
        self.view?.addGestureRecognizer(swipeRecognizerRight)
    }
    
    func setupTapGestureRecognizer(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToRoom))
        self.view?.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func moveCharacter() {
        self.scene?.moveCharacter()
    }
    
    @objc func switchRoom(sender: UIGestureRecognizer){
        self.scene?.changeRoom(direction: sender.name!)
    }
    
    @objc func goToRoom(){
        if let scene = GKScene(fileNamed: "FirstRoomScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! FirstRoomScene? {
                
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
        
        scene?.goToRoom()

    }
    
    
}
