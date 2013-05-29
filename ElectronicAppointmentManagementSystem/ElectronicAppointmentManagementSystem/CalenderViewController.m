//
//  CalenderViewController.m
//  MedMaster
//
//  Created by Mani on 5/31/12.
//  Copyright (c) 2012 Master Mobie Products. All rights reserved.
//

#import "CalenderViewController.h"
#import "CheckmarkTile.h"
//#import "RootViewController.h"
//#import "AddPatientViewController.h"
//#import "AddAppointmentViewController.h"

@implementation CalenderViewController
@synthesize delegate = _delegate;
@synthesize parent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void) dealloc{

    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    kal = [[KLCalendarView alloc] initWithFrame:CGRectMake(0, 0, 320, 280) delegate:self];
    kal.delegate = self;
    [self.view addSubview:kal];
}
#pragma mark -
#pragma mark Calendar Delegate Methods
#pragma mark -
- (void)calendarView:(KLCalendarView *)calendarView tappedTile:(KLTile *)aTile
{
	//(@"Date Selected is %@",[aTile date]);
	[aTile flash];
	
	NSString* csSelectedDate = [aTile.date description];
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	//[formatter setDateStyle:NSDateFormatterFullStyle];
	NSDate * invoiceDate = [formatter dateFromString:csSelectedDate];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	NSString * dateString = [formatter stringFromDate:invoiceDate];
	[formatter release];
    if (_delegate != nil) {
 
        [_delegate DateSelected:dateString];
    }
}

- (KLTile *)calendarView:(KLCalendarView *)calendarView createTileForDate:(KLDate *)date{
	CheckmarkTile *tile = [[CheckmarkTile alloc] init];
	return tile;
}

- (void)didChangeMonths{
	
    UIView *clip = kal.superview;
    if (!clip)
        return;
    int height;
	int height1;
	
    CGRect f = clip.frame;
    NSInteger weeks = [kal selectedMonthNumberOfWeeks];
    CGFloat adjustment = 0.f;
    
    switch (weeks) {
        case 4:
            adjustment = 360;//(92/321)*360+30;
			height = 280;
			height1 = 280;
            break;
        case 5:
            adjustment = (46/321)*360;
			height = 320;
			height1 = 320;
            break;
        case 6:
            adjustment = 0.f;
			height = 330;
			height1 = 330;
            break;
        default:
            break;
    }
    f.size.height = 360;// - adjustment;
    clip.frame = f;
	
	kal.frame = CGRectMake(kal.frame.origin.x, kal.frame.origin.y, kal.frame.size.width, height);
	self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, height1);//height-40);
//    if ([self.parent isKindOfClass:[RootViewController class]])
//    {
//        RootViewController *rootVC=(RootViewController *)self.parent;
//        [rootVC.popOverController setPopoverContentSize:CGSizeMake(320, height1-10) animated:YES];
//    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
