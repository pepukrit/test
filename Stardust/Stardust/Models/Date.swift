//
//  Date.swift
//  Stardust
//
//  Created by Ukrit Wattanakulchart on 10/9/2561 BE.
//  Copyright © 2561 Ukrit Wattanakulchart. All rights reserved.
//

import Foundation
import Firebase;

struct Date {
    var allPeriods = [String]();
    
    var date : String?
    
    var tb0800_0830 : String?
    var tb0830_0900 : String?
    
    var tb0900_0930 : String?
    var tb0930_1000 : String?
    
    var tb1000_1030 : String?
    var tb1030_1100 : String?
    
    var tb1100_1130 : String?
    var tb1130_1200 : String?
    
    var tb1200_1230 : String?
    var tb1230_1300 : String?
    
    var tb1300_1330 : String?
    var tb1330_1400 : String?
    
    var tb1400_1430 : String?
    var tb1430_1500 : String?
    
    var tb1500_1530 : String?
    var tb1530_1600 : String?
    
    var tb1600_1630 : String?
    var tb1630_1700 : String?
    
    var tb1700_1730 : String?
    var tb1730_1800 : String?
    
    var tb1800_1830 : String?
    var tb1830_1900 : String?
    
    var tb1900_1930 : String?
    var tb1930_2000 : String?
    
    var tb2000_2030 : String?
    var tb2030_2100 : String?
    
    var tb2100_2130 : String?
    var tb2130_2200 : String?
    
    var tb2200_2230 : String?
    var tb2230_2300 : String?
    
    var tb2300_2330 : String?
    var tb2330_0000 : String?
    
    init?(snap : DataSnapshot){
        
        let timetableData = snap.value as? [String : String];
        
        if let timetableData = timetableData {
            let date = snap.key as! String;
            tb0800_0830 = timetableData["tb0800_0830"];
            tb0830_0900 = timetableData["tb0830_0900"];
            tb0900_0930 = timetableData["tb0900_0930"];
            tb0930_1000 = timetableData["tb0930_1000"];
            tb1000_1030 = timetableData["tb1000_1030"];
            tb1030_1100 = timetableData["tb1030_1100"];
            tb1100_1130 = timetableData["tb1100_1130"];
            tb1130_1200 = timetableData["tb1130_1200"];
            tb1200_1230 = timetableData["tb1200_1230"];
            tb1230_1300 = timetableData["tb1230_1300"];
            tb1300_1330 = timetableData["tb1300_1330"];
            tb1330_1400 = timetableData["tb1330_1400"];
            tb1400_1430 = timetableData["tb1400_1430"];
            tb1430_1500 = timetableData["tb1430_1500"];
            tb1500_1530 = timetableData["tb1500_1530"];
            tb1530_1600 = timetableData["tb1530_1600"];
            tb1600_1630 = timetableData["tb1600_1630"];
            tb1630_1700 = timetableData["tb1630_1700"];
            tb1700_1730 = timetableData["tb1700_1730"];
            tb1730_1800 = timetableData["tb1730_1800"];
            tb1800_1830 = timetableData["tb1800_1830"];
            tb1830_1900 = timetableData["tb1830_1900"];
            tb1900_1930 = timetableData["tb1900_1930"];
            tb1930_2000 = timetableData["tb1930_2000"];
            tb2000_2030 = timetableData["tb2000_2030"];
            tb2030_2100 = timetableData["tb2030_2100"];
            tb2100_2130 = timetableData["tb2100_2130"];
            tb2130_2200 = timetableData["tb2130_2200"];
            tb2200_2230 = timetableData["tb2200_2230"];
            tb2230_2300 = timetableData["tb2230_2300"];
            tb2300_2330 = timetableData["tb2300_2330"];
            tb2330_0000 = timetableData["tb2330_0000"];
            
        }
    }
    
}

