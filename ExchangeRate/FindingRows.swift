//
//  FindingRows.swift
//  ExchangeRate
//
//  Created by Maksym on 5/24/18.
//  Copyright © 2018 Maksym. All rights reserved.
//

import Foundation

class FindingRows
{
    func privatRow(index: Int) -> Int?
    {
        var newIndex: Int?
        var i = 0
        
        let tmp: String = ArrayOfDic[index]["ccy"] as! String
        for each in ArrayofDic2
        {
            if (each["cc"] as! String == tmp || (tmp == "RUR" && each["cc"] as! String == "RUB"))
            {
                newIndex = i
            }
            i += 1
        }
        return newIndex
    }

 /*
 **     Костыль с Рублями из-за того, что на приватовском запросе на курс НБУ проводятся тех. роботы
 **     Пришлось использовать Апи НБУ, а у них записано "ruB" вместо приватовского "ruR" ;(
 */
    
    func nbuRow(index: Int) -> Int?
    {
        var newIndex: Int?
        var i = 0
        
        let tmp: String = ArrayofDic2[index]["cc"] as! String
        for each in ArrayOfDic
        {
            if (each["ccy"] as! String == tmp || (tmp == "RUB" && each["ccy"] as! String == "RUR"))
            {
                newIndex = i
            }
            i += 1
        }
        return newIndex
    }
}
