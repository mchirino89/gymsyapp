//
//  ResultList.swift
//  GymsyApp
//
//  Created by Mauricio Chirino on 7/9/17.
//  Copyright © 2017 3CodeGeeks. All rights reserved.
//

import JSONHelper

final class ResultList: Deserializable {
    
    private(set) var result:[ResultDetails]?
    
    required init(dictionary: [String : Any]) {
        result <-- dictionary[Constants.JSONResponseKey.results]
    }
    
    required init(dictionary: [String : Any], kindOfResult: Int) {
        switch kindOfResult {
        case Constants.kindOfResult.mainMuscle.rawValue:
            result <-- dictionary[Constants.JSONResponseKey.exercises.mainMuscle]
        case Constants.kindOfResult.secondaryMuscles.rawValue:
            result <-- dictionary[Constants.JSONResponseKey.exercises.secondaryMuscles]
        default:
            result <-- dictionary[Constants.JSONResponseKey.exercises.neededEquipment]
        }
    }
}