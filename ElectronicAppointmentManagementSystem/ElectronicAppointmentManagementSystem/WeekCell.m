//
//  WeekCell.m
//  MedMasterPro
//
//  Created by Hanny on 3/18/13.
//
//

#import "WeekCell.h"

@implementation WeekCell

@synthesize firstSlotLabel, secondSlotLabel, thirdSlotLabel, fourthSlotLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
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

- (void) setData:(id)item{
    
}




- (void)dealloc
{
    [firstSlotLabel release];
    [secondSlotLabel release];
    [thirdSlotLabel release];
    [fourthSlotLabel release];
    [super dealloc];
}
@end
