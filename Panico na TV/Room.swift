//
//  Room.swift
//  Panico na TV
//
//  Created by Danilo Araújo on 01/06/21.
//

import Foundation

// Salas 666 e 111 são números fixos, que são as salas finais e a da pablo.
class Room  {
    var isOpen: Bool = false
    var isScary: Bool = false
    var number: Int = 000
    
    init(isScary: Bool, number: Int = 0) {
        self.isScary = isScary
        
        if number != 0 {
            self.number = !isScary ? Int.random(in: 17...166) * 6 : getScaryRoomNumber()
        }
    }
    
    func getScaryRoomNumber() -> Int {
        var number = 000
        
        while number % 6 == 0 {
            number = Int.random(in: 17...142) * 7
        }
        
        return number
    }
    
}
