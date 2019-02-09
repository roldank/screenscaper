//
//  Grade.swift
//  ScreenScraper
//
//  Created by Roldan Kramer (student LM) on 2/8/19.
//  Copyright © 2019 Roldan Kramer (student LM). All rights reserved.
//

import Foundation
struct Grade {
    var name: String = ""
    var date: String = ""
    var grade: Int = 0
    var teacher: String = ""
    var course: String = ""
    var quarter: Int = 0
    
    init(date: String, name: String, grade: Int, teacher: String, course: String, quarter: Int) {
        self.date = date
        self.grade = grade
        self.teacher = teacher
        self.course = course
        self.quarter = quarter
    }
}
