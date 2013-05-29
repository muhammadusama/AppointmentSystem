//
//  CustomCellForDoctorPopOver.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/20/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "CustomCellForDoctorPopOver.h"
@implementation CustomCellForDoctorPopOver
@synthesize firstNameDoctorCustomCellLabel;
@synthesize qualificationDoctorCustomCellLabel;
@synthesize specializationDoctorCustomCellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
