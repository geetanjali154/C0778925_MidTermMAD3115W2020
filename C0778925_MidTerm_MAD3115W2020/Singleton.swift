//
//  Singleton.swift
//  C0778925_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Singelton
{
    
      private static let instance = Singelton()
            private lazy var customerList: [String: Customer] = [:]

            private init(){}

            static func getInstance() -> Singelton
            {
                return instance
            }
            
            func addCustomer(customer: Customer)
            {
                self.customerList.updateValue(customer, forKey: customer.customerId)
            }
            func getAllCustomers() -> [Customer]{
                return Array(customerList.values)
            }
            func loadData()
            {
                
                customerList.updateValue(Customer(customerId: "GG", firstName: "Geetanjali", lastName: "Gupta", emailAddress: "geetgupta@gmail.com",Dob:"20/09/1996",gender: .FEMALE), forKey: "GG")
                 customerList.updateValue(Customer(customerId: "MK", firstName: "Manbeer", lastName: "Kaur", emailAddress: "manu@mail.com",Dob:"05/05/1998",gender: .FEMALE), forKey: "MK")
                //customerList.updateValue(Customer(customerId: "KS", firstName: "Komal", lastName: "Subhra", emailAddress: "komal@gmail.com",Dob:"08/08/1994"), forKey: "KS01")
               // customerList.updateValue(Customer(customerId: "AP", firstName: "Avni", lastName: "Patel", emailAddress: "avni@gmail.com",Dob:"08/08/1994"), forKey: "AP")
               // customerList.updateValue(Customer(customerId: "KK", firstName: "Kamal", lastName: "Kaur", emailAddress: "sandykamal@gmail.com",Dob:"08/08/1994"
               // ), forKey: "KK")
                
                
                
            }
}
