//
//  MonthCell.m
//  MedMasterPro
//
//  Created by Hanny on 3/26/13.
//
//

#import "MonthCell.h"

@implementation MonthCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
    
}

- (void)dealloc
{
    [_dateLabel release];
    [_appointmentsLabel release];
    [_innerView release];

    [super dealloc];
}
@end
