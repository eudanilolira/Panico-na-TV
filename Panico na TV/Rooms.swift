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
        //Criação de salas
        for _ in 0...10 {
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




