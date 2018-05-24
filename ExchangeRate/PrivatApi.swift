//
//  privatApi.swift
//  ExchangeRate
//
//  Created by Maksym on 5/23/18.
//  Copyright © 2018 Maksym. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var ArrayOfDic = [[String : Any]]()
var ArrayofDic2 = [[String : Any]]()

class PrivatApi
{
    func getPrivatRate(completion: @escaping (String?) -> Void)
    {
        guard let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5") else { return }
        
        Alamofire.request(url).responseJSON
        {
            response in
            guard response.result.isSuccess else
            {
                print("Ошибка при запросе данных \(String(describing: response.result.error))")
                return
            }
            guard let json = response.data else { return }
            let jsonapp = JSON(json)
            for item in jsonapp.arrayValue
            {
                ArrayOfDic.append(item.dictionaryObject!)
            }
//            print(ArrayOfDic)
            completion("download finished")
        }
    }
    
    func getNbuRate(completion: @escaping (String?) -> Void)
    {
        guard let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json") else { return }
        Alamofire.request(url).responseJSON
        {
                response in
                guard response.result.isSuccess else
                {
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
//            print(response.value!)
            guard let json = response.data else { return }
            let jsonapp = JSON(json)
            for item in jsonapp.arrayValue
            {
                ArrayofDic2.append(item.dictionaryObject!)
            }
//            print(ArrayofDic2)
            completion("download finished")
        }
    }
}














