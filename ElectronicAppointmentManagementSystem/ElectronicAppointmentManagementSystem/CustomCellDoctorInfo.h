//
//  CustomCellDoctorInfo.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/9/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellDoctorInfo : UITableViewCell
/////////////////////Outlets for custom cell///////////////
@property (weak, nonatomic) IBOutlet UIImageView *doctorImageCustomCell;
@property (weak, nonatomic) IBOutlet UILabel *nameOfDoctorCustomCellLabel;

@property (weak, nonatomic) IBOutlet UILabel *qualificationAndExpertiseOfDoctorCustomCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *specializationOfDoctorCustomCellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageCustomCell;

@end
