//
//  MonthDetailCell.m
//  MedMasterPro
//
//  Created by Hanny on 3/27/13.
//
//

#import "MonthDetailCell.h"

@implementation MonthDetailCell

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
    [_nameLabel release];
    [_locationLabel release];
    [super dealloc];
}
@end
