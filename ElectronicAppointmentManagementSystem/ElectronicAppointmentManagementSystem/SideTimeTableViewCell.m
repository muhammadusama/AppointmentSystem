//
//  SideTimeTableViewCell.m
//  MedMasterPro
//
//  Created by Hanny on 3/19/13.
//
//

#import "SideTimeTableViewCell.h"

@implementation SideTimeTableViewCell

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
    [_timeLabel release];
    [super dealloc];
}
@end
