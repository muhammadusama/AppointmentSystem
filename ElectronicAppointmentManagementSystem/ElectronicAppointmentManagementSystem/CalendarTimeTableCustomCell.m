//
//  CalendarTimeTableCustomCell.m
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import "CalendarTimeTableCustomCell.h"

@implementation CalendarTimeTableCustomCell

@synthesize timeLabel;
@synthesize innerViewOne;
@synthesize appointmentTitleLabelOne;
@synthesize locationLabelOne;
@synthesize innerViewTwo;
@synthesize innerViewThree;
@synthesize innerViewFour;
@synthesize appointmentTitleLabelTwo;
@synthesize locationLabelTwo;
@synthesize appointmentTitleLabelThree;
@synthesize locationLabelThree;
@synthesize locationLabelFour;
@synthesize button15;
@synthesize button30;
@synthesize button45;
@synthesize button60;
@synthesize appointmentTitleLabelFour;

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

- (void)dealloc {
    [timeLabel release];
    [innerViewOne release];
    [innerViewTwo release];
    [innerViewThree release];
    [innerViewFour release];
    [appointmentTitleLabelOne release];
    [locationLabelOne release];
    [appointmentTitleLabelTwo release];
    [locationLabelTwo release];
    [appointmentTitleLabelThree release];
    [locationLabelThree release];
    [locationLabelFour release];
    [appointmentTitleLabelFour release];
    [button15 release];
    [button30 release];
    [button45 release];
    [button60 release];
    [super dealloc];
}

-(IBAction)timeTableCellButtonTpd:(id)sender{
    
        
}



@end
