//
//  AverageWaitingTime.swift
//  LeetCodeSolutions
//
//  Created by Augusto Avelino on 20/05/24.
//

import Foundation

/*
 There is a restaurant with a single chef. You are given an array customers, where customers[i] = [arrivali, timei]:

 arrivali is the arrival time of the ith customer. The arrival times are sorted in non-decreasing order.
 timei is the time needed to prepare the order of the ith customer.
 When a customer arrives, he gives the chef his order, and the chef starts preparing it once he is idle. The customer waits till the chef finishes preparing his order. The chef does not prepare food for more than one customer at a time. The chef prepares food for customers in the order they were given in the input.

 Return the average waiting time of all customers. Solutions within 10-5 from the actual answer are considered accepted.
 */
enum AverageWaitingTime {
    class Solution {
        func averageWaitingTime(_ customers: [[Int]]) -> Double {
            var startOfNextMeal = 0.0
            var waitingTimes: [Double] = []
            for i in 0..<customers.count {
                let customer = customers[i]
                
                let arrivalTime = Double(customer[0])
                let waitingTime = Double(customer[1])
                
                let startTime = max(startOfNextMeal, arrivalTime)
                
                let finalWaitingTime = startTime + waitingTime - arrivalTime
                
                startOfNextMeal = startTime + waitingTime
                waitingTimes.append(finalWaitingTime)
            }
            return waitingTimes.reduce(0.0, +) / Double(waitingTimes.count)
        }
    }
}
