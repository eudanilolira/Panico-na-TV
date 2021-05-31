//
//  Rooms.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 31/05/21.
//
import Foundation


final class Rooms {
    private var cluesRooms: [Room] = []
    private var scaryRooms: [Room] = []
    static let shared = Rooms()
    
    private init() {
        for i in 0...10 {
            cluesRooms.append(Room(isScary: false))
            scaryRooms.append(Room(isScary: true))
        }
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
        
        return (returnLeftRoom, returnRightRoom)
    }
    
    private func isScaryRoom() -> Bool{
        return Bool.random()
    }
    
    private func getScaryRoom() -> Room {
        return scaryRooms.randomElement()!
    }
}

// Salas 666 e 111 são números fixos, que são as salas finais e a da pablo.
class Room  {
    var isOpen: Bool = false
    var isScary: Bool = false
    var number: Int = 000
    
    init(isScary: Bool) {
        self.isScary = isScary
        self.number = !isScary ? Int.random(in: 17...166) * 6 : getScaryRoomNumber()
    }
    
    func getScaryRoomNumber() -> Int {
        var number = 000
        
        while number % 6 == 0 {
            number = Int.random(in: 17...142) * 7
        }
        
        return number
    }
    
}


