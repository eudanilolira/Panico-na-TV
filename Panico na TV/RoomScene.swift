//
//  FirstRoomScene.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 31/05/21.
//

import SpriteKit


class RoomScene: SKScene {
    var room: Room? = nil
    var firstObject: SceneObject
    var secondObject: SceneObject
    var thirdObject: SceneObject
    var background: SKSpriteNode
    var subtitle: SKLabelNode = SKLabelNode(text: "Olá, estou testando")
    
    public init(firstObject: SceneObject, secondObject: SceneObject, thirdObject: SceneObject, backgroundName: String) {
        let frame = CGRect(x:0, y:0, width: 1024, height: 576)
        
        self.firstObject = firstObject
        self.secondObject = secondObject
        self.thirdObject = thirdObject
        self.background = SKSpriteNode(imageNamed: backgroundName)
        
        super.init(size: frame.size)
        self.scaleMode = .aspectFill
        self.setupStyle()
        self.setupChildNodes()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupChildNodes() {
        self.addChild(background)
        self.addChild(firstObject)
        self.addChild(secondObject)
        self.addChild(thirdObject)
        self.addChild(subtitle)
    }
    

    func setupStyle(){
        background.scale(to: CGSize(width: 1024, height: 576))
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        
        self.subtitle.position = CGPoint(x: frame.midX, y: 100)
        self.subtitle.text = self.firstObject.text //CÓDIGO TEMPORARIO
        self.subtitle.fontSize = 30
        self.subtitle.fontColor = .white
        self.subtitle.zPosition = 3
    }
}


class SceneObject: SKSpriteNode {
    var text: String
    
    init(text: String, imageName: String, pos: CGPoint, size: CGSize) {
        let texture = SKTexture(imageNamed: imageName)
        self.text = text
        super.init(texture: texture, color: .black, size: size)
        self.position = pos
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Testando o toque.")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

