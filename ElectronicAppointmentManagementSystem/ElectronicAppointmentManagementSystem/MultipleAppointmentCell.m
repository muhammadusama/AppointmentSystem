//
//  MultipleAppointmentCell.m
//  MedMasterPro
//
//  Created by TechCorp on 13/05/2013.
//
//

#import "MultipleAppointmentCell.h"

@implementation MultipleAppointmentCell

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
    [_name release];
    [_facility release];
    [super dealloc];
}
@end
