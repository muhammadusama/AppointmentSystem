//
//  LeftAppointmentListCell.m
//  MedMasterPro
//
//  Created by Iqbal on 3/27/13.
//
//

#import "LeftAppointmentListCell.h"

@implementation LeftAppointmentListCell
@synthesize nameLabel;
@synthesize providerLabel;
@synthesize timeLabel;

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
    [nameLabel release];
    [providerLabel release];
    [timeLabel release];
    [super dealloc];
}
@end
