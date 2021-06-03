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
        
        let firstObject = SceneObject(text: "Nossa, acho que o vento está muito forte!", imageName: "cadeira_bamboo.jpg", pos: CGPoint(x: 100, y: 300), size: CGSize(width: 360, height: 360), animation: [animation, animation2, animation3], soundFX: "Piano Background.mp3")
        
        firstObject.setScale(0.5)
//
        
        let firstRoom = RoomScene(firstObject: firstObject, backgroundName: "Quarto")
        
//
        
        
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
//
        
        let firstObject1 = SceneObject(text: "Testando demais, vai dar certo", imageName: "Quarto", pos: CGPoint(x: 100, y: 300), size: CGSize(width: 100, height: 100))
        let secondObject1 = SceneObject(text: "Testando", imageName: "Background", pos: CGPoint(x: 300, y: 300), size: CGSize(width: 100, height: 100))
        let thirdObject1 = SceneObject(text: "Testando", imageName: "Quarto", pos: CGPoint(x: 600, y: 400), size: CGSize(width: 100, height: 100))
        
        let roomScene1 = RoomScene(firstObject: firstObject1, secondObject: secondObject1, thirdObject: thirdObject1, backgroundName: "Background")
        
        
        cluesRooms.append(Room(isScary: false, roomScene: roomScene1))
        scaryRooms.append(Room(isScary: true, roomScene: firstRoom))
        scaryRooms.append(Room(isScary: true, roomScene: secondRoom))
        
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




