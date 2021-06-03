//
//  Rooms.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 31/05/21.
//
import SpriteKit


final class Rooms {
    private var cluesRooms: [Room] = []
    private var scaryRooms: [Room] = []
    
    var leftRoomNumber: Int = 0
    var rightRoomNumber: Int = 0
    
    static let shared = Rooms()
    
    private init() {
        
//
        let animation = SKAction.move(by: CGVector(dx: 300, dy: 0), duration: 5)
        let animation2 = SKAction.rotate(byAngle: 30, duration: 3)
        let animation3 = SKAction.rotate(byAngle: 180, duration: 1)
        
        let firstObject = SceneObject(text: "Nossa, acho que o vento está muito forte!", imageName: "cadeira_bamboo.jpg", pos: CGPoint(x: 100, y: 300), size: CGSize(width: 360, height: 360), animation: [animation, animation2, animation3])
        
        firstObject.setScale(0.5)
//
        
        let firstRoom = RoomScene(firstObject: firstObject, backgroundName: "Quarto")
        
//
        
        //Mirror room
        let secondRoomObject = SceneObject(
            text: "Cair de moto e se ralar",
            imageName: "Espelho.jpg",
            pos: CGPoint(x: 700, y: 300),
            size: CGSize(width: 448, height: 685),
            animation: [
                SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 1),
                SKAction.move(by: CGVector(dx: 0, dy: -300), duration: 2),
                SKAction.rotate(byAngle: 0.8, duration: 1)
            ],
            soundFX: "VideoQuebrando.mp3")
        
        secondRoomObject.setScale(0.3)
        
        let secondRoom = RoomScene(firstObject: secondRoomObject, backgroundName: "Quarto2.png")

        
        //Pablo room
        let thirdRoomObject = SceneObject(
            text: "aaaai, que susto bicha!",
            imageName: "pablo.png",
            pos: CGPoint(x: -500, y: 250),
            size: CGSize(width: 668, height: 373),
            animation: [
                SKAction.moveBy(x: 2160, y: 0, duration: 3)
            ],
            soundFX: "yukee.mp3")
        
        thirdRoomObject.setScale(1)
        
        let thirdRoom = RoomScene(firstObject: thirdRoomObject, backgroundName: "QuartoSangue.png")
        
        var elaineTextures: [SKTexture] = []
               
               for i in 0...25 {
                   let elaineTexture = SKTexture(imageNamed: "fr\(i).png")
                   elaineTextures.append(elaineTexture)
               }
               
               let elaineAnimation = SKAction.repeatForever(SKAction.animate(with: elaineTextures, timePerFrame: 0.03, resize: false, restore: true))
               
               let elaineObject = SceneObject(text: "", imageName: "fr0.png", pos: CGPoint(x: 500, y: 250), size: CGSize(width: 100, height: 160), animation: [elaineAnimation], soundFX: "gritinho.mp3", loopSound: true)
               let elaineRoomScene = RoomScene(firstObject: elaineObject, backgroundName: "Quarto")
                elaineRoomScene.name = "ELine"

        let firstObject3 = SceneObject(text: "não, não! O pior aconteceu, nosso maior medo, nosso maior pânico, o Mac… \n o Mac quebrou… isso quer dizer que não vai rolar fim do challenge, \n não vai rolar, FIM DO JOGO.", imageName: "mac.jpg", pos: CGPoint(x: 200, y: 300), size: CGSize(width: 100 , height: 100), soundFX: "scream.mp3")
        //firstObject3.setScale(0.1)
        
        
        
        let fourthRoom = RoomScene(firstObject: firstObject3, backgroundName: "Quarto3")
        fourthRoom.subtitle.fontSize = 20

        
        cluesRooms.append(Room(isScary: false, roomScene: firstRoom))
//        scaryRooms.append(Room(isScary: true, roomScene: secondRoom))
//        scaryRooms.append(Room(isScary: true, roomScene: elaineRoomScene))
//        scaryRooms.append(Room(isScary: true, roomScene: thirdRoom))
        scaryRooms.append(Room(isScary: true, roomScene: fourthRoom))



        
    }
    
    func getNextRooms() -> (Room, Room) {
        var returnLeftRoom: Room = getScaryRoom()
        var returnRightRoom: Room = getScaryRoom()
        
        let leftRoom = isScaryRoom()
        let rightRoom = isScaryRoom()
        
        let clueRoom: Room = cluesRooms.first(where: { room in
            room.isOpen == false
        })!
        
        if !leftRoom {
            returnLeftRoom = clueRoom
        } else if !rightRoom {
            returnRightRoom = clueRoom
        }
        
        self.rightRoomNumber = returnRightRoom.number
        self.leftRoomNumber = returnLeftRoom.number
        
        return (returnLeftRoom, returnRightRoom)
    }
    
    private func isScaryRoom() -> Bool{
        return Bool.random()
    }
    
    private func getScaryRoom() -> Room {
        return scaryRooms.randomElement()!
    }
}




