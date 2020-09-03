//
//  Ticket.swift
//  PlantConnection
//
//  Created by Kit Clark-O'Neil on 2020-07-26.
//  Copyright © 2020 Christopher Clark-O'Neil. All rights reserved.
//

import UIKit

class Ticket: NSObject {

    
    let tonnage: String, address: String, phoneNumber: String, siteID: String, ticketNumber: String, account: String, vehicleNumber: String, zone: String, material: String, jobNumber: String, weightToday: String, weightToDate: String, date: String, deliveryAddress: String, grossTonnage: String, tareTonnage: String, netTonnage: String
    
    init(tonnage: String, address: String, phoneNumber: String, siteID: String, ticketNumber: String, account: String, vehicleNumber: String, zone: String, material: String, jobNumber: String, weightToday: String, weightToDate: String, date: String, deliveryAddress: String, grossTonnage: String, tareTonnage: String, netTonnage: String) {
        self.tonnage = tonnage
        self.address = address
        self.phoneNumber = phoneNumber
        self.siteID = siteID
        self.ticketNumber = ticketNumber
        self.account = account
        self.vehicleNumber = vehicleNumber
        self.zone = zone
        self.material = material
        self.jobNumber = jobNumber
        self.weightToday = weightToday
        self.weightToDate = weightToDate
        self.date = date
        self.deliveryAddress = deliveryAddress
        self.grossTonnage = grossTonnage
        self.tareTonnage = tareTonnage
        self.netTonnage = netTonnage
    }

}
