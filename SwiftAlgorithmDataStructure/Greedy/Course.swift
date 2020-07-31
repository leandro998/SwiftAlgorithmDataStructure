//
//  Course.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-07-30.
//  Copyright © 2020 Leandro Prado. All rights reserved.
//

import Foundation

func scheduleCourse(_ courses: [[Int]]) -> Int {
    
    guard courses.count > 0 else { return 0 }
    let sortCourse = courses.sorted { (value1, value2) -> Bool in
        if value1.count > 1 && value2.count > 1 {
            if value1[1] == value2[1] {
                return value1[0] < value2[0];
            }
            return value1[1] < value2[1];
        }
        else {
            return false;
        }
    } //end sort
    //check if the 2 value is sorted:
    //print("the sort is: \(sortCourse)")
    
    var list = [Int]();
    var sumDays = 0;
    for i in 0 ..< sortCourse.count {
        let value = sortCourse[i];
        if value.count > 1 {
            //compare if the total length of days is smaller than the next course:
            if sumDays + value[0] <= value[1] {
                list.append(value[0]);
                sumDays += value[0];
            } else {
                //check the list of courses possible
                //print("the list is: \(list)")
                //print("the value is: \(value)")
                list.sort();
                if let lastValue = list.last , lastValue > value[0]{
                    //remove if it is bigger than the last value
                    sumDays -= lastValue;
                    list.removeLast();
                    list.append(value[0]);
                    sumDays += value[0];
                }
            }
        }
    }
    return list.count;
}
