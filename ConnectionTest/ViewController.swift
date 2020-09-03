//
//  ViewController.swift
//  ConnectionTest
//
//  Created by Kit Clark-O'Neil on 2020-09-03.
//  Copyright © 2020 Christopher Clark-O'Neil. All rights reserved.
//

//
//  ViewController.swift
//  PlantConnection
//
//  Created by Kit Clark-O'Neil on 2020-07-07.
//  Copyright © 2020 Christopher Clark-O'Neil. All rights reserved.
//

import UIKit

class PlantConnectionVC: UIViewController {

    
@IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label6: UILabel!
    
@IBOutlet weak var label3: UILabel!
    
    //Color Constants
    let navyBlue = UIColor.init(hex:"#204059ff")
    let orange = UIColor.init(hex:"#ff6e40ff")
    let yellow  = UIColor.init(hex:"#ffc13bff")
    let beige = UIColor.init(hex:"#f5f0e1ff")
    var currentTicket: Ticket?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebServer.createServer()
        self.view.backgroundColor = navyBlue
        view.backgroundColor = navyBlue
        
        
        
       
       

    }
    
}

func createTicketFromDict(dict: [String: String]) -> Ticket? {
    var newTicket: Ticket
    if let tonnage = dict["tonnage"], let address =  dict["address"], let phoneNumber = dict["phoneNumber"], let siteID = dict["siteID"], let ticketNumber = dict["vehicle"], let account = dict["account"], let vehicleNumber =  dict["vehicleNumber"], let zone = dict["zone"], let material =  dict["material"], let jobNumber =  dict["jobNumber"], let weightToday = dict["weightToday"], let weightToDate =  dict["weightToDate"], let date = dict["date"], let deliveryAddress =  dict["deliveryAddress"], let grossTonnage = dict["grossTonnage"], let tareTonnage = dict["tareTonnage"], let netTonnage = dict["netTonnage"] {
     newTicket = Ticket(tonnage: tonnage, address: address, phoneNumber: phoneNumber, siteID: siteID, ticketNumber: ticketNumber, account: account, vehicleNumber: vehicleNumber, zone: zone, material: material, jobNumber: jobNumber, weightToday: weightToday, weightToDate: weightToDate, date: date, deliveryAddress: deliveryAddress, grossTonnage: grossTonnage, tareTonnage: tareTonnage, netTonnage: netTonnage)
        return newTicket
    }
    return nil
    
}
func updateUI() {
    
}

    
    func parseStringToDictionary(receivedMessage: String) {
        
        var ticketInfoDict: [String : String] = [:]
        var keyString = ""
        var valueString = ""
        var isKey = true
        for character in receivedMessage {
            if character == " " {
                if isKey == true {
                isKey = false
                    if keyString == "Done" {
                        //call updateUI func
                    }
            }
                if isKey == false {
                    isKey = true
                    ticketInfoDict.updateValue(valueString, forKey: keyString)
                }
        }
            else if isKey == true {
                keyString.append(character)
            }
            else {
                valueString.append(character)
            }
        }
    }

    extension UIColor {
        public convenience init?(hex: String) {
            let r, g, b, a: CGFloat

            if hex.hasPrefix("#") {
                let start = hex.index(hex.startIndex, offsetBy: 1)
                let hexColor = String(hex[start...])

                if hexColor.count == 8 {
                    let scanner = Scanner(string: hexColor)
                    var hexNumber: UInt64 = 0

                    if scanner.scanHexInt64(&hexNumber) {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255

                        self.init(red: r, green: g, blue: b, alpha: a)
                        return
                    }
                }
            }
            return nil
        }
    }


