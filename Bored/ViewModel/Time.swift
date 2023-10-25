//
//  Time.swift
//  Bored
//
//  Created by Matteo Perotta on 20/10/23.
//

import Foundation

class Time{
    
    func getCurrentDate() -> String{
        
        let currentDateTime = Date()
        let formatter = DateFormatter();
        formatter.dateFormat = "dd"
        //formatter.timeStyle = .none;
        //formatter.dateStyle = .short;
        
        let dateTimeString = formatter.string(from: currentDateTime)
        //print(dateTimeString)
        return dateTimeString
        
    }
}
