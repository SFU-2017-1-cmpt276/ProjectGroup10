//
//  CellView.swift
//  Developed by Nathan Cheung
//
//  Inspired by Jeron Thomas (JTAppleCalendar): github.com/patchthecode/JTAppleCalendar
//
//  Using the coding standard provided by eure: github.com/eure/swift-style-guide
//
//  Cell view for the calendar in CalendarViewController. Handles the cell itself and also the text inside.
//
//  Created by Group 10

import JTAppleCalendar


//MARK: CellView


class CellView: JTAppleDayCellView {
   
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet var dayLabel: UILabel!
}
