//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
    
// init
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }

// takes a currency name as a parameter and returns a new Money that contains the converted amount
  public func convert(_ to: String) -> Money {
    var newAmount = 0
    
    switch (currency, to) {
    case ("USD", "GBP"):
        newAmount = self.amount / 2
    case("USD", "EUR"):
        newAmount = Int(Double(self.amount) * 1.5)
    case("USD", "CAN"):
        newAmount = Int(Double(self.amount) * 1.25)
    case("GBP", "USD"):
        newAmount = self.amount * 2
    case("EUR", "USD"):
        newAmount = Int(Double(self.amount) / 1.5)
    case("CAN", "USD"):
        newAmount = Int(Double(self.amount) / 1.25)
    default:
        newAmount = self.amount
    }
    
    return Money(amount: newAmount, currency: to)
    
  }
    
// take a Money as a parameter and returns a new Money that contains the addition or subtraction of the two
  public func add(_ to: Money) -> Money {
    let converted = self.convert(to.currency)
    let newAmount = converted.amount + to.amount
    
    return Money(amount: newAmount, currency: to.currency)
    
  }
    
  public func subtract(_ from: Money) -> Money {
    let converted = self.convert(from.currency)
    let newAmount =  from.amount - converted.amount
    
    return Money(amount: newAmount, currency: from.currency)
  }
}


////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  

  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }

//  returns the amount of money
  open func calculateIncome(_ hours: Int) -> Int {
    switch self.type {
    case .Hourly(let val):
        return Int(val) * hours
    case .Salary(let val):
        return val
    }
  }
  
  open func raise(_ amt : Double) {
    switch self.type {
    case .Hourly(let val):
        self.type = JobType.Hourly(val + amt)
    case .Salary(let val):
        self.type = JobType.Salary(val + Int(amt))
    }
    
  }
}

/*
////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}*/





