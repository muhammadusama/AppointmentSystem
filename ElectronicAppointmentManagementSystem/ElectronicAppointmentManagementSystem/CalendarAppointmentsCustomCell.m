//
//  CalendarCell.m
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import "CalendarAppointmentsCustomCell.h"

@implementation CalendarAppointmentsCustomCell
@synthesize AppointmentTitle;
@synthesize AppointmentLocation;
@synthesize AppointmentTiming;
@synthesize AppointmentNotes;
@synthesize cellInnerView;
@synthesize indicatorButton;
@synthesize ProviderName;

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

-(void)layoutSubviews
{
    //    self.layer.cornerRadius = 2.0;
//    self.layer.borderWidth = 3.0;
//    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)dealloc
{
    [cellInnerView release];
    [AppointmentTitle release];
    [AppointmentLocation release];
    [AppointmentTiming release];
    [AppointmentNotes release];
    [indicatorButton release];
    [super dealloc];
}
@end
