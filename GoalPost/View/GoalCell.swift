//
//  GoalCell.swift
//  GoalPost
//
//  Created by MANAS VIJAYWARGIYA on 03/07/1940 Saka.
//  Copyright © 1940 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    @IBOutlet weak var completionView: UIView!
    
    
    func updateViews(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else{
            self.completionView.isHidden = true
        }
    }
}
