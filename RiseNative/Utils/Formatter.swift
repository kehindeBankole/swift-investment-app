//
//  Formatter.swift
//  RiseNative
//
//  Created by kehinde on 07/01/2024.
//

import Foundation


func getFormattedCurrency(value : Double) -> String {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencyCode = "USD"
      formatter.currencySymbol = "$"
      
      return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
  }


func formatTime(timeInterval: Int) -> String {
       let minutes = Int(timeInterval) / 60
       let seconds = Int(timeInterval) % 60

       return String(format: "%02d:%02d", minutes, seconds)
   }
