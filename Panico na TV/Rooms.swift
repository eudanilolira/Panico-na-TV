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
        
        let firstObject = SceneObject(text: "Testando demais, vai dar certo", imageName: "Quarto", pos: CGPoint(x: 100, y: 500), size: CGSize(width: 100, height: 100))
        let secondObject = SceneObject(text: "Testando", imageName: "Quarto", pos: CGPoint(x: 300, y: 100), size: CGSize(width: 100, height: 100))
        let thirdObject = SceneObject(text: "Testando", imageName: "Quarto", pos: CGPoint(x: 600, y: 50), size: CGSize(width: 100, height: 100))
        
        let roomScene = RoomScene(firstObject: firstObject, secondObject: secondObject, thirdObject: thirdObject, backgroundName: "Quarto")
        
        let firstObject1 = SceneObject(text: "Testando demais, vai dar certo", imageName: "Quarto", pos: CGPoint(x: 100, y: 500), size: CGSize(width: 100, height: 100))
        let secondObject1 = SceneObject(text: "Testando", imageName: "Background", pos: CGPoint(x: 300, y: 100), size: CGSize(width: 100, height: 100))
        let thirdObject1 = SceneObject(text: "Testando", imageName: "Quarto", pos: CGPoint(x: 600, y: 50), size: CGSize(width: 100, height: 100))
        
        let roomScene1 = RoomScene(firstObject: firstObject1, secondObject: secondObject1, thirdObject: thirdObject1, backgroundName: "Background")
        
        
        cluesRooms.append(Room(isScary: false, roomScene: roomScene))
        scaryRooms.append(Room(isScary: true, roomScene: roomScene1))
        
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




