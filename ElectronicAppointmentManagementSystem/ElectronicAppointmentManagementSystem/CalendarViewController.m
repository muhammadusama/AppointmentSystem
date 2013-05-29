//
//  CalendarViewController.m
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import "CalendarViewController.h"
#import "CalendarAppointmentsCustomCell.h"
#import "CalenderViewController.h"
#import "CalendarTimeTableCustomCell.h"
//#import "Appointment.h"
//#import "ServiceManager.h"
#import "CheckmarkTile.h"
//#import "MedMasterProAppDelegate.h"
//#import "ATMHud.h"
//#import "VisitViewController.h"
//#import "BlockAlertView.h"
//#import "DetailViewController.h"
//#import "AddAppointmentViewController.h"
//#import "BlockAlertView.h"
#import "WeekCell.h"
#import "SideTimeTableViewCell.h"
#import "MonthCell.h"
#import "YearCell.h"

#import "LeftAppointmentListCell.h"

#import "MonthCellDetailViewController.h"
#import "MultipleAppointmentsViewController.h"


@interface CalendarViewController ()

@end

@implementation CalendarViewController
@synthesize leftSideDayList;
@synthesize rightSideDayList;
@synthesize dayLabel;
@synthesize dateMonthLabel;
@synthesize listHeaderView;
@synthesize dateLabel;
@synthesize completeDateLabel;
@synthesize yearLabel;
@synthesize appointmentsTableView;
@synthesize calenderBackGroundView;
@synthesize timeTableView;
@synthesize dayView;
@synthesize weekView;
@synthesize weekTopDateLabel;
@synthesize innerView;
@synthesize dayLeftSideView;
@synthesize dayRightSideView;
@synthesize listView;
@synthesize weekCollectionView;
@synthesize selectedDate;
@synthesize appointmentArray;
@synthesize myCalendarDelegate;
@synthesize csSelectedDate;
@synthesize csSelectedTime;
@synthesize pAppointmentsParent;
@synthesize pWeekDataSource;
@synthesize segementSelectedIndex;

@synthesize pVisibleMonthDatesArray;
@synthesize pMonthDataSource;
@synthesize yearViewLabel;
@synthesize firstDayOfMonth;
@synthesize rightSideListDataSource;
@synthesize rightListTopHeaderAppointmentTitle;
@synthesize rightListTopHeaderDateLabel;
@synthesize pVisibleWeekDatesArray;
@synthesize popoverController;
@synthesize pDataSource;

#pragma mark - View LifeCycle
/*****************************************************************************************************************/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
      
        // Custom initialization
    }
    return self;
}


/*****************************************************************************************************************/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This method is responsible for configuring the View. It shows the Date in required format and refreshes the
// tables if segment is changed.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)ConfigureView
//{
//    
//        if(fromViewDidLoad)
//        {
//            
//            NSDate *localDate = [NSDate date];
//            NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc]init]autorelease];
//            timeFormatter.dateFormat = @"HH:mm:ss";
//            NSString *dateString = [timeFormatter stringFromDate: localDate];
//            NSArray *subStrings = [dateString componentsSeparatedByString:@":"];
//            if ([subStrings count]>1)
//            {
//                NSString *hourString = [subStrings objectAtIndex:0];
//                [self.timeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[hourString integerValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//            }
//            fromViewDidLoad = NO;
//        }
//    
//        NSDate * today = self.selectedDate;
//        [[ServiceManager SharedObject] setSelectedDateInCalendar:self.selectedDate];
//         
//        NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//        
//        [formatter setDateFormat:@"EEEE, MMMM d yyyy"];
//        
//        NSString *pString = [formatter stringFromDate:today];
//                
//        NSArray *subStrings = [pString componentsSeparatedByString:@","];
//        NSString *dayString;
//        if (subStrings.count>0)
//        {
//            dayString = [subStrings objectAtIndex:0];
//        }
//    
//        NSString *completeDateString = [subStrings objectAtIndex:1];
//        
//        NSArray *dateComponentStrings = [completeDateString componentsSeparatedByString:@" "];
//        NSString *monthString = [dateComponentStrings objectAtIndex:1];
//        NSString *dateString = [dateComponentStrings objectAtIndex:2];
//        NSString *yearString = [dateComponentStrings objectAtIndex:3];
//        
//        [self.dateLabel setText:[NSString stringWithFormat:@"%@",dateString]];
//        [self.completeDateLabel setText:[NSString stringWithFormat:@"%@, %@ %@",dayString,monthString, dateString]];
//        [self.yearLabel setText:[NSString stringWithFormat:@"%@",yearString]];
//           
//        csSelectedDate = [[NSString alloc]initWithString:dateString];
//    
//        [self.appointmentsTableView reloadData];
//        [self.timeTableView reloadData];
//    
//    if (segementSelectedIndex == 1)
//    {
//        [self PopulateArrayForWeekCollectionView];
//        [self.weekCollectionView reloadData];
//    }
//    else if (segementSelectedIndex == 2)
//    {
//        [self setMonthChart];
//        dateCounter = 1;
//        firstDayNotFound = TRUE;
//        newMonthStarted = FALSE;
//        [self.monthCollectionView reloadData];
//    }
//    else if (segementSelectedIndex == 4)
//    {
//        [self GetUniqueDatesFromAppointmentArray];
//        NSPredicate* numberOfRowsPredicate = [NSPredicate predicateWithFormat:@"csAppointmentDate=%@", [uniqueDatesArray objectAtIndex:0]];
//        self.rightSideListDataSource = [NSMutableArray arrayWithArray:[self.appointmentArray filteredArrayUsingPredicate:numberOfRowsPredicate]];
//        [self.rightSideDayList reloadData];
//        [self.leftSideDayList reloadData];
//    }
//        
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// The time sort function for pDataSource
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//NSComparisonResult timeSort(Appointment *s1, Appointment *s2, void *context)
//{
//   
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"hh:mm a"];
//    
//    NSDate *d1 = [formatter dateFromString:s1.csStartTime];
//    NSDate *d2 = [formatter dateFromString:s2.csStartTime];
//    
//    return [d1 compare:d2]; // ascending order
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method populates the Array for Daily Calendar to be used in TableView and then configures the View.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) PopulateArrayForTableView
//{
//    Appointment *pCurrObject;
//    self.pDataSource = [[NSMutableArray alloc]init];
//    for (int i =0; i < [self.appointmentArray count]; i++)
//    {
//        if (i == 0)
//            pCurrentObject = [self.appointmentArray objectAtIndex:i];
//        pCurrObject = [self.appointmentArray objectAtIndex:i];
//        NSString *dateCheck = [NSString stringWithFormat:@"%@",pCurrObject.csAppointmentDate];
//        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//        [dateFormat setDateFormat:@"MM/dd/yyyy"];
//        if(fromViewDidLoad)
//        {
//            NSDate * today = [NSDate date];
//            self.selectedDate = today;
//        }
//
//        
//        NSString *dateString = [dateFormat stringFromDate:self.selectedDate];
//        [dateFormat release];
//        
//        if ([dateCheck isEqualToString:dateString])
//        {
//            [self.pDataSource addObject:pCurrObject];
//        }
//    }
//    
//    /*
//     Ticket # 852 - Fixed by Hanny Tufail : Dated May 14, 2013
//     Description:  Now the Appointments in the LeftTable of Daily calendar are sorted in ascending order.
//     */
//    
//    NSArray *sortedArray = [self.pDataSource sortedArrayUsingFunction:timeSort context:nil];
//    self.pDataSource = [sortedArray mutableCopy];
//        
//    [self ConfigureView];
//}
//
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method populates the Array for Weekly Calendar to be used in TableView and then configures the View.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) PopulateArrayForWeekCollectionView
//{
//    // Array of Dictionaries with Key (Visible Dates of week in the Calendar) and Value (Array of Appointment Objects on that date);
//    
//    
//    if (self.pWeekDataSource)
//    {
//        [self.pWeekDataSource removeAllObjects];
//    }
//    else
//    {
//        self.pWeekDataSource = [[[NSMutableArray alloc] init] autorelease];
//    }
//    
//    
//    for (NSString *date in self.pVisibleWeekDatesArray)
//    {
//        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
//        NSMutableArray * array = [[NSMutableArray alloc] init];
//        
//       
//        for (Appointment *obj in self.appointmentArray)
//        {
//            if ([obj.csAppointmentDate isEqualToString:date])
//            {
//                [array addObject:obj];
//                
//            }
//        }
//        
//        [dictionary setObject:array forKey:date];
//        [self.pWeekDataSource addObject:dictionary];
//        
//        
//    }
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method extracts the appointments for a Particular Month from Main array and returns the count.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(int)FetchAppointmentsForThisMonthCell:(NSString *)dateOfCell
//{
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    NSDate *formatedDate = [formatter dateFromString:dateOfCell];
//    dateOfCell = [formatter stringFromDate:formatedDate];
//    
//    
//    NSMutableArray * dataArray = [self.appointmentArray mutableCopy];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csAppointmentDate == %@",dateOfCell];
//    [dataArray filterUsingPredicate:predicate];
//
//    return dataArray.count;
//}
//
//#pragma view Lifecycle.
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) viewWillAppear:(BOOL)animated{
//
//    [super viewWillAppear:YES];
//    
//    NSDate *localDate = [NSDate date];
//    NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc]init]autorelease];
//    timeFormatter.dateFormat = @"HH:mm:ss";
//    NSString *dateString = [timeFormatter stringFromDate: localDate];
//    NSArray *subStrings = [dateString componentsSeparatedByString:@":"];
//    if ([subStrings count]>1)
//    {
//        NSString *hourString = [subStrings objectAtIndex:0];
//        [self.timeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[hourString integerValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    }
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
//    isBubbleShown = NO;
//    arrayOfindexPaths = [[NSMutableArray alloc]init];
//    self.pVisibleWeekDatesArray  = [[[NSMutableArray alloc]init] autorelease];
//    self.pVisibleMonthDatesArray = [[[NSMutableArray alloc]init] autorelease];
//    [[ServiceManager SharedObject] setCalenderViewController:self];
//    fromViewDidLoad = YES;
//    
//    IndexOfCell = -1;
    self.calenderBackGroundView.frame = CGRectMake(self.calenderBackGroundView.frame.origin.x, self.calenderBackGroundView.frame.origin.x, 250, 250);
    m_pCalendarView = [[KLCalendarView alloc] initWithFrame:CGRectMake(0, 0, 320, 320) delegate:self];
    m_pCalendarView.delegate = self;
//
    [self.calenderBackGroundView addSubview:m_pCalendarView];
    [self.calenderBackGroundView.layer setBorderColor:[[UIColor brownColor] CGColor]];
    [self.calenderBackGroundView.layer setBorderWidth:2.0];
    
    NSDate * today = [NSDate date];
    self.selectedDate = today;
    self.appointmentArray = [[NSMutableArray alloc]init];
    [self.innerView addSubview:self.dayView];
//    self.appointmentArray=[[ServiceManager SharedObject] pAppointmentDataSource];
//    if (![self.appointmentArray count]>0)
//    {
//        [[ServiceManager SharedObject ] GetAppoinmentsData];
//    }
//    else
//    {
//        [self PopulateArrayForTableView];
//        
//    }
//    //Creating delete button for action sheet
//    
//    ///////////////////////////////////////////////////Week Calendar//////////////////////////////////////////////////////////
//    
//	[self.weekCollectionView registerClass:[WeekCell class] forCellWithReuseIdentifier:@"WeekCell"];
//    self.weekCollectionView.layer.borderWidth = 1.0;
//    self.weekCollectionView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    self.weekHeaderView.layer.borderWidth = 1.0;
//    self.weekHeaderView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:NSDayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit fromDate:[NSDate date]];//[NSDateComponents new];
//    
//    components.weekOfYear = [[calendar components: NSWeekOfYearCalendarUnit fromDate:[NSDate date]] weekOfYear];
//    weekOftheYear = components.weekOfYear;
//    
////    [self.weekCollectionView registerClass:[ResourceSectionView class] forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"ResourceSectionHeader"];
//	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    ///////////////////////////////////////////////////Month Calendar//////////////////////////////////////////////////////////
//    
//     weekDaysArray =[NSArray arrayWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
//    [weekDaysArray retain];
//    
//    [self.monthCollectionView registerClass:[MonthCell class] forCellWithReuseIdentifier:@"MonthCell"];
//    self.monthCollectionView.layer.borderWidth = 1.0;
//    self.monthCollectionView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    self.monthHeaderView.layer.borderWidth = 1.0;
//    self.monthHeaderView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    monthOftheYear = components.month;
//    
//    [self.yearCollectionView registerClass:[YearCell class] forCellWithReuseIdentifier:@"YearCell"];
//    
//    NSCalendar *calendars = [NSCalendar currentCalendar];
//    NSDateComponents *dateComponents = [NSDateComponents new];
//
//    dateComponents.month = [[calendars components: NSMonthCalendarUnit fromDate:[NSDate date]] month];
//    monthOftheYear = components.month;
//    
//    currentYear = [[calendars components: NSYearCalendarUnit fromDate:[NSDate date]] year];;
//    
//    self.yearViewLabel.text = [NSString stringWithFormat:@"%i", currentYear];
//    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    ///////////////////////////////////////////////////List Calendar//////////////////////////////////////////////////////////
//    self.rightSideListDataSource = [[[NSMutableArray alloc]init] autorelease];
//    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	    
//    // Do any additional setup after loading the view from its nib.
//    subMenuOptionsSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//    
//    [subMenuOptionsSheet addButtonWithTitle:@"Start Visit"];
//    [subMenuOptionsSheet addButtonWithTitle:@"Edit Appointment"];
//    [subMenuOptionsSheet addButtonWithTitle:@"Edit Patient"];
//    [subMenuOptionsSheet addButtonWithTitle:@"Patient Chart"];
//    [subMenuOptionsSheet addButtonWithTitle:@"Delete Appointment"];
//    [subMenuOptionsSheet setDestructiveButtonIndex:4];
//    
    

}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//	return YES;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)dealloc {
//    [dateLabel release];
//    [completeDateLabel release];
//    [appointmentsTableView release];
//    [timeTableView release];
//    [dayView release];
//    [weekView release];
//    [weekTopDateLabel release];
//    //[segmentBar release];
//    [innerView release];
//    [dayLeftSideView release];
//    [dayRightSideView release];
//    [weekCollectionView release];
//    [yearLabel release];
//    [calenderBackGroundView release];
//    [_sundayLabel release];
//    [_mondayLabel release];
//    [_tuesdayLabel release];
//    [_wednesdayLabel release];
//    [_thursdayLabel release];
//    [_fridayLabel release];
//    [_saturdayLabel release];
//    [_weekHeaderView release];
//    [_sideTimeTableView release];
//    [pVisibleWeekDatesArray release];
//    [pWeekDataSource release];
//    [_monthView release];
//    [_monthTopLabel release];
//    [_monthCollectionView release];
//    [_monthHeaderView release];
//
//    [pVisibleMonthDatesArray release];
//    [pMonthDataSource release];
//
//    [yearViewLabel release];
//    [_yearCollectionView release];
//    [_yearView release];
//    [listView release];
//    [leftSideDayList release];
//    [rightSideDayList release];
//    [listYearLabel release];
//    [listDateLabel release];
//    [dayLabel release];
//    [dateMonthLabel release];
//    [listHeaderView release];
//    [rightSideListDataSource release];
//    
//    [rightListTopHeaderAppointmentTitle release];
//    [rightListTopHeaderDateLabel release];
//    [super dealloc];
//}
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)viewDidUnload
//{
//    [self setDateLabel:nil];
//    [self setCompleteDateLabel:nil];
//    [self setAppointmentsTableView:nil];
//    [self setTimeTableView:nil];
//    [self setDayView:nil];
//    [self setWeekView:nil];
//    [self setWeekTopDateLabel:nil];
//   // [self setSegmentBar:nil];
//    [self setInnerView:nil];
//    [self setDayLeftSideView:nil];
//    [self setDayRightSideView:nil];
//    [self setWeekCollectionView:nil];
//    [self setYearLabel:nil];
//    [self setCalenderBackGroundView:nil];
//    [super viewDidUnload];
//}
//
//#pragma mark -
//#pragma mark KICalender Delegate Method
//
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This delegate method is called when a tile (any date) is selected from KICalendar. It refreshes the view with
//// the appointments of new selected Date.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)calendarView:(KLCalendarView *)calendarView tappedTile:(KLTile *)aTile{
//    
//   ((CheckmarkTile*)aTile).checkmarked = TRUE;
//    
//    IndexOfCell = -1;
//    if (csSelectedDate != nil)
//    {
//        // Ticket#617 Status = Changes done , Done By Imran Ali, Date:06/12/2012
//        // Description:  multiple dots issue on selection from appointment list, fixed by adding setNeedsDisplay. Please review it.
//        if(prevTile != aTile)
//        {
//            ((CheckmarkTile*)prevTile).checkmarked = FALSE;
//            [prevTile setNeedsDisplay];
//            [prevTile release];
//            prevTile = aTile;
//            [prevTile retain];
//        }
//        
//        KLTile * pT = [calendarView getTileFromDate:csSelectedDate];
//        if (pT && pT!= aTile)
//        {
//            ((CheckmarkTile*)pT).checkmarked = FALSE;
//            // Ticket#605 Status = Changes done , Done By Imran Ali, Date:05/12/2012
//            // Description:  double flash on previous value and new value, fixed by adding setNeedsDisplay. Please review it.
//            [pT setNeedsDisplay];
//        }
//        [csSelectedDate release];
//        csSelectedDate = nil;
//    }
//    
//    [aTile flash];
//    
//        
//    csSelectedDate = [[NSString alloc]initWithString:aTile.text];
//    
//    NSString* csSelectedDatee = [aTile.date description];
//	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//	[formatter setDateFormat:@"yyyy-MM-dd"];
//	NSDate * dateFromString = [formatter dateFromString:csSelectedDatee];
//	[formatter release];
//    
//    if(self.yearView.superview)
//    {
//        [self.yearView removeFromSuperview];
//        [self.innerView addSubview:self.dayView];
//        self.pAppointmentsParent.selectCalendarTypeSegmentBar.selectedSegmentIndex = 0;
//        [self displayMonthForData:dateFromString andView:m_pCalendarView];
//        segementSelectedIndex = 0;
//    }
//	
//    self.selectedDate=dateFromString;
//    
//    if (greenWayAPIselected)
//    {
//        if (![selectedCalendarDateForGreenway isEqualToString:@""])
//        {
//            [selectedCalendarDateForGreenway release];
//        }
//        selectedCalendarDateForGreenway = [[NSString alloc]initWithString:csSelectedDatee];      
//        [self GetAppoinmentsDataForGreenwayOnDateSelection];
//    }
//    else
//    {
//       [self PopulateArrayForTableView];
//    }
//    
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (KLTile *)calendarView:(KLCalendarView *)calendarView createTileForDate:(KLDate *)date
//{
//	CheckmarkTile *tile = [[CheckmarkTile alloc] init];
//	return tile;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method is called when Month is changed from KICalendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)didChangeMonths
//{
//	
//    UIView *clip = m_pCalendarView.superview;
//    if (!clip)
//        return;
//    int height;
//	int height1;
//	
//    CGRect f = clip.frame;
//    NSInteger weeks = [m_pCalendarView selectedMonthNumberOfWeeks];
//    CGFloat adjustment = 0.f;
//    
//    switch (weeks) {
//        case 4:
//            adjustment = 360;//(92/321)*360+30;
//			height = 280;
//			height1 = 280;
//			//height1 =
//            break;
//        case 5:
//            adjustment = (46/321)*360;
//			height = 310;
//			height1 = 310;
//            break;
//        case 6:
//            adjustment = 0.f;
//			height = 330;
//			height1 = 340;
//            break;
//        default:
//            break;
//    }
//    f.size.height = 360;// - adjustment;
//    clip.frame = f;
//	
//	m_pCalendarView.frame = CGRectMake(m_pCalendarView.frame.origin.x, m_pCalendarView.frame.origin.y, m_pCalendarView.frame.size.width, height);
//	calenderBackGroundView.frame = CGRectMake(calenderBackGroundView.frame.origin.x, calenderBackGroundView.frame.origin.y, calenderBackGroundView.frame.size.width, height1);
//}
//
//#pragma mark -
//#pragma mark Request To Server
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method requests the Server to delete a particular appointment of a Patient.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) DeleteAppointment
//{
//    NSString* appointmentID = [pCurrentObject csappointmentID];
//    m_pURLRequest = [[ASyncURL alloc] init];
//	
//	// Set current class to AsyncUrl delegate class.
//	m_pURLRequest.delegate = self;
//	NSMutableString *httpBodyString = [NSMutableString stringWithCapacity: 0];
//    [httpBodyString appendFormat: @"token=%@",[[ServiceManager SharedObject] userToken]];
//    [httpBodyString appendFormat: @"&id=%@", appointmentID];
//    
//    NSString *URL=[NSString stringWithFormat:@"%@deleteappointment.php",[[ServiceManager SharedObject] ServiceBaseURL]];
//	
//	if (URL != nil && URL != 0)
//	{
//		// Display of progress mechanism should be integrated here.
//		
//		[m_pURLRequest setCallType:URL_TYPE_DELETE_APPOINMENT];
//		[m_pURLRequest startCustomUrlRequest:[NSURL URLWithString:URL] :@"POST" :httpBodyString];
//        
//	}
//
//}
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method fetches the Appointment List of a particular date from Server.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) GetAppoinmentsData
//{
//    
//    // Alloc and initialize AsyncUrl class.
//	m_pURLRequest = [[ASyncURL alloc] init];
//	
//	// Set current class to AsyncUrl delegate class.
//	m_pURLRequest.delegate = self;
//	NSMutableString *httpBodyString = [NSMutableString stringWithCapacity: 0];
//    [httpBodyString appendFormat: @"token=%@",[[ServiceManager SharedObject] userToken]];
//    [httpBodyString appendFormat: @"&fromDate=%@", self.dateLabel.text];
//    
//    NSString *URL=[NSString stringWithFormat:@"%@searchappointments.new.php",[[ServiceManager SharedObject] ServiceBaseURL]];
//	
//	if (URL != nil && URL != 0)
//	{
//		// Display of progress mechanism should be integrated here.
//		
//		[m_pURLRequest setCallType:URL_TYPE_GET_APPOINMENTS_HIDDEN];
//		[m_pURLRequest startCustomUrlRequest:[NSURL URLWithString:URL] :@"POST" :httpBodyString];
//                
//	}
//    
//}
//
//- (void) GetAppoinmentsDataForGreenwayOnDateSelection
//{
//    
//    // Alloc and initialize AsyncUrl class.
//	m_pURLRequest = [[ASyncURL alloc] init];
//	
//	// Set current class to AsyncUrl delegate class.
//	m_pURLRequest.delegate = self;
//	NSMutableString *httpBodyString = [NSMutableString stringWithCapacity: 0];
//    [httpBodyString appendFormat: @"token=%@",[[ServiceManager SharedObject] userToken]];
//    [httpBodyString appendFormat: @"&fromDate=%@", selectedCalendarDateForGreenway];
//    [httpBodyString appendFormat: @"&endDate=%@", selectedCalendarDateForGreenway];
//    
//    NSString *URL=[NSString stringWithFormat:@"%@searchappointments.new.php",[[ServiceManager SharedObject] ServiceBaseURL]];
//	
//	if (URL != nil && URL != 0)
//	{
//		// Display of progress mechanism should be integrated here.
//		
//		[m_pURLRequest setCallType:URL_TYPE_GET_APPOINMENTS];
//		[m_pURLRequest startCustomUrlRequest:[NSURL URLWithString:URL] :@"POST" :httpBodyString];
//        
//	}
//    
//}
//
//
//#pragma mark -
//#pragma mark UICollectionView Delegate
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    
//    int sectionCount = 0;
//    if (collectionView == self.weekCollectionView)
//    {
//        sectionCount = 24;
//    }
//    else if (collectionView == self.monthCollectionView)
//    {
//        sectionCount = 6;
//    }
//    else if(collectionView == self.yearCollectionView)
//    {
//        sectionCount = 4;
//    }
//    return sectionCount;
//}
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    int numberOFSections = 0;
//    
//    if (collectionView == self.weekCollectionView)
//    {
//        numberOFSections = 7;
//    }
//    else if (collectionView == self.monthCollectionView)
//    {
//        numberOFSections = 7;
//    }
//    else if(collectionView == self.yearCollectionView)
//    {
//        numberOFSections = 3;
//    }
//
//    return numberOFSections;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method creates the Cell of CollectionView for yearly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (YearCell *) createYearCellFromNib{
//    
//    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"YearCell" owner:self options:nil];
//	
//	NSEnumerator *nibEnum = [nibContents objectEnumerator];
//	YearCell *cell = nil;
//	NSObject *nibItem = nil;
//	
//	while((nibItem = [nibEnum nextObject]) != nil)
//	{
//		if([nibItem isKindOfClass:[YearCell class]])
//		{
//			cell = (YearCell *) nibItem;
//			
//			if([cell.reuseIdentifier isEqualToString:@"YearCell"])
//			{
//                break;
//			}
//			else
//			{
//				cell = nil;
//			}
//		}
//	}
//	
//	return cell;
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method creates the Cell of CollectionView for monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (MonthCell *) createMonthCellFromNib{
//    
//    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"MonthCell" owner:self options:nil];
//	
//	NSEnumerator *nibEnum = [nibContents objectEnumerator];
//	MonthCell *cell = nil;
//	NSObject *nibItem = nil;
//	
//	while((nibItem = [nibEnum nextObject]) != nil)
//	{
//		if([nibItem isKindOfClass:[MonthCell class]])
//		{
//			cell = (MonthCell *) nibItem;
//			
//			if([cell.reuseIdentifier isEqualToString:@"MonthCell"])
//			{
//                UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MonthCellTapped:)];
//                [cell.contentView addGestureRecognizer:gestureRecognizer];
//                [gestureRecognizer release];
//                
//                UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(MonthLongPress:)];
//                lpgr.minimumPressDuration = 0.3; //seconds
//                [cell.contentView addGestureRecognizer:lpgr];
//                [lpgr release];
//                break;
//			}
//			else
//			{
//				cell = nil;
//			}
//		}
//	}
//	
//	return cell;
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method creates the Cell of CollectionView for Weekly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (WeekCell *) createWeekCellFromNib
//{
//	NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"WeekCell" owner:self options:nil];
//	
//	NSEnumerator *nibEnum = [nibContents objectEnumerator];
//	WeekCell *cell = nil;
//	NSObject *nibItem = nil;
//	
//	while((nibItem = [nibEnum nextObject]) != nil)
//	{
//		if([nibItem isKindOfClass:[WeekCell class]])
//		{
//			cell = (WeekCell *) nibItem;
//			
//			if([cell.reuseIdentifier isEqualToString:@"WeekCell"])
//			{
//                UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(WeekCellSlotsTapped:)];
//                [cell.firstSlotLabel addGestureRecognizer:gestureRecognizer];
//                
//                 UITapGestureRecognizer *gestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(WeekCellSlotsTapped:)];
//                [cell.secondSlotLabel addGestureRecognizer:gestureRecognizer1];
//                
//                 UITapGestureRecognizer *gestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(WeekCellSlotsTapped:)];
//                [cell.thirdSlotLabel addGestureRecognizer:gestureRecognizer2];
//                
//                 UITapGestureRecognizer *gestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(WeekCellSlotsTapped:)];
//                [cell.fourthSlotLabel addGestureRecognizer:gestureRecognizer3];
//                [gestureRecognizer release];
//                [gestureRecognizer1 release];
//                [gestureRecognizer2 release];
//                [gestureRecognizer3 release];
//                
//                
//                
//                UILongPressGestureRecognizer *lpgr1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//                lpgr1.minimumPressDuration = 0.3; //seconds
//                [cell.firstSlotLabel addGestureRecognizer:lpgr1];
//                UILongPressGestureRecognizer *lpgr2 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//                lpgr2.minimumPressDuration = 0.3; //seconds
//                [cell.secondSlotLabel addGestureRecognizer:lpgr2];
//                UILongPressGestureRecognizer *lpgr3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//                lpgr3.minimumPressDuration = 0.3; //seconds
//                [cell.thirdSlotLabel addGestureRecognizer:lpgr3];
//                UILongPressGestureRecognizer *lpgr4 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//                lpgr4.minimumPressDuration = 0.3; //seconds
//                [cell.fourthSlotLabel addGestureRecognizer:lpgr4];
//                
//                [lpgr1 release];
//                [lpgr2 release];
//                [lpgr3 release];
//                [lpgr4 release];
//                
//                cell.firstSlotLabel.tag = -1;
//                cell.secondSlotLabel.tag = -1;
//                cell.thirdSlotLabel.tag = -1;
//                cell.fourthSlotLabel.tag = -1;
//
//				break;
//			}
//			else
//			{
//				cell = nil;
//			}
//		}
//	}
//	
//	return cell;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (collectionView == self.weekCollectionView)
//    {
//        
//
//            static NSString *cellIdentifier = @"WeekCell";
//            WeekCell *cell = [(WeekCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath] retain];
//            
//            cell = [self createWeekCellFromNib];
//
//            int sectionNumber = indexPath.section;
//            int rowNumber = indexPath.row;
//                       
//            SideTimeTableViewCell *tableCell = (SideTimeTableViewCell *)[self.sideTimeTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sectionNumber inSection:0]];
//            NSString *sideTimeInTable = tableCell.timeLabel.text;
//            if (self.pVisibleWeekDatesArray.count>rowNumber)
//            {
//                NSString *dateInColumn = [self.pVisibleWeekDatesArray objectAtIndex:rowNumber];
//                
//                if (self.pWeekDataSource.count >rowNumber)
//                {
//                    NSDictionary * dictionary = [self.pWeekDataSource objectAtIndex:rowNumber];
//                    
//                    if (dictionary.count>0)
//                    {
//                        NSMutableArray * objectsArray = [[dictionary objectForKey:dateInColumn] mutableCopy];
//                                
//                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csAppointmentDate == %@",dateInColumn];
//                        [objectsArray filterUsingPredicate:predicate];
//                        
//                        
//                        NSArray *AMSeparatorArray = [sideTimeInTable componentsSeparatedByString:@" "];
//                        NSString *hourString;
//                        NSString *AMPMString;
//                        
//                        if (AMSeparatorArray.count>0)
//                        {
//                            hourString = [AMSeparatorArray objectAtIndex:0];
//                            AMPMString = [AMSeparatorArray objectAtIndex:1];
//                        }
//                        
//                        NSPredicate *predicateForTime = [NSPredicate predicateWithFormat:@"csStartTime beginswith[cd] %@ AND csStartTime endswith[cd] %@",hourString, AMPMString];
//                        [objectsArray filterUsingPredicate:predicateForTime];
//                        
//                        
//                        
//                        for (Appointment * apptObj in objectsArray)
//                        {
//                            NSArray *subStrings = [apptObj.csStartTime componentsSeparatedByString:@":"];
//                            
//                            NSString *hourString;
//                            NSString *minuteCompleteString;
//                            if (subStrings.count >1)
//                            {
//                                hourString = [subStrings objectAtIndex:0];
//                                minuteCompleteString = [subStrings objectAtIndex:1];
//                            }
//                            NSArray *AMSeparatorArray = [minuteCompleteString componentsSeparatedByString:@" "];
//                            NSString *minuteString;
//                            NSString *AMPMString;
//                            
//                            if (AMSeparatorArray.count>0)
//                            {
//                                minuteString = [AMSeparatorArray objectAtIndex:0];
//                                AMPMString = [AMSeparatorArray objectAtIndex:1];
//                            }
//                            
//                            float minut = [minuteString floatValue];
//                            int minuts = floorf(minut / 15);
//                            
//                            if (minuts == 0)
//                            {
//                                cell.firstSlotLabel.text = [NSString stringWithFormat:@"%@ %@",apptObj.csFirstName,apptObj.csLastName];
//                                [cell.firstSlotLabel.layer setCornerRadius:3.0];
//                                cell.firstSlotLabel.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:191.0/255.0 blue:223.0/255.0 alpha:1.0];
//                                cell.firstSlotLabel.tag = 1;
//                            }
//                            else if (minuts == 1)
//                            {
//                                cell.secondSlotLabel.text = [NSString stringWithFormat:@"%@ %@",apptObj.csFirstName,apptObj.csLastName];
//                                [cell.secondSlotLabel.layer setCornerRadius:3.0];
//                                cell.secondSlotLabel.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:191.0/255.0 blue:223.0/255.0 alpha:1.0];
//                                cell.secondSlotLabel.tag = 1;
//                            }
//                            else if (minuts == 2)
//                            {
//                                cell.thirdSlotLabel.text = [NSString stringWithFormat:@"%@ %@",apptObj.csFirstName,apptObj.csLastName];
//                                [cell.thirdSlotLabel.layer setCornerRadius:3.0];
//                                cell.thirdSlotLabel.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:191.0/255.0 blue:223.0/255.0 alpha:1.0];
//                                cell.thirdSlotLabel.tag = 1;
//                            }
//                            else if (minuts == 3)
//                            {
//                                cell.fourthSlotLabel.text = [NSString stringWithFormat:@"%@ %@",apptObj.csFirstName,apptObj.csLastName];
//                                [cell.fourthSlotLabel.layer setCornerRadius:3.0];
//                                cell.fourthSlotLabel.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:191.0/255.0 blue:223.0/255.0 alpha:1.0];
//                                cell.fourthSlotLabel.tag = 1;
//                            }
//                        
//                        }
//                    }
//                    
//
//                }
//
//            }
//        return cell;
//    }
//    
//    else if (collectionView == self.monthCollectionView)
//    {
//        static NSString *cellIdentifier = @"MonthCell";
//        MonthCell *cell = [(MonthCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath] retain];
//       
//       
// 
//        cell = [self createMonthCellFromNib];
//        
//        [cell.dateLabel.layer setBorderWidth:1.0];
//        [cell.dateLabel.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
//        
//        if (indexPath.section == 0 && ![[weekDaysArray objectAtIndex:indexPath.row] isEqualToString:self.firstDayOfMonth] && firstDayNotFound)
//        {
//            cell.dateLabel.text = [self PreviousMonthDatesForFirstSection:indexPath.row];
//            cell.innerView.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
//            cell.contentView.userInteractionEnabled = NO;
//        }
//        else
//        {
//            
//            if (newMonthStarted)
//            {
//                cell.innerView.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
//                cell.contentView.userInteractionEnabled = NO;
//            }
//            
//            if (dateCounter<=9) {
//                 cell.dateLabel.text = [NSString stringWithFormat:@"0%i",dateCounter];
//            }
//            else{
//                 cell.dateLabel.text = [NSString stringWithFormat:@"%i",dateCounter];
//            }
//            
//            if (newMonthStarted == FALSE)
//            {
//                // construct a Date here.
//                NSString *dateOfCell; //= [NSString stringWithFormat:@"0%i/%@/%i",monthOftheYear,cell.dateLabel.text, year];
//                
//                if (monthOftheYear <=9)
//                {
//                    dateOfCell = [NSString stringWithFormat:@"0%i/%@/%i",monthOftheYear,cell.dateLabel.text, year];
//                }
//                else{
//                    dateOfCell = [NSString stringWithFormat:@"%i/%@/%i",monthOftheYear,cell.dateLabel.text, year];
//                }
//                
//                
//                int countOfAppointments =[self FetchAppointmentsForThisMonthCell:dateOfCell];
//                
//                if (countOfAppointments>0)
//                {
//                    if (countOfAppointments == 1)
//                        cell.appointmentsLabel.text = [NSString stringWithFormat:@"%i Appointment",countOfAppointments];
//                    else
//                        cell.appointmentsLabel.text = [NSString stringWithFormat:@"%i Appointments",countOfAppointments];
//                }
//                
//                else
//                {
//                    cell.appointmentsLabel.text = @"";
//                }
//            }
//            
//            
//            firstDayNotFound = FALSE;
//            if (dateCounter >=numberofDaysInMonth)
//            {
//                dateCounter = 1;
//                newMonthStarted = TRUE;
//            }
//            else
//                dateCounter++;
//        }
//        
//        return cell;
//
//    }
//    else if(collectionView == self.yearCollectionView)
//    {
//        static NSString *cellIdentifier = @"YearCell";
//        YearCell *cell = [(YearCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath] retain];
//
//        cell = [self createYearCellFromNib];
//        
//        cell.backgroundColor = [UIColor clearColor];
//        cell.contentView.backgroundColor = [UIColor clearColor];
//        KLCalendarView *calender = [[KLCalendarView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) andDelegate:self];
//        calender.isFromYearView = YES;
//        calender.delegate = self;
//        
//        [calender addUI];
//        [calender refreshViewWithPushDirection:nil];
//        
//        NSString *str =@"3/15/2012 9:15 PM";
//        int month = 1;
//        switch (indexPath.section) {
//            case 0:
//            {
//                switch (indexPath.row) {
//                    case 0:
//                    {
//                        month = 1;
//                        str = [NSString stringWithFormat:@"1/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 1:
//                    {
//                        month = 2;
//                        str = [NSString stringWithFormat:@"2/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 2:
//                    {
//                        month = 3;
//                        str = [NSString stringWithFormat:@"3/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                        
//                    default:
//                        break;
//                }
//            }
//                break;
//            case 1:
//            {
//                switch (indexPath.row) {
//                    case 0:
//                    {
//                        month = 4;
//                        str = [NSString stringWithFormat:@"4/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 1:
//                    {
//                        month = 5;
//                        str = [NSString stringWithFormat:@"5/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 2:
//                    {
//                        month = 6;
//                        str = [NSString stringWithFormat:@"6/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                        
//                    default:
//                        break;
//                }
//            }
//                
//                break;
//            case 2:
//            {
//                switch (indexPath.row) {
//                    case 0:
//                    {
//                        month = 7;
//                        str = [NSString stringWithFormat:@"7/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 1:
//                    {
//                        month = 8;
//                        str = [NSString stringWithFormat:@"8/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 2:
//                    {
//                        month = 9;
//                        str = [NSString stringWithFormat:@"9/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                        
//                    default:
//                        break;
//                }
//            }
//                
//                break;
//            case 3:
//            {
//                switch (indexPath.row) {
//                    case 0:
//                    {
//                        month = 10;
//                        str = [NSString stringWithFormat:@"10/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 1:
//                    {
//                        month = 11;
//                        str = [NSString stringWithFormat:@"11/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                    case 2:
//                    {
//                        month = 12;
//                        str = [NSString stringWithFormat:@"12/1/%i 9:15 AM", currentYear];
//                    }
//                        break;
//                        
//                    default:
//                        break;
//                }
//            }
//                
//                break;
//            default:
//                break;
//        }
//        
//        calender.isFromYearView = NO;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
//        NSDate *date = [formatter dateFromString:str];
//        
//        [self displayMonthForData:date andView:calender];
//        
//        NSArray *tilesArray = [calender getAllTiles];
//        
//        NSRange days = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit
//                               inUnit:NSMonthCalendarUnit
//                              forDate:date];
//        NSString *totalDaysOfMonth = [NSString stringWithFormat:@"%i", days.length];
//        BOOL canCompare = NO;
//        BOOL canChangeBackColor = YES;
//        [formatter setDateFormat:@"MM/dd/yyyy"];
//        for(KLTile *tile in tilesArray)
//        {
//            if([tile.text isEqualToString:@"1"])
//                canCompare = YES;
//            if(canCompare && canChangeBackColor)
//            {
//                NSString *dateString = [NSString stringWithFormat:@"%i/%@/%i", month, tile.text, currentYear];
//                NSDate *formatedDate = [formatter dateFromString:dateString];
//                dateString = [formatter stringFromDate:formatedDate];
//
//                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.csAppointmentDate = %@", dateString];
//                NSArray *array = [self.appointmentArray filteredArrayUsingPredicate:predicate];
//                if(array.count > 5)
//                {
//                    [tile setBackColorForGreaterThenFive];
//                }
//                else if(array.count > 0)
//                {
//                    [tile setBackColor];
//                }
//            }
//            
//            
//            if([totalDaysOfMonth isEqualToString:tile.text])
//                canChangeBackColor = NO;
//            
//        }
//        
//        calender.isFromYearView = YES;
//        [cell.contentView addSubview:calender];
//        cell.contentView.layer.borderWidth = 2.0;
//        cell.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        return cell;
//    }
//    return nil;
//}
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// When we tap on any Date in Monthly or Yearly Calendar, it takes us to DailyCalendar View with that Selected
//// date visible there on the view and its appointments as well.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)displayMonthForData:(NSDate *)date andView:(KLCalendarView *)calendar
//{
//    NSArray *monthsArray = [NSArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
//    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
//    int month = [components month];
//    int years = [components year];
//    int selectedYear = [calendar selectedYear];
//    int january = 1;
//    
//    NSString *monthName = [monthsArray objectAtIndex:month-1];
//    
//    while (years != selectedYear) {
//        if(years > selectedYear)
//        {
//            [calendar showFollowingMonth];
//            selectedYear = [calendar selectedYear];
//        }
//        else if(years < selectedYear)
//        {
//            [calendar showPreviousMonth];
//            selectedYear = [calendar selectedYear];
//        }
//    }
//    
//    int selectedMonth = [monthsArray indexOfObject:[calendar selectedMonthName]];
//    selectedMonth++;
//    
//    while(january != selectedMonth)
//    {
//        if(selectedMonth > january)
//        {
//            [calendar showPreviousMonth];
//            selectedMonth = [monthsArray indexOfObject:[calendar selectedMonthName]];
//            selectedMonth++;
//        }
//        else if(selectedMonth < january)
//        {
//            [calendar showFollowingMonth];
//            selectedMonth = [monthsArray indexOfObject:[calendar selectedMonthName]];
//            selectedMonth++;
//        }
//    }
//    
//    for(int i =0; i< monthsArray.count; i++)
//    {
//        if(![monthName isEqualToString:[calendar selectedMonthName]])
//        {
//            [calendar showFollowingMonth];
//        }
//        else if(![monthName isEqualToString:[calendar selectedMonthName]])
//        {
//            [calendar showPreviousMonth];
//        }
//    }
//    
//    int day = components.day;
//    NSString *dateString = [NSString stringWithFormat:@"%i", day];
//    
//    if(calendar == m_pCalendarView)
//    {
//        if (date != nil)
//        {
//            KLTile * pT = [calendar getNonSelectedTileForYearCalendarFromDate:dateString];
//            if(prevTile != nil)
//            {
//                ((CheckmarkTile*)prevTile).checkmarked = FALSE;
//                [prevTile setNeedsDisplay];
//                [prevTile release];
//                prevTile = nil;
//            }
//            
//            if (pT)
//            {
//                ((CheckmarkTile*)pT).checkmarked = TRUE;
//                prevTile = pT;
//                [prevTile retain];
//                [pT flash];
//            }
//            
//        }
//    }
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method handles the Tap Gesture on any cell in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) MonthCellTapped: (UIGestureRecognizer *)sender
//{
//    
//    if (v!=nil)
//    {
//        [v removeFromSuperview];
//        v=nil;
//        return;
//    }
//    
//    //(@"Tapped");
//    
//    UIView *view = (UIView *)sender.view;
//    
//    MonthCell * collectionCell = (MonthCell *)view.superview;
//    NSString *dateOfCell;
//    if (monthOftheYear <=9)
//    {
//        dateOfCell = [NSString stringWithFormat:@"0%i/%@/%i",monthOftheYear,collectionCell.dateLabel.text, year];
//    }
//    else{
//        dateOfCell = [NSString stringWithFormat:@"%i/%@/%i",monthOftheYear,collectionCell.dateLabel.text, year];
//    }
//    
//    dateOfCell = [GlobalFunctions ConvertDate:dateOfCell FromFormat:@"MM/dd/yyyy" toFormat:@"yyyy-MM-dd"];
//    
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//   
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    
//	NSDate * dateFromString = [formatter dateFromString:dateOfCell];
//	[formatter release];
//    
//    self.selectedDate=dateFromString;
//    [self PopulateArrayForTableView];
//   
//    [self.monthView removeFromSuperview];
//    [self.pAppointmentsParent.selectCalendarTypeSegmentBar setSelectedSegmentIndex:0];
//    [self.innerView addSubview:self.dayView];
//    [self displayMonthForData:dateFromString andView:m_pCalendarView];
//    segementSelectedIndex = 0;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method handles the LongPressGesture on any cell in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) MonthLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
//{
//    UIView *view = (UIView *)gestureRecognizer.view;
//    
//    MonthCell * collectionCell = (MonthCell *)view.superview;
//    CGPoint Point = [gestureRecognizer locationInView:self.monthView];
//    
//    
//    NSString *dateOfCell;
//    if (monthOftheYear <=9)
//    {
//        dateOfCell = [NSString stringWithFormat:@"0%i/%@/%i",monthOftheYear,collectionCell.dateLabel.text, year];
//    }
//    else{
//        dateOfCell = [NSString stringWithFormat:@"%i/%@/%i",monthOftheYear,collectionCell.dateLabel.text, year];
//    }
//    
//    
//    NSMutableArray * dataArray = [self.appointmentArray mutableCopy];
//
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csAppointmentDate == %@",dateOfCell];
//    [dataArray filterUsingPredicate:predicate];
//    
//    if (dataArray.count>0)
//    {
//        
//        
//        if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
//            [self MakeBubbleInMonthViewForPatient:dataArray onDate:dateOfCell];
//            [self showWithAnimiation:self.monthView atPoint:Point];
//        }
//    }
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method handles the Tap Gesture on any cell in Weekly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) WeekCellSlotsTapped:(UIGestureRecognizer *)sender
//{
//    
//    if (v!=nil)
//    {
//        [v removeFromSuperview];
//        v=nil;
//        return;
//    }
//    
//    UILabel *label = (UILabel *)sender.view;
//    
//    WeekCell * collectionCell = (WeekCell *)label.superview.superview.superview;
//    
//    NSIndexPath *indexPath = [self.weekCollectionView indexPathForCell:collectionCell];
//    
//    NSIndexPath * indexPathForSideTable = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
//    SideTimeTableViewCell* cell = (SideTimeTableViewCell*)[self.sideTimeTableView cellForRowAtIndexPath:indexPathForSideTable];
//        
//    if (label.tag == 1)
//    {
//        if(subMenuOptionsSheet != nil)
//        {
//            [subMenuOptionsSheet release];
//        }
//        
//        subMenuOptionsSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//        
//        [subMenuOptionsSheet addButtonWithTitle:@"Start Visit"];
//        [subMenuOptionsSheet addButtonWithTitle:@"Edit Appointment"];
//        [subMenuOptionsSheet addButtonWithTitle:@"Edit Patient"];
//        [subMenuOptionsSheet addButtonWithTitle:@"Patient Chart"];
//        [subMenuOptionsSheet addButtonWithTitle:@"Delete Appointment"];
//        [subMenuOptionsSheet setDestructiveButtonIndex:4];
//        
//        
//        [subMenuOptionsSheet showFromRect:label.frame inView:[label superview]  animated:YES];
//        [subMenuOptionsSheet bringSubviewToFront:[label superview]];
//        
//        
//        NSString *dateKey = [NSString stringWithFormat:@"%@",[self.pVisibleWeekDatesArray objectAtIndex:indexPath.row]];
//        NSDictionary *dict = [self.pWeekDataSource objectAtIndex:indexPath.row];
//        
//        NSMutableArray * objectsArray = [[dict objectForKey:dateKey] mutableCopy];     
//        
//        NSString *sideTimeInTable = cell.timeLabel.text;
//        NSArray *AMSeparatorArray = [sideTimeInTable componentsSeparatedByString:@" "];
//        NSString *hourString;
//        NSString *AMPMString;
//        
//        if (AMSeparatorArray.count>0)
//        {
//            hourString = [AMSeparatorArray objectAtIndex:0];
//            AMPMString = [AMSeparatorArray objectAtIndex:1];
//        }
//
//        
//        NSPredicate *predicateForTime = [NSPredicate predicateWithFormat:@"csStartTime beginswith[cd] %@ AND csStartTime endswith[cd] %@",hourString, AMPMString];
//        [objectsArray filterUsingPredicate:predicateForTime];
//        
//        
//        
//        if (objectsArray.count >0)
//        {
//            NSString *minuteString;
//            if(label == collectionCell.firstSlotLabel)
//            {
//                minuteString = @"00";
//            }
//            else if(label == collectionCell.secondSlotLabel)
//            {
//                minuteString = @"15";
//            }
//            else if(label == collectionCell.thirdSlotLabel)
//            {
//                minuteString = @"30";
//            }
//            else if(label == collectionCell.fourthSlotLabel)
//            {
//                minuteString = @"45";
//            }
//            
//            
//            NSString *newTimeToMatch = [NSString stringWithFormat:@"%@:%@ %@",hourString, minuteString,AMPMString];
//            
//            NSPredicate *predicateForTime = [NSPredicate predicateWithFormat:@"csStartTime LIKE %@",newTimeToMatch];
//            [objectsArray filterUsingPredicate:predicateForTime];
//            
//            if (objectsArray.count>0) {
//                pCurrentObject = [objectsArray lastObject];
//            }
//        }
//    }
//    
//    else if (label.tag == -1)
//    {
//        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Appointments" message:@"Do you want to create a New Appointment?"];
//        
//        [alert setDestructiveButtonWithTitle:@"No" block:^
//        {
//            
//            
//        }];
//        [alert addButtonWithTitle:@"Yes" block:^{
//            
//            
//            NSString* min;
//           
//            
//            NSString* hours = cell.timeLabel.text;
//            NSArray *subStrings = [hours componentsSeparatedByString:@" "];
//            NSString *hourString;
//            NSString *AMPMString;
//            if (subStrings.count>1) {
//                hourString = [subStrings objectAtIndex:0];
//                AMPMString = [subStrings objectAtIndex:1];
//            }
//
//            if(label == collectionCell.firstSlotLabel)
//            {
//                min = @"00";
//            }
//            else if(label == collectionCell.secondSlotLabel)
//            {
//                min = @"15";
//            }
//            else if(label == collectionCell.thirdSlotLabel)
//            {
//                min = @"30";
//            }
//            else if(label == collectionCell.fourthSlotLabel)
//            {
//                min = @"45";
//            }
//            
//            // Here we will fetch the Date from the pVisibleWeekDatesArray for indexPath.row of collectionView.
//            
//            NSString *date = [NSString stringWithFormat:@"%@",[self.pVisibleWeekDatesArray objectAtIndex:indexPath.row]];
//            NSString *formattedDate = [GlobalFunctions ConvertDate:date FromFormat:@"MM/dd/yyyy" toFormat:@"yyyy-MM-dd"];
//            NSString *completeTime = [NSString stringWithFormat:@"%@ %@:%@ %@",formattedDate,hourString, min, AMPMString];
//            
//            // construct Date for DatePicker
//            
//            NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//            
//            [formatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
//            
//            NSDate *newDate = [[NSDate alloc] init];
//            newDate = [formatter dateFromString:completeTime];
//           // NSString *dateString = [formatter stringFromDate:newDate];
//            
//            [self.pAppointmentsParent setIsFromCalendarTableCell:TRUE];
//            [self.pAppointmentsParent setDateForAppointmentDatePicker:newDate];
//            [self.pAppointmentsParent AddAppoinmentButtonTpd:nil];
//        }];
//        
//        [alert show];
//        
//    }
//
//
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////  This method handles the LongPressGesture on any cell in Weekly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
//{
//    UILabel *label = (UILabel *)gestureRecognizer.view;
//    WeekCell * collectionCell = (WeekCell *)label.superview.superview.superview;
//    
//    CGPoint Point = [gestureRecognizer locationInView:self.weekView];
//    NSIndexPath *indexPath = [self.weekCollectionView indexPathForCell:collectionCell];
//    
//    NSIndexPath * indexPathForSideTable = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
//    SideTimeTableViewCell* cell = (SideTimeTableViewCell*)[self.sideTimeTableView cellForRowAtIndexPath:indexPathForSideTable];
//    
//    if (indexPath == nil)
//    {
//         //(@"long press on table view but not on a row");
//               
//    }
//    else
//    {
//        //(@"long press on table view at row %d", indexPath.row);
//        if (label.tag == 1)
//        {
//            
//            NSString *dateKey = [NSString stringWithFormat:@"%@",[self.pVisibleWeekDatesArray objectAtIndex:indexPath.row]];
//            NSDictionary *dict = [self.pWeekDataSource objectAtIndex:indexPath.row];
//            
//            NSMutableArray * objectsArray = [[dict objectForKey:dateKey] mutableCopy];
//            
//            NSString *sideTimeInTable = cell.timeLabel.text;
//            NSArray *AMSeparatorArray = [sideTimeInTable componentsSeparatedByString:@" "];
//            NSString *hourString;
//            NSString *AMPMString;
//            
//            if (AMSeparatorArray.count>0)
//            {
//                hourString = [AMSeparatorArray objectAtIndex:0];
//                AMPMString = [AMSeparatorArray objectAtIndex:1];
//            }
//            
//            NSPredicate *predicateForTime = [NSPredicate predicateWithFormat:@"csStartTime beginswith[cd] %@ AND csStartTime endswith[cd] %@",hourString, AMPMString];
//            [objectsArray filterUsingPredicate:predicateForTime];
//            
//            if (objectsArray.count >0)
//            {
//                NSString *minuteString;
//                if(label == collectionCell.firstSlotLabel)
//                {
//                    minuteString = @"00";
//                }
//                else if(label == collectionCell.secondSlotLabel)
//                {
//                    minuteString = @"15";
//                }
//                else if(label == collectionCell.thirdSlotLabel)
//                {
//                    minuteString = @"30";
//                }
//                else if(label == collectionCell.fourthSlotLabel)
//                {
//                    minuteString = @"45";
//                }
//                
//                NSString *newTimeToMatch = [NSString stringWithFormat:@"%@:%@ %@",hourString, minuteString,AMPMString];
//                NSPredicate *predicateForTime = [NSPredicate predicateWithFormat:@"csStartTime LIKE %@",newTimeToMatch];
//                [objectsArray filterUsingPredicate:predicateForTime];
//                
//                if (objectsArray.count>0) {
//                    pCurrentObject = [objectsArray lastObject];
//                }
//            }
//            
//            
//            if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
//
//                [self MakeBubbleInWeekViewForPatient:[NSString stringWithFormat:@"%@ %@",pCurrentObject.csFirstName, pCurrentObject.csLastName] onTime:pCurrentObject.csStartTime atLocation:pCurrentObject.csFacilty byProvider:pCurrentObject.csProvider andComments:pCurrentObject.csComments];
//                [self showWithAnimiation:self.weekView atPoint:Point];
//            }
//        }
//
//    }
//}
//
//
//
//#pragma mark - Custom Bubble View
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This delegate method is called when user taps anywhere on the screen.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //UITouch *touch = [touches anyObject];
//    
//    [self HideBubbleView];
//    
//}
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method Hides the BubbleView if visible.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)HideBubbleView
//{
//    isBubbleShown = NO;
//    if (v!=nil)
//    {
//        [v removeFromSuperview];
//        v=nil;
//        
//    }
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method shows the BubbleView with animation on a given View at a particular point.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) showWithAnimiation:(UIView*)parent atPoint:(CGPoint)touchPointa
//{
//    isBubbleShown = YES;
//    CGRect rect = CGRectMake(touchPointa.x, touchPointa.y-v.frame.size.height, v.frame.size.width, v.frame.size.height);
//    [v setFrame:rect];
//    
//    if(parent.frame.size.width<rect.origin.x+rect.size.width)
//    {
//        //(@"right side");
//        rect = CGRectMake(touchPointa.x-rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
//        [v setFrame:rect];
//    }
//    if (parent.frame.origin.y > rect.origin.y)
//    {
//        rect = CGRectMake(rect.origin.x, rect.origin.y + rect.size.height, rect.size.width, rect.size.height);
//        [v setFrame:rect];
//    }
//	v.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
//	[UIView beginAnimations:nil context:nil];
//	[UIView setAnimationDelegate:self];
//	[UIView setAnimationWillStartSelector:@selector(animationWillStart:context:)];
//	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
//	[UIView setAnimationDuration:0.1f];
//	[parent addSubview:v];
//    [parent bringSubviewToFront:v];
//	v.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
//	[UIView commitAnimations];
//    
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method creates Bubbleview for MonthlyCalendarView  and sets the frames of subviews in it.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)MakeBubbleInMonthViewForPatient: (NSArray *) appointmentsArray onDate:(NSString *)date;
//{
//    if (v != nil)
//    {
//        [v removeFromSuperview];
//        v = nil;
//    }
//    
//    v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    v.backgroundColor = [UIColor whiteColor];
//    
//    [v.layer setCornerRadius:100.0f];
//    [v.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    [v.layer setBorderWidth:1.5f];
//    [v.layer setShadowColor:[UIColor blackColor].CGColor];
//    [v.layer setShadowOpacity:0.8];
//    [v.layer setShadowRadius:3.0];
//    [v.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
//    
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperbackground.png"]];
//    backgroundImageView.frame = v.frame;
//    [backgroundImageView.layer setCornerRadius:100.0f];
//    [backgroundImageView.layer setMasksToBounds:YES];
//    [v addSubview:backgroundImageView];
//    
//    
//    UILabel *dateLabl = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 21)];
//    dateLabl.backgroundColor = [UIColor clearColor];
//    dateLabl.font = [UIFont fontWithName:@"Trebuchet MS" size:13.0];
//    dateLabl.textAlignment = NSTextAlignmentCenter;
//    dateLabl.textColor = [UIColor colorWithRed:60.0/255.0 green:30.0/255.0 blue:0.0/255.0 alpha:1.0];
//    dateLabl.text = [NSString stringWithString:date];//@"01:15 AM";
//    
//    UILabel *dashLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 22, 170, 21)];
//    dashLabel.backgroundColor = [UIColor clearColor];
//    dashLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14.0];
//    dashLabel.textColor = [UIColor lightGrayColor];
//    dashLabel.textAlignment = NSTextAlignmentCenter;
//    dashLabel.text = @" - - - - - - - - - - - - - - - -";
//    
//    MonthCellDetailViewController * detailController = [[MonthCellDetailViewController alloc] initWithNibName:@"MonthCellDetailViewController" bundle:nil];
//    detailController.pDataSource = [NSMutableArray arrayWithArray:appointmentsArray];
//    
//    detailController.view.frame = CGRectMake(30, 40, 140, 120);
//    
//    [v addSubview:dateLabl];
//    [v addSubview:dashLabel];
//    [v addSubview:detailController.view];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method creates Bubbleview for WeeklyCalendarView  and sets the frames of subviews in it.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)MakeBubbleInWeekViewForPatient: (NSString *)name onTime:(NSString *)time atLocation:(NSString *)location byProvider:(NSString *)provider andComments:(NSString *) comments
//{
//    
//    if (v != nil)
//    {
//        [v removeFromSuperview];
//        v = nil;
//    }
//    
//    v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    v.backgroundColor = [UIColor whiteColor];
//    
//    [v.layer setCornerRadius:100.0f];
//    [v.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    [v.layer setBorderWidth:1.5f];
//    [v.layer setShadowColor:[UIColor blackColor].CGColor];
//    [v.layer setShadowOpacity:0.8];
//    [v.layer setShadowRadius:3.0];
//    [v.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
//    
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperbackground.png"]];
//    backgroundImageView.frame = v.frame;
//    [backgroundImageView.layer setCornerRadius:100.0f];
//    [backgroundImageView.layer setMasksToBounds:YES];
//    [v addSubview:backgroundImageView];
//
//    
//    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 21)];
//    timeLabel.backgroundColor = [UIColor clearColor];
//    timeLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:13.0];
//    timeLabel.textAlignment = NSTextAlignmentCenter;
//    timeLabel.textColor = [UIColor colorWithRed:60.0/255.0 green:30.0/255.0 blue:0.0/255.0 alpha:1.0];
//    timeLabel.text = [NSString stringWithString:time];//@"01:15 AM";
//
//    
//    UILabel *dashLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 22, 170, 21)];
//    dashLabel.backgroundColor = [UIColor clearColor];
//    dashLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14.0];
//    dashLabel.textColor = [UIColor lightGrayColor];
//    dashLabel.textAlignment = NSTextAlignmentCenter;
//    dashLabel.text = @" - - - - - - - - - - - - - - - -";
//
//    
//    UILabel *nameLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 150, 20)];
//    nameLabel.backgroundColor = [UIColor clearColor];
//    nameLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14.0];
//    nameLabel.textColor = [UIColor colorWithRed:60.0/255.0 green:30.0/255.0 blue:0.0/255.0 alpha:1.0];
//    nameLabel.textAlignment = NSTextAlignmentCenter;
//    nameLabel.text = [NSString stringWithString:name]; //@"Eduardo Perez";
//    
//    UILabel *locationLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 170, 16)];
//    locationLabel.backgroundColor = [UIColor clearColor];
//    locationLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12.5];
//    locationLabel.textColor = [UIColor colorWithRed:60.0/255.0 green:30.0/255.0 blue:0.0/255.0 alpha:1.0];
//    locationLabel.text = [NSString stringWithFormat:@"Location: %@",location];//@"Location: Community Hospital";
//    
//    UILabel *providerLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 170, 16)];
//    providerLabel.textColor = [UIColor redColor];
//    providerLabel.backgroundColor = [UIColor clearColor];
//    providerLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:13.0];
//    providerLabel.textColor = [UIColor colorWithRed:170.0/255.0 green:2.0/255.0 blue:2.0/255.0 alpha:1.0];
//    providerLabel.text = [NSString stringWithFormat:@"Provider: %@",provider];//@"Provider: Administrator";
//    
//    UILabel *notesLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 170, 71)];
//    notesLabel.numberOfLines = 3;
//    notesLabel.backgroundColor = [UIColor clearColor];
//    notesLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:13.0];
//    notesLabel.textColor = [UIColor colorWithRed:60.0/255.0 green:30.0/255.0 blue:0.0/255.0 alpha:1.0];
//    notesLabel.textAlignment = NSTextAlignmentCenter;
//    notesLabel.text = [NSString stringWithFormat:@"Notes: %@",comments]; //@"This is the Note for the patient which I want to show in the Bubble View";
//    
//[v addSubview:timeLabel];
//    [v addSubview:dashLabel];
//    [v addSubview:nameLabel];
//    [v addSubview:locationLabel];
//    [v addSubview:providerLabel];
//    [v addSubview:notesLabel];
//    
//}
//
//#pragma mark -
//#pragma mark UITableView Delegate
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    int rows;
//    if (tableView == appointmentsTableView)
//    {
//        rows = [self.pDataSource count];
//    }
//    else if (tableView == timeTableView)
//    {
//        rows = 24;
//    }
//    else if (tableView == self.sideTimeTableView)
//    {
//        rows = 24;
//    }
//    else if (tableView == self.leftSideDayList)
//    {
//        NSPredicate* numberOfRowsPredicate = [NSPredicate predicateWithFormat:@"csAppointmentDate=%@", [uniqueDatesArray objectAtIndex:section]];
//        rows = [[self.appointmentArray filteredArrayUsingPredicate:numberOfRowsPredicate] count];
//    }
//    else if (tableView == self.rightSideDayList)
//    {
//        rows = 24;
//    }
//    
//    return rows;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    int sections;
//    if (tableView == appointmentsTableView)
//    {
//        sections = 1;
//    }
//    else if (tableView == timeTableView)
//    {
//        sections = 1;
//    }
//    else if (tableView == self.sideTimeTableView)
//    {
//        sections = 1;
//    }else if (tableView == self.leftSideDayList)
//    {
//        sections = [uniqueDatesArray count];
//    }
//    else if (tableView == self.rightSideDayList)
//    {
//        sections = 1;
//    }
//    
//    return sections;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    int rowHeight;
//    
//    if (tableView == appointmentsTableView)
//    {
//         rowHeight = 160.0;
//    }
//    else if (tableView == timeTableView)
//    {
//         rowHeight = 220.0;
//    }
//
//    else if (tableView == self.sideTimeTableView)
//    {
//        rowHeight = 150.0;
//    }
//    else if (tableView == self.leftSideDayList)
//    {
//        rowHeight = 44.0;
//    }
//    else if (tableView == self.rightSideDayList)
//    {
//        rowHeight = 220.0;
//    }
//
//    return rowHeight;
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if(tableView == leftSideDayList)
//    {
//        self.listHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 353, 28)];
//        [self.listHeaderView setBackgroundColor:[UIColor colorWithRed:129.0/255.0 green:100.0/255.0 blue:73.0/255.0 alpha:1.0]];
//        
//        
//        
//        self.dayLabel  = [[UILabel alloc] init];
//        [self.dayLabel setFrame:CGRectMake(11, 4, 130, 21)];
//        [self.dayLabel setTextColor:[UIColor whiteColor]];
//        [self.dayLabel setBackgroundColor:[UIColor clearColor]];
//        
//        self.dateMonthLabel  = [[UILabel alloc] init];
//        [self.dateMonthLabel setFrame:CGRectMake(185, 4, 160, 21)];
//        [self.dateMonthLabel setTextColor:[UIColor whiteColor]];
//        [self.dateMonthLabel setBackgroundColor:[UIColor clearColor]];
//        [self.dateMonthLabel setTextAlignment:NSTextAlignmentRight];
//        
//        [self.listHeaderView addSubview:self.dayLabel];
//        [self.listHeaderView addSubview:self.dateMonthLabel];
//
//        NSString* formattedDate = [GlobalFunctions ConvertDate:[uniqueDatesArray objectAtIndex:section] FromFormat:@"MM/dd/yyyy" toFormat:@"MMMM dd"];
//        NSString* dayFromDate = [GlobalFunctions ConvertDate:[uniqueDatesArray objectAtIndex:section] FromFormat:@"MM/dd/yyyy" toFormat:@"EEEE"];
//        dateMonthLabel.text = formattedDate;
//        dayLabel.text = dayFromDate;
//        
//        return self.listHeaderView;
//    }return nil;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"";
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    float height;
//    
//    if (tableView == appointmentsTableView)
//    {
//         height = 0.0;
//    }
//    else if (tableView == timeTableView)
//    {
//         height = 0.0;
//    }
//    else if (tableView == self.sideTimeTableView)
//    {
//        height = 0.0;
//    }
//    else if (tableView == self.leftSideDayList)
//    {
//        height = 28.0;
//    }
//    else if (tableView == self.rightSideDayList)
//    {
//        height = 0.0;
//    }
//   
//    return height;
//}
//
//
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (tableView == appointmentsTableView)
//    {
//        static NSString *simpleTableIdentifier = @"CalendarAppointmentsCustomCell";
//        CalendarAppointmentsCustomCell *cell = (CalendarAppointmentsCustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        
//        if (cell == nil)
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalendarAppointmentsCustomCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//            
//        }
//        else
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalendarAppointmentsCustomCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//        }
//
//        cell.cellInnerView.layer.borderWidth = 1.0;
//        cell.cellInnerView.layer.cornerRadius = 3.0;
//        cell.cellInnerView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//
//        /*
//         Ticket # 651 - Fixed by Hanny Tufail : Dated Dec 14, 2012
//         Description:  Now when user selects any appointment from left Table, the small circle (i.e. button) becomes highlighted.
//         */
//        if (IndexOfCell == indexPath.row)
//        {
//            [cell.indicatorButton setHighlighted:YES];
//        }
//        else
//        {
//            [cell.indicatorButton setHighlighted:NO];
//        }
//        
//        Appointment * appObj;
//        if ([self.appointmentArray count]>0)
//        {
//            appObj = [self.pDataSource objectAtIndex:indexPath.row];
//            
//            [cell.AppointmentTitle setText:[NSString stringWithFormat:@"%@ %@",appObj.csLastName, appObj.csFirstName]];
//            [cell.AppointmentTiming setText:[NSString stringWithFormat:@"%@",appObj.csStartTime]];
//            if (appObj.csFacilty == nil || [appObj.csFacilty isEqualToString:@"(null)"]) {
//                appObj.csFacilty = @"";
//            }
//            [cell.AppointmentLocation setText:[NSString stringWithFormat:@"Location: %@",appObj.csFacilty]];
//            
//            
//            if (greenWayAPIselected)
//            {
//                [cell.AppointmentNotes setText:[NSString stringWithFormat:@"%@",appObj.csReason]];
//                [cell.ProviderName setText:[NSString stringWithFormat:@"Resource: %@",appObj.csResourceName]];
//            }
//            else
//            {
//                [cell.AppointmentNotes setText:[NSString stringWithFormat:@"%@",appObj.csComments]];
//                [cell.ProviderName setText:[NSString stringWithFormat:@"Provider: %@",appObj.csProvider]];
//            }
//        }
//         
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        
//         return cell;
//    }
//    
//    else if(tableView == timeTableView)
//    {
//        NSInteger index = [indexPath row];
//        static NSString *CellIdentifier = @"CalendarTimeTableCustomCell";
//        
//        CalendarTimeTableCustomCell *cell = (CalendarTimeTableCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        if (cell == nil)
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalendarTimeTableCustomCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//        }
//        else
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalendarTimeTableCustomCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//        }
//          
//        cell.innerViewOne.layer.borderWidth = 1.0;
//        cell.innerViewOne.layer.cornerRadius = 5.0;
//        cell.innerViewOne.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewTwo.layer.borderWidth = 1.0;
//        cell.innerViewTwo.layer.cornerRadius = 5.0;
//        cell.innerViewTwo.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewThree.layer.borderWidth = 1.0;
//        cell.innerViewThree.layer.cornerRadius = 5.0;
//        cell.innerViewThree.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewFour.layer.borderWidth = 1.0;
//        cell.innerViewFour.layer.cornerRadius = 5.0;
//        cell.innerViewFour.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//
//        
//        if (index == 0) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 AM"]];
//        }
//        
//        else if(index == 1 || index == 2 || index == 3 || index == 4 || index == 5 || index == 6 || index == 7 || index == 8 || index == 9) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i AM",index]];
//        }
//        else if(index == 10 || index == 11) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i AM",index]];
//        }
//
//        else if (index == 12) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 PM"]];
//        }
//        
//        else if(index == 13 || index == 14 || index == 15 || index == 16 || index == 17 || index == 18 || index == 19 || index == 20 || index == 21)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i PM",index]];
//        }
//        
//        else if(index == 22 || index == 23)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i PM",index]];
//        }
//        
//        cell.button15.tag = -1;
//        cell.button30.tag = -1;
//        cell.button45.tag = -1;
//        cell.button60.tag = -1;
//        // set the Colors if appointment available on that time.
//        Appointment *item = nil;
//        if ([self.pDataSource count]>0)
//        {
//            if(self.pDataSource.count > IndexOfCell)
//                item = [self.pDataSource objectAtIndex:IndexOfCell];
//            for (int j= 0; j <[self.pDataSource count]; j++)
//            {
//                Appointment *pCurrObj;
//                pCurrObj = [self.pDataSource objectAtIndex:j];
//                if(item && self.sidetableIndexPath && indexPath.row == self.sidetableIndexPath.row && ![item.csFirstName isEqualToString:pCurrObj.csFirstName] && [item.csStartTime isEqualToString:pCurrObj.csStartTime])
//                {
//                    continue;
//                }
//                NSString *appointmentTime = [NSString stringWithFormat:@"%@",pCurrObj.csStartTime];
//                
//                if ([appointmentTime isEqualToString:@""]) {
//                    
//                }
//                else
//                {
//                    
//                    NSArray *subStrings = [appointmentTime componentsSeparatedByString:@":"];
//                    NSString *hourString;
//                    NSString *minuteCompleteString;
//                    if (subStrings.count >1)
//                    {
//                        hourString = [subStrings objectAtIndex:0];
//                        minuteCompleteString = [subStrings objectAtIndex:1];
//                    }
//                
//                    NSArray *AMSeparatorArray = [minuteCompleteString componentsSeparatedByString:@" "];
//                    NSString *minuteString;
//                    NSString *AMPMString;
//                    
//                    if (AMSeparatorArray.count>0)
//                    {
//                        minuteString = [AMSeparatorArray objectAtIndex:0];
//                        AMPMString = [AMSeparatorArray objectAtIndex:1];
//
//                    }
//                    float minut = [minuteString floatValue];
//                    int minuts = floorf(minut / 15);
// 
//                
//                    NSString * newExactTime = [NSString stringWithFormat:@"%@ %@",hourString, AMPMString];
//
//                    if ([cell.timeLabel.text isEqualToString:newExactTime])
//                    {
//                    
//                        if (minuts == 0)
//                        {
//                            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csStartTime=%@", pCurrObj.csStartTime];
//                            NSArray *array = [self.pDataSource filteredArrayUsingPredicate:predicate];
//                            if(array.count > 1)
//                            {
//                                [cell.innerViewOne setBackgroundColor:[UIColor purpleColor]];
//                                cell.appointmentTitleLabelOne.text = [NSString stringWithFormat:@"%i appointments.", array.count];
//                                cell.button15.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                            else
//                            {
//                                [cell.innerViewOne setBackgroundColor:[UIColor purpleColor]];
//                                [cell.appointmentTitleLabelOne setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                                if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                    pCurrObj.csFacilty = @"";
//                                }
//                                [cell.locationLabelOne setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                                cell.button15.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                        }
//                    
//                        else if (minuts == 1) {
//                            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csStartTime=%@", pCurrObj.csStartTime];
//                            NSArray *array = [self.pDataSource filteredArrayUsingPredicate:predicate];
//                            if(array.count > 1)
//                            {
//                                [cell.innerViewTwo setBackgroundColor:[UIColor purpleColor]];
//                                cell.appointmentTitleLabelTwo.text = [NSString stringWithFormat:@"%i appointments.", array.count];
//                                cell.button30.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                            else
//                            {
//                                [cell.innerViewTwo setBackgroundColor:[UIColor purpleColor]];
//                                [cell.appointmentTitleLabelTwo setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                                
//                                if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                    pCurrObj.csFacilty = @"";
//                                }
//                                [cell.locationLabelTwo setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                                cell.button30.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                        }
//                        else if (minuts == 2) {
//                            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csStartTime=%@", pCurrObj.csStartTime];
//                            NSArray *array = [self.pDataSource filteredArrayUsingPredicate:predicate];
//                            if(array.count > 1)
//                            {
//                                [cell.innerViewThree setBackgroundColor:[UIColor purpleColor]];
//                                cell.appointmentTitleLabelThree.text = [NSString stringWithFormat:@"%i appointments.", array.count];
//                                cell.button45.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                            else
//                            {
//                                [cell.innerViewThree setBackgroundColor:[UIColor purpleColor]];
//                                [cell.appointmentTitleLabelThree setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                                
//                                if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                    pCurrObj.csFacilty = @"";
//                                }
//                                [cell.locationLabelThree setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                                cell.button45.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                        }
//
//                        else if (minuts == 3) {
//                            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csStartTime=%@", pCurrObj.csStartTime];
//                            NSArray *array = [self.pDataSource filteredArrayUsingPredicate:predicate];
//                            if(array.count > 1)
//                            {
//                                [cell.innerViewFour setBackgroundColor:[UIColor purpleColor]];
//                                cell.appointmentTitleLabelFour.text = [NSString stringWithFormat:@"%i appointments.", array.count];
//                                cell.button60.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                            else
//                            {
//                                [cell.innerViewFour setBackgroundColor:[UIColor purpleColor]];
//                                [cell.appointmentTitleLabelFour setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                                
//                                if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                    pCurrObj.csFacilty = @"";
//                                }
//                                [cell.locationLabelFour setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                                cell.button60.tag = j;
//                                [arrayOfindexPaths addObject:indexPath];
//                            }
//                        }
//                    }
//                    
//                }
//                
//            }
//                
//        }
//        
//        [cell.button15 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button30 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button45 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button60 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//
//                
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        return cell;
//    }
//    
//    else if (tableView == self.sideTimeTableView) //Time table in Weekly collection view
//    {
//        NSInteger index = [indexPath row];
//        static NSString *CellIdentifier = @"SideTimeTableViewCell";
//        
//        SideTimeTableViewCell *cell = (SideTimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        if (cell == nil)
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SideTimeTableViewCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//        }
//        else
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SideTimeTableViewCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//        }
//        
//        
//        if (index == 0) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 AM"]];
//        }
//        
//        else if(index == 1 || index == 2 || index == 3 || index == 4 || index == 5 || index == 6 || index == 7 || index == 8 || index == 9) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i AM",index]];
//        }
//        else if(index == 10 || index == 11) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i AM",index]];
//        }
//        
//        else if (index == 12) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 PM"]];
//        }
//        
//        else if(index == 13 || index == 14 || index == 15 || index == 16 || index == 17 || index == 18 || index == 19 || index == 20 || index == 21)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i PM",index]];
//        }
//        
//        else if(index == 22 || index == 23)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i PM",index]];
//        }
//        
//        cell.selectionStyle =UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (tableView == leftSideDayList)
//    {
//        static NSString *simpleTableIdentifier = @"LeftAppointmentListCell";
//        LeftAppointmentListCell *cell = (LeftAppointmentListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        
//        if (cell == nil)
//        {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeftAppointmentListCell" owner:self options:nil];
//            cell = [nib objectAtIndex:0];
//            
//        }
//        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        NSPredicate* numberOfRowsPredicate = [NSPredicate predicateWithFormat:@"csAppointmentDate=%@", [uniqueDatesArray objectAtIndex:indexPath.section]];
//        Appointment* appointment = [[self.appointmentArray filteredArrayUsingPredicate:numberOfRowsPredicate] objectAtIndex:indexPath.row];
//        if(indexPath.section == 0 && indexPath.row == 0)
//        {
//            NSString* formattedDate = [GlobalFunctions ConvertDate:appointment.csAppointmentDate FromFormat:@"MM/dd/yyyy" toFormat:@"MMMM yyyy"];
//            listDateLabel.text = formattedDate;
//        }
//        cell.nameLabel.text = [NSString stringWithFormat:@"%@, %@", appointment.csFirstName, appointment.csLastName];
//        cell.providerLabel.text = appointment.csAppointmentDate;
//        cell.timeLabel.text = appointment.csStartTime;
//        
//        
//        return cell;
//    }
//    else if (tableView == rightSideDayList)
//    {
//        NSInteger index = [indexPath row];
//        static NSString *CellIdentifier = @"CalendarTimeTableCustomCell";
//        
//        CalendarTimeTableCustomCell *cell = (CalendarTimeTableCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CalendarTimeTableCustomCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//       
//
//        cell.innerViewOne.layer.borderWidth = 1.0;
//        cell.innerViewOne.layer.cornerRadius = 5.0;
//        cell.innerViewOne.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewTwo.layer.borderWidth = 1.0;
//        cell.innerViewTwo.layer.cornerRadius = 5.0;
//        cell.innerViewTwo.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewThree.layer.borderWidth = 1.0;
//        cell.innerViewThree.layer.cornerRadius = 5.0;
//        cell.innerViewThree.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        cell.innerViewFour.layer.borderWidth = 1.0;
//        cell.innerViewFour.layer.cornerRadius = 5.0;
//        cell.innerViewFour.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        
//        
//        if (index == 0) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 AM"]];
//        }
//        
//        else if(index == 1 || index == 2 || index == 3 || index == 4 || index == 5 || index == 6 || index == 7 || index == 8 || index == 9) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i AM",index]];
//        }
//        else if(index == 10 || index == 11) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i AM",index]];
//        }
//        
//        else if (index == 12) {
//            [cell.timeLabel setText:[NSString stringWithFormat:@"12 PM"]];
//        }
//        
//        else if(index == 13 || index == 14 || index == 15 || index == 16 || index == 17 || index == 18 || index == 19 || index == 20 || index == 21)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"0%i PM",index]];
//        }
//        
//        else if(index == 22 || index == 23)
//        {
//            index = index -12;
//            
//            [cell.timeLabel setText:[NSString stringWithFormat:@"%i PM",index]];
//        }
//        
//        cell.button15.tag = -1;
//        cell.button30.tag = -1;
//        cell.button45.tag = -1;
//        cell.button60.tag = -1;
//        // set the Colors if appointment available on that time.
//        if ([self.rightSideListDataSource count]>0)
//        {
//            
//            for (int j= 0; j <[self.rightSideListDataSource count]; j++)
//            {
//                Appointment *pCurrObj;
//                pCurrObj = [self.rightSideListDataSource objectAtIndex:j];
//                
//                NSString *appointmentTime = [NSString stringWithFormat:@"%@",pCurrObj.csStartTime];
//                
//                if ([appointmentTime isEqualToString:@""]) {
//                    
//                }
//                else
//                {
//                    
//                    NSArray *subStrings = [appointmentTime componentsSeparatedByString:@":"];
//                    NSString *hourString;
//                    NSString *minuteCompleteString;
//                    if (subStrings.count >1)
//                    {
//                        hourString = [subStrings objectAtIndex:0];
//                        minuteCompleteString = [subStrings objectAtIndex:1];
//                    }
//                    
//                    NSArray *AMSeparatorArray = [minuteCompleteString componentsSeparatedByString:@" "];
//                    NSString *minuteString;
//                    NSString *AMPMString;
//                    
//                    if (AMSeparatorArray.count>0)
//                    {
//                        minuteString = [AMSeparatorArray objectAtIndex:0];
//                        AMPMString = [AMSeparatorArray objectAtIndex:1];
//                        
//                    }
//                    float minut = [minuteString floatValue];
//                    int minuts = floorf(minut / 15);
//                    
//                    
//                    NSString * newExactTime = [NSString stringWithFormat:@"%@ %@",hourString, AMPMString];
//
//                    if ([cell.timeLabel.text isEqualToString:newExactTime])
//                    {
//                        
//                        if (minuts == 0)
//                        {
//                            [cell.innerViewOne setBackgroundColor:[UIColor purpleColor]];
//                            [cell.appointmentTitleLabelOne setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                            if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                pCurrObj.csFacilty = @"";
//                            }
//                            [cell.locationLabelOne setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                            cell.button15.tag = j;
//                            [arrayOfindexPaths addObject:indexPath];
//                            
//                        }
//                        
//                        else if (minuts == 1) {
//                            [cell.innerViewTwo setBackgroundColor:[UIColor purpleColor]];
//                            [cell.appointmentTitleLabelTwo setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                            
//                            if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                pCurrObj.csFacilty = @"";
//                            }
//                            [cell.locationLabelTwo setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                            cell.button30.tag = j;
//                            [arrayOfindexPaths addObject:indexPath];
//                        }
//                        else if (minuts == 2) {
//                            [cell.innerViewThree setBackgroundColor:[UIColor purpleColor]];
//                            [cell.appointmentTitleLabelThree setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                            
//                            if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                pCurrObj.csFacilty = @"";
//                            }
//                            [cell.locationLabelThree setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                            cell.button45.tag = j;
//                            [arrayOfindexPaths addObject:indexPath];
//                        }
//                        
//                        else if (minuts == 3) {
//                            [cell.innerViewFour setBackgroundColor:[UIColor purpleColor]];
//                            [cell.appointmentTitleLabelFour setText:[NSString stringWithFormat:@"%@ %@",pCurrObj.csLastName,pCurrObj.csFirstName]];
//                            
//                            if (pCurrObj.csFacilty == nil || [pCurrObj.csFacilty isEqualToString:@"(null)"]) {
//                                pCurrObj.csFacilty = @"";
//                            }
//                            [cell.locationLabelFour setText:[NSString stringWithFormat:@"%@",pCurrObj.csFacilty]];
//                            cell.button60.tag = j;
//                            [arrayOfindexPaths addObject:indexPath];
//                        }
//                    }
//                                           
//                }
//                
//            }
//            
//        }
//        
//        [cell.button15 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button30 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button45 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.button60 addTarget:self action:@selector(timeTableCellButtonTpd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        return cell;
//    }
//    
//
//    return nil;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// When a cell in left Appointment Table is tapped then this method scrolls the right sideTable to that appointment
//// time.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ScrollRightTimeTableViewForIndexPath:(NSIndexPath*)indexPath andTime:(NSString*)time
//{
//    NSString *exactTimeString;
//    NSString *hourString;
//    NSString *AMPMString;
//    
//    NSString *timingString = time;
//    NSArray *timingSubStrings = [timingString componentsSeparatedByString:@" "];
//    if ([timingSubStrings count]>1)
//    {
//        NSString *timeString = [timingSubStrings objectAtIndex:0];
//        AMPMString = [timingSubStrings objectAtIndex:1];
//        
//        NSArray *hourSubStrings = [timeString componentsSeparatedByString:@":"];
//        if ([hourSubStrings count]>1)
//        {
//            hourString = [hourSubStrings objectAtIndex:0];
//        }
//    }
//    
//    exactTimeString = [NSString stringWithFormat:@"%@ %@", hourString, AMPMString];
//    
//    NSInteger indexPathForRow;
//    
//    if ([AMPMString isEqualToString:@"AM"])
//    {
//        
//        indexPathForRow=[hourString integerValue];
//        if (indexPathForRow == 12)
//        {
//            indexPathForRow = 0;
//        }
//        
//    }
//    else if ([AMPMString isEqualToString:@"PM"])
//    {
//        indexPathForRow=[hourString integerValue];
//        if (indexPathForRow == 12)
//        {
//            indexPathForRow = 12;
//        }
//        else
//        {
//            indexPathForRow +=12;
//        }
//        
//    }
//    if(segementSelectedIndex == 0)
//    {
//        if(self.sidetableIndexPath && self.sidetableIndexPath.row == indexPathForRow)
//            [self.timeTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPathForRow inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        
//        self.sidetableIndexPath = [NSIndexPath indexPathForRow:indexPathForRow inSection:0];
//        [self.timeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPathForRow inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    }else
//    {
//        [self.rightSideDayList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPathForRow inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    }
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     
//    if(tableView == appointmentsTableView)
//    {
//        /*
//         Ticket # 651 - Fixed by Hanny Tufail : Dated Dec 14, 2012
//         Description:  Now when user selects any appointment from left Table, the small circle (i.e. button) becomes highlighted and unselect the previous highlighted cell button.
//         */
//        CalendarAppointmentsCustomCell* previousSelectedcell = (CalendarAppointmentsCustomCell *)[appointmentsTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:IndexOfCell inSection:0]];
//        [previousSelectedcell.indicatorButton setHighlighted:NO];
//        CalendarAppointmentsCustomCell* cell = (CalendarAppointmentsCustomCell *)[appointmentsTableView cellForRowAtIndexPath:indexPath];        
//        IndexOfCell = indexPath.row;
//        [cell.indicatorButton setHighlighted:YES];
//        [self ScrollRightTimeTableViewForIndexPath:indexPath andTime:cell.AppointmentTiming.text];
//        
//    }
//    else if (tableView == self.sideTimeTableView)
//    {
//        if (v!=nil)
//        {
//            [v removeFromSuperview];
//            v=nil;
//            return;
//        }
//    }
//    else if (tableView == self.leftSideDayList)
//    {
//        
//        LeftAppointmentListCell* cell = (LeftAppointmentListCell *)[leftSideDayList cellForRowAtIndexPath:indexPath];
//        
//        NSPredicate* numberOfRowsPredicate = [NSPredicate predicateWithFormat:@"csAppointmentDate=%@", [uniqueDatesArray objectAtIndex:indexPath.section]];
//        self.rightSideListDataSource = [NSMutableArray arrayWithArray:[self.appointmentArray filteredArrayUsingPredicate:numberOfRowsPredicate]];
//        
//        Appointment* appointment = [self.rightSideListDataSource objectAtIndex:indexPath.row];
//        
//        self.rightListTopHeaderAppointmentTitle.text = [NSString stringWithFormat:@"%@, %@", appointment.csFirstName, appointment.csLastName];
//        self.rightListTopHeaderDateLabel.text = [GlobalFunctions ConvertDate:appointment.csAppointmentDate FromFormat:@"MM/dd/yyyy" toFormat:@"MMMM dd yyyy"];
//        
//        NSString* tempDateFormat = [GlobalFunctions ConvertDate:appointment.csAppointmentDate FromFormat:@"MM/dd/yyyy" toFormat:@"yyyy-MM-dd"];
//        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"yyyy-MM-dd"];
//        NSDate * dateFromString = [formatter dateFromString:tempDateFormat];
//        [formatter release];
//
//        self.selectedDate = dateFromString;
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.rightSideDayList cache:YES];
//        } completion:^(BOOL finished) {
//            [self.rightSideDayList reloadData];
//            [self ScrollRightTimeTableViewForIndexPath:indexPath andTime:cell.timeLabel.text];
//        }];
//
//    }
//   
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method is called when any cell in rightside TableView in DailyCalendar is tapped.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)timeTableCellButtonTpd:(UIButton*)sender forEvent:(UIEvent *)event{
//    
//    UIButton* button = (UIButton*)sender;
//     
//    NSIndexPath *indexPath;
//    if(segementSelectedIndex == 0)
//    {
//        indexPath = [self.timeTableView indexPathForRowAtPoint:[[[event touchesForView:button] anyObject] locationInView:self.timeTableView]];
//    }
//    else if(segementSelectedIndex == 4)
//    {
//        indexPath = [self.rightSideDayList indexPathForRowAtPoint:[[[event touchesForView:button] anyObject] locationInView:self.rightSideDayList]];
//    }
//    
//    if (button.tag == -1)
//    {
//        if (v!=nil)
//        {
//            [v removeFromSuperview];
//            v=nil;
//            return;
//        }
//        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Appointments" message:@"Do you want to create a New Appointment?"];
//        
//        [alert setDestructiveButtonWithTitle:@"No" block:^{
//            
//        }];
//        [alert addButtonWithTitle:@"Yes" block:^{
//            
//            NSString* min;
//            CalendarTimeTableCustomCell* cell;
//            if(segementSelectedIndex == 0)
//            {
//                 cell = (CalendarTimeTableCustomCell*)[self.timeTableView cellForRowAtIndexPath:indexPath];
//            }else if(segementSelectedIndex == 4)
//            {
//                cell = (CalendarTimeTableCustomCell*)[self.rightSideDayList cellForRowAtIndexPath:indexPath];
//            }
//            
//            NSString* hours = cell.timeLabel.text;
//            NSArray *subStrings = [hours componentsSeparatedByString:@" "];
//            NSString *hourString;
//            NSString *AMPMString;
//            if (subStrings.count>1) {
//                hourString = [subStrings objectAtIndex:0];
//                AMPMString = [subStrings objectAtIndex:1];
//            }
//            
//            if(button == cell.button15)
//            {
//                 min = @"00";
//            }
//            else if(button == cell.button30)
//            {
//                 min = @"15";
//            }
//            else if(button == cell.button45)
//            {
//                 min = @"30";
//            }
//            else if(button == cell.button60)
//            {
//                min = @"45";
//            }
//            
//            NSString *date = [NSString stringWithFormat:@"%@",self.selectedDate];
//            NSString *formattedDate = [GlobalFunctions ConvertDate:date FromFormat:@"yyyy-MM-dd HH:mm:ss z" toFormat:@"yyyy-MM-dd"];
//            NSString *completeTime = [NSString stringWithFormat:@"%@ %@:%@ %@",formattedDate,hourString, min, AMPMString];
//            
//            // construct Date for DatePicker
//
//            NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//            [formatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
//            NSDate *newDate = [[NSDate alloc] init];
//            newDate = [formatter dateFromString:completeTime];
//            
//          //  NSString *dateString = [formatter stringFromDate:newDate];
//            
//            [self.pAppointmentsParent setIsFromCalendarTableCell:TRUE];
//            [self.pAppointmentsParent setDateForAppointmentDatePicker:newDate];
//            [self.pAppointmentsParent AddAppoinmentButtonTpd:nil];
//        }];
//        
//        [alert show];
//
//    }
//    else
//    {
//        // Ticket#622 Status = Changes done , Done By Imran Ali, Date:07/12/2012
//        // Description:  not displaying UIActionSheet, when app active from background. Please review it.
//        if(subMenuOptionsSheet != nil)
//        {
//            [subMenuOptionsSheet release];
//        }
//        
//        subMenuOptionsSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//        
//            [subMenuOptionsSheet addButtonWithTitle:@"Start Visit"];
//            [subMenuOptionsSheet addButtonWithTitle:@"Edit Appointment"];
//            [subMenuOptionsSheet addButtonWithTitle:@"Edit Patient"];
//            [subMenuOptionsSheet addButtonWithTitle:@"Patient Chart"];
//            [subMenuOptionsSheet addButtonWithTitle:@"Delete Appointment"];
//            [subMenuOptionsSheet setDestructiveButtonIndex:4];
//    
//        
////        [subMenuOptionsSheet showFromRect:sender.frame inView:[sender superview]  animated:YES];
////        [subMenuOptionsSheet bringSubviewToFront:[sender superview]];
//        if(segementSelectedIndex == 0)
//        {
//             pCurrentObject = [self.pDataSource objectAtIndex:sender.tag];
//        }
//        else if(segementSelectedIndex == 4)
//            pCurrentObject = [self.rightSideListDataSource objectAtIndex:sender.tag];
//        
//        // Ticket#830 Status = Changes done , Done By Imran Ali, Date:13/05/2013
//        // Description:  issue fixed by adding UIPopoverController with same time appointments list.
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"csStartTime=%@", pCurrentObject.csStartTime];
//        NSArray *array = [self.pDataSource filteredArrayUsingPredicate:predicate];
//        if(array.count > 1)
//        {
//            MultipleAppointmentsViewController *controller = [[MultipleAppointmentsViewController alloc] initWithNibName:@"MultipleAppointmentsViewController" bundle:nil];
//            controller.datasource = array;
//            controller.delegate = self;
//            controller.sender = sender;
//            if(!self.popoverController)
//            {
//                [popoverController release];
//            }
//            self.popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
//            self.popoverController.popoverContentSize = CGSizeMake(290, 120);
//            [self.popoverController presentPopoverFromRect:sender.frame inView:sender.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else
//        {
//            [subMenuOptionsSheet showFromRect:sender.frame inView:[sender superview]  animated:YES];
//            [subMenuOptionsSheet bringSubviewToFront:[sender superview]];
//        }
//    }
//}
//
//#pragma mark-  MultipleAppointment delegate method
//- (void)didSelectRow:(NSInteger)row withObject:(Appointment *)appointment
//{
//    pCurrentObject = appointment;
//}
//
//#pragma mark-  UIScrollView delegate method
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This delegate method is overridden to support the Scrolling Process of rightSideTableView in DailyCalendar
//// when leftTableView cell is selected.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (scrollView == self.sideTimeTableView)
//    {
//        
//        self.weekCollectionView.contentOffset = scrollView.contentOffset;
//    }
//    else if (scrollView == self.weekCollectionView)
//    {
//        self.sideTimeTableView.contentOffset = scrollView.contentOffset;
//    }
//    else if (scrollView == self.leftSideDayList)
//    {
//        if([self.leftSideDayList indexPathsForVisibleRows].count > 0)
//        {
//            NSIndexPath *firstVisibleIndexPath = [[self.leftSideDayList indexPathsForVisibleRows] objectAtIndex:0];
//            
//            LeftAppointmentListCell* cell = (LeftAppointmentListCell*)[leftSideDayList cellForRowAtIndexPath:firstVisibleIndexPath];
//            
//            NSString* dateLabelText = cell.providerLabel.text;
//            NSString* formattedDate = [GlobalFunctions ConvertDate:dateLabelText FromFormat:@"MM/dd/yyyy" toFormat:@"MMMM yyyy"];
//            if(![formattedDate isEqualToString:listDateLabel.text])
//            {
//                listDateLabel.text = formattedDate;
//            }
//        }
//    }
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This delegate method is overridden to support the Scrolling Process of rightSideTableView in DailyCalendar
//// when leftTableView cell is selected.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    if([self.leftSideDayList indexPathsForVisibleRows].count > 0)
//    {
//        NSIndexPath *firstVisibleIndexPath = [[self.leftSideDayList indexPathsForVisibleRows] objectAtIndex:0];
//        //(@"first visible cell's section: %i, row: %i", firstVisibleIndexPath.section, firstVisibleIndexPath.row);
//    }
//}
//#pragma -mark uiactionSheet delegate method
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    [self.popoverController dismissPopoverAnimated:YES];
//    NSString *patientID = [NSString stringWithFormat:@"%@",[pCurrentObject csPatientID]];
//    MedMasterProAppDelegate * appDelegate =(MedMasterProAppDelegate *)[[UIApplication sharedApplication]delegate];
//    
//	if (buttonIndex == actionSheet.cancelButtonIndex)
//    {
//        return;
//    }
//    
//    
//    switch (buttonIndex)
//    {
//        case 0: //Start Visit
//            [[ServiceManager SharedObject] setAddedPatientId:patientID];
//            [[ServiceManager SharedObject] setCallVisitFromCalendar:YES];
//            [[ServiceManager SharedObject] setIsFrompatient:YES];
//            appDelegate.tabBarController.selectedIndex=2;
//            break;
//        case 1: //Edit Appointment
//            [pAppointmentsParent setDetailItem:pCurrentObject];
//            [pAppointmentsParent EditAppointmentButtonTpd:nil];
//            break;
//        case 2: //Edit Patient
//            [pAppointmentsParent setDetailItem:pCurrentObject];
//            [pAppointmentsParent setIsFromCalendarTableCell:YES];
//            break;
//        case 3: //Patient Chart
//        {
//            [[ServiceManager SharedObject] setAddedPatientId:patientID];
//            [[ServiceManager SharedObject] setPatientChangedFromPatientList:YES];
//            [[ServiceManager SharedObject] setShouldUpdatePatientChart:YES];
//            appDelegate.tabBarController.selectedIndex=0;
//            break;
//        }
//        case 4: //Delete Appointment
//        {
//            // Ticket#547 Status = Changes done , Done By Usama, Date:22/11/2012
//            // Description:  Delete appointment functionality is added in appointment tab.
//            BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Delete Appointment" message:@"Are you sure you want to delete this appointment?"];
//            [alert setDestructiveButtonWithTitle:@"Yes" block:^{
//                 [self DeleteAppointment];
//                               
//            }];
//            [alert addButtonWithTitle:@"No" block:^{
//                return ;
//            }];
//            [alert show];
//        }
//            break;
//            
//        default:
//            break;
//    }
//}
//
//
//#pragma mark -
//#pragma mark ASYNC URL Delegate
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////  This ASYNC URL delegate method is called when response of a request is successfully fetched in the form of
//// NSData which is then passed to respective method for Parsing.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ASyncURLDel:(ASyncURL *)ASyncURLDel didRetrieveData:(NSData *)data
//{
//    
//	if ([ASyncURLDel getLastCallType] == URL_TYPE_GET_APPOINMENTS_HIDDEN || [ASyncURLDel getLastCallType] == URL_TYPE_GET_APPOINMENTS)
//	{
//        m_pXmlParser = [[TBXML alloc] initWithXMLData:data];
//        [self ParseAppointmentsXMLData];
//        [self PopulateArrayForTableView];
//    }
//    
//    else if ([ASyncURLDel getLastCallType] == URL_TYPE_DELETE_APPOINMENT)
//    {
//        m_pXmlParser = [[TBXML alloc] initWithXMLData:data];
//        [self ParseDeleteAppointment];
//        /*
//         Ticket # 590 - Fixed by Hanny Tufail : Dated Nov 29, 2012
//          Description:  Now the appointment list in the popover also gets refreshed and the application crash is fixed.
//         */
//        if (greenWayAPIselected)
//        {
//            [[ServiceManager SharedObject] RefreshAppointmentListForGreenway];
//        }
//        else
//        {
//            [[ServiceManager SharedObject] GetAppoinmentsData];
//        }
//
//      
//    }
//    
//	
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ASyncURLDelHasBadCredentials:(ASyncURL *)ASyncURLDel
//{
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ASyncURLDel:(ASyncURL *)ASyncURLDel didCreateResourceAtURL:(NSString *)url
//{
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ASyncURLDel:(ASyncURL *)ASyncURLDel didFailWithError:(NSError *)error
//{
//    
//    NSString* csMessage = @"";
//    if ([error code] != 1009)
//    {
//        csMessage = [NSString stringWithFormat:@"%@ \n ERROR During Call # : %d",[error localizedDescription], [ASyncURLDel getLastCallType]];
//    }
//    else
//    {
//        csMessage = [error localizedDescription];
//    }
//    
//    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Error" message:csMessage];
//    [alert setDestructiveButtonWithTitle:@"OK" block:nil];
//    [alert show];
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)ASyncURLDel:(ASyncURL *)ASyncURLDel didReceiveStatusCode:(int)statusCode
//{
//}
//
//#pragma mark -
//#pragma mark XML PARSING SECTION
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) ParseDeleteAppointment
//{
//    
//    TBXMLElement *root = m_pXmlParser.rootXMLElement;
//	if (root)
//    {
//        TBXMLElement *status=[TBXML childElementNamed:@"status" parentElement:root];
//        TBXMLElement *reason=[TBXML childElementNamed:@"reason" parentElement:root];
//        NSString *reasonCheck = @"";
//        NSString *statusCheck = @"";
//        
//      
//      
//        if (status)
//        {
//             statusCheck = [TBXML textForElement:status];
//            if (reason) {
//                 reasonCheck = [TBXML textForElement:reason];
//            }
//            else{
//                reasonCheck=@"";
//            }
//            
//            if ([statusCheck intValue]==0)
//            {
//                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Appointment" message:reasonCheck];
//                [alert setDestructiveButtonWithTitle:@"OK" block:nil];
//                [alert show];
//            }
//            else
//            {
//                BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Appointment" message:reasonCheck];
//                [alert setDestructiveButtonWithTitle:@"OK" block:nil];
//                [alert show];
//            }
//        }
//        
//    }
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) ParseAppointmentsXMLData
//{
//    [appointmentArray removeAllObjects];
//	//(@"PARSING APPOINTMENTS DATA .... ");
//    TBXMLElement *root = m_pXmlParser.rootXMLElement;
//	if (root)
//	{
//		[self.pDataSource removeAllObjects];
//		TBXMLElement * appointment = [TBXML childElementNamed:@"Appointment" parentElement:root];
//		
//		while (appointment != nil)
//		{
//			Appointment* pApp = [[Appointment alloc]init];
//			TBXMLElement * appointmentid = [TBXML childElementNamed:@"pc_eid" parentElement:appointment];
//            if (appointmentid) {
//                pApp.csappointmentID =  [TBXML textForElement:appointmentid];
//            }
//            
//			TBXMLElement * patientid = [TBXML childElementNamed:@"pid" parentElement:appointment];
//            if (patientid) {
//                
//                [pApp setCsPatientID:[TBXML textForElement:patientid]];
//                
//                
//            }
//            
//			TBXMLElement * firstname = [TBXML childElementNamed:@"fname" parentElement:appointment];
//            if (firstname) {
//                
//                NSString *firstNameString = [NSString stringWithFormat:@"%@",[TBXML textForElement:firstname]];
//                
//                if (firstNameString== nil || [firstNameString isEqualToString:@"(null)"]) {
//                    pApp.csFirstName = @"";
//                }
//                else
//                {
//                    pApp.csFirstName =[NSString stringWithFormat:@"%@",firstNameString];
//                }
//            }
//			TBXMLElement * lastname = [TBXML childElementNamed:@"lname" parentElement:appointment];
//            if (lastname) {
//                
//                
//                NSString *lastNameString = [NSString stringWithFormat:@"%@",[TBXML textForElement:lastname]];
//                
//                if (lastNameString== nil || [lastNameString isEqualToString:@"(null)"]) {
//                    pApp.csLastName = @"";
//                }
//                else
//                {
//                    pApp.csLastName =[NSString stringWithFormat:@"%@",lastNameString];
//                }
//
//                
//                
//            }
//            TBXMLElement * gender = [TBXML childElementNamed:@"gender" parentElement:appointment];
//            if (gender) {
//                pApp.csGender = [TBXML textForElement:gender];
//            }
//            TBXMLElement * appstatus = [TBXML childElementNamed:@"pc_apptstatus" parentElement:appointment];
//            if (appstatus) {
//                pApp.csStatus = [TBXML textForElement:appstatus];
//            }
//			TBXMLElement * location = [TBXML childElementNamed:@"pc_title" parentElement:appointment];
//            if (location) {
//                pApp.csReason = [TBXML textForElement:location];
//            }
//			TBXMLElement * comments = [TBXML childElementNamed:@"pc_hometext" parentElement:appointment];
//            if (comments) {
//                
//                NSString *commentString = [NSString stringWithFormat:@"%@",[TBXML textForElement:comments]];
//                
//                if (commentString== nil || [commentString isEqualToString:@"(null)"]|| [commentString isEqualToString:@""]) {
//                    pApp.csComments = @"";
//                }
//                else
//                {
//                    pApp.csComments =[NSString stringWithFormat:@"%@",commentString];
//                }
//
//            }
//            TBXMLElement * facilty = [TBXML childElementNamed:@"facility_name" parentElement:appointment];
//            if (facilty) {
//                
//                NSString *faciltyString = [NSString stringWithFormat:@"%@",[TBXML textForElement:facilty]];
//                
//                if (faciltyString== nil || [faciltyString isEqualToString:@"(null)"]|| [faciltyString isEqualToString:@""]) {
//                    pApp.csFacilty = @"";
//                }
//                else
//                {
//                    pApp.csFacilty =[NSString stringWithFormat:@"%@",faciltyString];
//                }
//
//            }
//            
//            TBXMLElement * faciltyId = [TBXML childElementNamed:@"pc_facility" parentElement:appointment];
//            if (faciltyId) {
//                pApp.csFaciltyId = [TBXML textForElement:faciltyId];
//            }
//            
//            TBXMLElement * category = [TBXML childElementNamed:@"pc_catname" parentElement:appointment];
//            if (category) {
//                pApp.csCategory = [TBXML textForElement:category];
//            }
//            
//            TBXMLElement * categoryId = [TBXML childElementNamed:@"pc_catid" parentElement:appointment];
//            if (categoryId) {
//                pApp.csCategoryId = [TBXML textForElement:categoryId];
//            }
//            
//            TBXMLElement * billing = [TBXML childElementNamed:@"billing_location_name" parentElement:appointment];
//            if (billing) {
//                pApp.csBilling = [TBXML textForElement:billing];
//            }
//            
//            TBXMLElement * billingId = [TBXML childElementNamed:@"pc_billing_location" parentElement:appointment];
//            if (billingId) {
//                pApp.csBillingId = [TBXML textForElement:billingId];
//            }
//            
//            
//            TBXMLElement * patientImage = [TBXML childElementNamed:@"patient_profile_image" parentElement:appointment];
//            if (patientImage) {
//                pApp.csPatientImageURL = [TBXML textForElement:patientImage];
//            }
//
//            NSMutableString *name=[[NSMutableString alloc] init];
//			TBXMLElement * fname = [TBXML childElementNamed:@"ufname" parentElement:appointment];
//            if (fname) {
//                name=[NSMutableString stringWithFormat:@"%@",[TBXML textForElement:fname]];
//            }
//            
//            TBXMLElement * mname = [TBXML childElementNamed:@"umname" parentElement:appointment];
//            if (mname) {
//                [name appendFormat:@" %@",[TBXML textForElement:mname]];;
//            }
//            TBXMLElement * lname = [TBXML childElementNamed:@"ulname" parentElement:appointment];
//            if (lname) {
//                [name appendFormat:@" %@",[TBXML textForElement:lname]];
//                [pApp setCsProvider:name];
//            }
//            
//            TBXMLElement * providerId = [TBXML childElementNamed:@"uprovider_id" parentElement:appointment];
//            if (providerId) {
//                pApp.csProviderId = [TBXML textForElement:providerId];
//            }
//            
//			TBXMLElement * appointmentdate = [TBXML childElementNamed:@"pc_eventDate" parentElement:appointment];
//            // set the Date Format
//            NSString *date = [NSString stringWithFormat:@"%@",[TBXML textForElement:appointmentdate]];
//            
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//            NSDate *dateFromString = [[NSDate alloc] init];
//            dateFromString = [dateFormatter dateFromString:date];
//            [dateFormatter release];
//            
//            
//            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//            [dateFormat setDateFormat:@"MM/dd/yyyy"];
//            NSString *dateString = [dateFormat stringFromDate:dateFromString];
//            [dateFormat release];
//            if (appointmentdate) {
//                pApp.csAppointmentDate = dateString;
//            }
//			TBXMLElement * starttime = [TBXML childElementNamed:@"pc_startTime" parentElement:appointment];
//            NSString *getTime;            
//            if (starttime)
//            {
//                getTime = [NSString stringWithFormat:@"%@",[TBXML textForElement:starttime]];
//                //(@"%@",getTime);
//                
//                if ([getTime isEqualToString:@""] || [getTime isEqualToString:@"(null)"]) {
//                    
//                    pApp.csStartTime = @"";
//                }
//                
//                else{
//                    
//                    NSArray *subStrings = [getTime componentsSeparatedByString:@":"];
//                    if ([subStrings count]>1)
//                    {
//                        NSString *hourString = [subStrings objectAtIndex:0];
//                        NSString *minuteString = [subStrings objectAtIndex:1];
//                        NSString *setTime;
//                        int time = [hourString intValue];
//                        
//                        if (time == 12)
//                        {
//                            setTime = [NSString stringWithFormat:@"%i:%@ PM", time, minuteString];
//                        }
//                        else if (time >12)
//                        {
//                            time = time - 12;
//                            if (time<=9) {
//                                setTime = [NSString stringWithFormat:@"0%i:%@ PM", time, minuteString];
//                            }
//                            else
//                            {
//                                setTime = [NSString stringWithFormat:@"%i:%@ PM", time, minuteString];
//                            }
//                            
//                        }
//                        else
//                        {
//                            if ([hourString isEqualToString:@"00"])
//                            {
//                                setTime = [NSString stringWithFormat:@"12:%@ AM", minuteString];
//                            }
//                            else
//                            {
//                                setTime = [NSString stringWithFormat:@"%@:%@ AM", hourString, minuteString];
//                            }
//                            
//                        }
//                        if (setTime)
//                        {
//                            
//                            if ([setTime isEqualToString:@""])
//                            {
//                                pApp.csStartTime = @"";
//                            }
//                            else
//                            {
//                                
//                                NSArray *subStrings = [setTime componentsSeparatedByString:@":"];
//                                NSString *hourString;
//                                NSString *minuteCompleteString;
//                                if (subStrings.count >1)
//                                {
//                                    hourString = [subStrings objectAtIndex:0];
//                                    minuteCompleteString = [subStrings objectAtIndex:1];
//                                }
//                                
//                                NSArray *AMSeparatorArray = [minuteCompleteString componentsSeparatedByString:@" "];
//                                NSString *minuteString;
//                                NSString *AMPMString;
//                                
//                                if (AMSeparatorArray.count>0)
//                                {
//                                    minuteString = [AMSeparatorArray objectAtIndex:0];
//                                    AMPMString = [AMSeparatorArray objectAtIndex:1];
//                                    
//                                }
//                                float minut = [minuteString floatValue];
//                                int minuts = floorf(minut / 15);
//                                NSString *newTime = @"";
//                                if (minuts == 0) {
//                                    newTime = [NSString stringWithFormat:@"%@:00 %@", hourString, AMPMString];
//                                }
//                                else if (minuts == 1)
//                                {
//                                    newTime = [NSString stringWithFormat:@"%@:15 %@", hourString, AMPMString];
//                                }
//                                else if (minuts == 2)
//                                {
//                                    newTime = [NSString stringWithFormat:@"%@:30 %@", hourString, AMPMString];
//                                }
//                                else if (minuts == 3)
//                                {
//                                    newTime = [NSString stringWithFormat:@"%@:45 %@", hourString, AMPMString];
//                                }
//                                pApp.csStartTime = newTime;
//                            }
//                        
//                        }
//                    }
//                    else
//                    {
//                        pApp.csStartTime = @""; 
//                    }
//                    
//                }
//                
//            }
//
//            
//			TBXMLElement * endtime = [TBXML childElementNamed:@"pc_endTime" parentElement:appointment];
//            NSString *getTime1;
//            if (endtime)
//            {
//                getTime1 = [NSString stringWithFormat:@"%@",[TBXML textForElement:endtime]];
//                NSArray *subStrings1 = [getTime1 componentsSeparatedByString:@":"];
//                if ([subStrings1 count]>1) {
//                    NSString *hourString1 = [subStrings1 objectAtIndex:0];
//                    NSString *minuteString1 = [subStrings1 objectAtIndex:1];
//                    NSString *setTime1;
//                    int time1 = [hourString1 intValue];
//                    if (time1 >12)
//                    {
//                        time1 = time1 - 12;
//                        setTime1 = [NSString stringWithFormat:@"%i:%@ PM", time1, minuteString1];
//                    }
//                    else{ setTime1 = [NSString stringWithFormat:@"%@:%@ AM", hourString1, minuteString1];
//                    }
//                    if (setTime1) {
//                        pApp.csEndTime = setTime1;
//                    }
//                    
//                }
//                else
//                {
//                    pApp.csEndTime = [TBXML textForElement:endtime];
//                }
//            }
//            
//            TBXMLElement * resourceId = [TBXML childElementNamed:@"ResourceID" parentElement:appointment];
//            if (resourceId) {
//                [pApp setCsResourceId:[TBXML textForElement:resourceId]];
//            }
//            TBXMLElement * resourceName = [TBXML childElementNamed:@"ResourceName" parentElement:appointment];
//            if (resourceName) {
//                [pApp setCsResourceName:[TBXML textForElement:resourceName]];
//            }
//            TBXMLElement * apptTypeId = [TBXML childElementNamed:@"AppointmentTypeID" parentElement:appointment];
//            if (apptTypeId) {
//                [pApp setCsApptTypeId:[TBXML textForElement:apptTypeId]];
//            }
//            TBXMLElement * apptTypeName = [TBXML childElementNamed:@"ApptTypeName" parentElement:appointment];
//            if (apptTypeName) {
//                [pApp setCsApptTypeName:[TBXML textForElement:apptTypeName]];
//            }
//            TBXMLElement * apptResourceCatId = [TBXML childElementNamed:@"ResourceCategoryID" parentElement:appointment];
//            if (apptResourceCatId) {
//                [pApp setCsResourceCatId:[TBXML textForElement:apptResourceCatId]];
//            }
//            TBXMLElement * apptResouceCatName = [TBXML childElementNamed:@"ResourceCategoryName" parentElement:appointment];
//            if (apptResouceCatName) {
//                [pApp setCsResourceCatName:[TBXML textForElement:apptResouceCatName]];
//            }
//            
//			[self.appointmentArray addObject:pApp];
//			appointment = [TBXML nextSiblingNamed:@"Appointment" searchFromElement:appointment];
//		}
//	}
//	[m_pXmlParser release];
//    
//    
//    
//}
//
//
//#pragma mark -
//#pragma mark IBAction Methods
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method refreshes the TableView in DailyCalendar and sets the appointments in it of the selectedDate.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) ReloadCalendarWithDateTime
//{
//    
//    [self PopulateArrayForTableView];
//    
//    NSDate *localDate = self.selectedDate;//[NSDate date];
//    NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc]init]autorelease];
//    timeFormatter.dateFormat = @"hh:mm a";
//    NSString *dateString = [timeFormatter stringFromDate: localDate];
//    
//    /////////////////////
//    //  Ticket #    By  Hanny Tufail Date: November 12, 2012
//    //  Description: Previously TimeTable (right side) scrolls when Edit Patient Option from Menu sheet is selected.
//    NSString *exactTimeString;
//    NSString *hourString;
//    NSString *AMPMString;
//    NSArray *timingSubStrings = [dateString componentsSeparatedByString:@" "];
//    if ([timingSubStrings count]>1)
//    {
//        NSString *timeString = [timingSubStrings objectAtIndex:0];
//        AMPMString = [timingSubStrings objectAtIndex:1];
//        
//        NSArray *hourSubStrings = [timeString componentsSeparatedByString:@":"];
//        if ([hourSubStrings count]>1)
//        {
//            hourString = [hourSubStrings objectAtIndex:0];
//        }
//    }
//    
//    exactTimeString = [NSString stringWithFormat:@"%@ %@", hourString, AMPMString];
//    
//    NSInteger indexPathForRow;
//    if ([AMPMString isEqualToString:@"AM"])
//    {
//        
//        indexPathForRow=[hourString integerValue];
//        if (indexPathForRow == 12)
//        {
//            indexPathForRow = 0;
//        }
//        
//    }
//    else if ([AMPMString isEqualToString:@"PM"])
//    {
//        
//        indexPathForRow=[hourString integerValue];
//        if (indexPathForRow == 12)
//        {
//            indexPathForRow = 23;
//        }else
//        {
//            indexPathForRow +=12;
//        }
//    }
//    [self.timeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPathForRow inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    
//    ////////////////////
//    IndexOfCell = -1;
//    
//    [self displayMonthForData:self.selectedDate andView:m_pCalendarView];
//    
//    if (csSelectedDate != nil)
//    {
//        KLTile * pT = [m_pCalendarView getNonSelectedTileFromDate:csSelectedDate];
//        if(prevTile != nil)
//        {
//            ((CheckmarkTile*)prevTile).checkmarked = FALSE;
//            [prevTile setNeedsDisplay];
//            [prevTile release];
//        }
//        
//        if (pT)
//        {
//            ((CheckmarkTile*)pT).checkmarked = TRUE;
//            prevTile = pT;
//            [prevTile retain];
//            [pT flash];
//        }
//        
//    }
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method populates the next week dates and appointments in WeeklyCalendar with animnation.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)NextWeekButtonTpd:(id)sender
//{
//    [self HideBubbleView];
//     weekOftheYear++;
//    [self setWeekChart];
//    [self PopulateArrayForWeekCollectionView];
//    [self.weekCollectionView reloadData];
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.weekView cache:YES];
//    
//    [UIView commitAnimations];
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////  This method populates the previous week dates and appointments in WeeklyCalendar with animation.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)PrevWeekButtonTpd:(id)sender
//{
//    [self HideBubbleView];
//    
//    weekOftheYear--;
//    [self setWeekChart];
//    
//    [self PopulateArrayForWeekCollectionView];
//    [self.weekCollectionView reloadData];
//    
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.weekView cache:YES];
//    
//    [UIView commitAnimations];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////  This method calculates the dates of Next Week and returns the Array.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(NSArray *)getNextWeekDates
//{      
//    NSDateComponents *components = [NSDateComponents new];
//    NSMutableArray * weekDates = [[NSMutableArray alloc] init];
//    NSDate *firstDate, *lastDate;
//    
//    [self.pVisibleWeekDatesArray removeAllObjects];
//    NSDate *newdate;
//    
//    for (int i =1;i<8; i++)
//    {
//        components.weekday = i;
//        components.weekOfYear = weekOftheYear;
//        if (weekOftheYear >= 52){
//            components.year = 2014;
//        }
//        else{
//            components.year = 2013;
//        }
//        
//        newdate = [[NSCalendar currentCalendar] dateFromComponents: components];
//        if (i==1) {
//            firstDate = newdate;
//        }
//        if (i==7) {
//            lastDate= newdate;
//        }
//        
//        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
//        dateFormatter.dateFormat = @"yyyy-MM-dd";
//        NSString *dateString = [dateFormatter stringFromDate:newdate];
//        
//        dateFormatter.dateFormat = @"MM/dd/yyyy";
//        NSString *dateForWeekVisibleArray = [dateFormatter stringFromDate:newdate];
//        [self.pVisibleWeekDatesArray addObject:dateForWeekVisibleArray];
//        
//        NSArray *subStrings = [dateString componentsSeparatedByString:@"-"];
//        NSString *dateComponentStrings = @"";
//        if (subStrings.count>1)
//        {
//            dateComponentStrings = [subStrings objectAtIndex:2];
//        }
// 
//        [weekDates addObject:dateComponentStrings];
//    }
//    
//    
//    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//    
//    [formatter setDateFormat:@"EEEE, MMMM d yyyy"];
//    
//    NSString *pFirstDateString = [formatter stringFromDate:firstDate];
//    NSString *pLastDateString = [formatter stringFromDate:lastDate];
//    
//    NSArray *subStringForFristDate = [pFirstDateString componentsSeparatedByString:@","];
//    NSString *dayString;
//    if (subStringForFristDate.count>0)
//    {
//        dayString = [subStringForFristDate objectAtIndex:0];
//    }
//    
//    NSString *completeDateFristString = [subStringForFristDate objectAtIndex:1];
//    NSArray *dateComponentFristStrings = [completeDateFristString componentsSeparatedByString:@" "];
//    NSString *monthString = [dateComponentFristStrings objectAtIndex:1];
//   
//    NSString *yearString = [dateComponentFristStrings objectAtIndex:3];
//    
//    
//    NSArray *subStringForLastDate = [pLastDateString componentsSeparatedByString:@","];
//    NSString *dayLastString;
//    if (subStringForLastDate.count>0)
//    {
//        dayLastString = [subStringForLastDate objectAtIndex:0];
//    }
//    
//    NSString *completeDateLastString = [subStringForLastDate objectAtIndex:1];
//    NSArray *dateLastComponentStrings = [completeDateLastString componentsSeparatedByString:@" "];
//    NSString *monthLastString = [dateLastComponentStrings objectAtIndex:1];
//   
//    NSString *yearLastString = [dateLastComponentStrings objectAtIndex:3];
//    
//    if ([monthString isEqualToString:monthLastString] && [yearString isEqualToString:yearLastString])
//    {
//         self.weekTopDateLabel.text = [NSString stringWithFormat:@"%@ %@", monthString, yearString];
//    }
//    else
//    {
//        self.weekTopDateLabel.text = [NSString stringWithFormat:@"%@ - %@ %@", monthString,monthLastString, yearString];
//    }
//    
//      
//    return weekDates;
//   
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the Weekchart and sets the Weekdays at the Top in WeeklyCalendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)setWeekChart
//{
//    NSArray *nextDates = [self getNextWeekDates];
//    
//    self.sundayLabel.text = [NSString stringWithFormat:@" %@ Sunday",[nextDates objectAtIndex:0]];
//    self.mondayLabel.text = [NSString stringWithFormat:@" %@ Monday",[nextDates objectAtIndex:1]];
//    self.tuesdayLabel.text = [NSString stringWithFormat:@" %@ Tuesday",[nextDates objectAtIndex:2]];
//    self.wednesdayLabel.text = [NSString stringWithFormat:@" %@ Wednesday",[nextDates objectAtIndex:3]];
//    self.thursdayLabel.text = [NSString stringWithFormat:@" %@ Thursday",[nextDates objectAtIndex:4]];
//    self.fridayLabel.text = [NSString stringWithFormat:@" %@ Friday",[nextDates objectAtIndex:5]];
//    self.saturdayLabel.text = [NSString stringWithFormat:@" %@ Saturday",[nextDates objectAtIndex:6]];
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method returns the last date of the Previous Month.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(int)lastDateOfPreviousMonth
//{
//    NSCalendar* cal = [NSCalendar currentCalendar];
//    NSDateComponents* comps = [[[NSDateComponents alloc] init] autorelease];
//    
//    // Set your month here
//    int prevMonth = monthOftheYear -1;
//    [comps setMonth:prevMonth];
//    
//    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit
//                              inUnit:NSMonthCalendarUnit
//                             forDate:[cal dateFromComponents:comps]];
//    
//    return range.length;
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method calculates the number of dates of PreviousMonth to display in first section of CollectionVeiw in
//// Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(NSString *)PreviousMonthDatesForFirstSection:(int) rowIndex
//{
//    int indexOffirstDay = [weekDaysArray indexOfObject:firstDayOfMonth];
//    int lastDateOfPrevMonth = [self lastDateOfPreviousMonth];
//    
//    int differenceOfDates = lastDateOfPrevMonth -(indexOffirstDay - (rowIndex+1));
//    
//    return [NSString stringWithFormat:@"%i",differenceOfDates];
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method returns the first Date of Current Month and total Number of days in it in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(NSDate *)getFirstDayOftheMonth
//{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    // Start out by getting just the year, month and day components of the current date.
//    NSDate *currentDate = [NSDate date];
//    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
//                                                        fromDate:currentDate];
//    // Change the Day component to 1 (for the first day of the month).
//    [components setDay:1];
//    [components setMonth:monthOftheYear];
//    
//    NSDate * newDate = [calendar dateFromComponents:components];
//    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
//                           inUnit:NSMonthCalendarUnit
//                          forDate:newDate];
//    numberofDaysInMonth = days.length;
//    
//    return [calendar dateFromComponents:components];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method calculates the first Day of the Month in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(NSArray *) getMonthDates
//{
//    NSMutableArray * monthDates = [[NSMutableArray alloc] init];
//    NSDate * firstDateOftheMonth = [self getFirstDayOftheMonth]; // get the Frist day Of the Month.
//    
//    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//    
//    [formatter setDateFormat:@"EEEE, MMMM d yyyy"];
//    
//    NSString *pFirstDateString = [formatter stringFromDate:firstDateOftheMonth];
//   
//    
//    NSArray *subStringForFristDate = [pFirstDateString componentsSeparatedByString:@","];
//    NSString *dayString;
//    if (subStringForFristDate.count>0)
//    {
//        dayString = [subStringForFristDate objectAtIndex:0];
//    }
//    self.firstDayOfMonth = dayString;       
//    return monthDates;
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the Current Month and Year for TopHeadingLabel in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void)setMonthChart
//{
//    
//    NSCalendar *calendars = [NSCalendar currentCalendar];
//    NSDateComponents *nextMonthComponents = [calendars components:NSDayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit fromDate:[NSDate date]];
//    nextMonthComponents.month = monthOftheYear;
//    NSDate *nextMonthDate = [calendars dateFromComponents:nextMonthComponents];
//    
//    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
//    [formatter setDateFormat:@"EEEE, MMMM d yyyy"];
//    
//    NSString *pDateString = [formatter stringFromDate:nextMonthDate];
//    NSArray *subStringForDate = [pDateString componentsSeparatedByString:@" "];
//    NSString *monthString = @"";
//    NSString *yearString = @"";
//    if (subStringForDate.count>3)
//    {
//        monthString = [subStringForDate objectAtIndex:1];
//        yearString = [subStringForDate objectAtIndex:3];
//    }
//    
//    year = [yearString intValue];
//    self.monthTopLabel.text = [NSString stringWithFormat:@"%@ %@",monthString, yearString];
//    
//    [self getMonthDates];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method is responsible to show the CalendarViews based on the selection from Segment bar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//-(void) CalendartTypButtonPressed:(int) segmentIndex
//{   
//    if (segmentIndex == 0)
//    {
//        for (UIView *view in [self.innerView subviews])
//        {
//            if (view == self.weekView || view == self.monthView || view == self.yearView)
//            {
//                [view removeFromSuperview];
//                segementSelectedIndex = 0;
//            }
//        }
//        
//        [self.innerView addSubview:self.dayView];
//    }
//    else if (segmentIndex == 1)
//    {
//        for (UIView *view in [self.innerView subviews])
//        {
//            if (view == self.dayView || view == self.monthView || view == self.yearView)
//            {
//                [view removeFromSuperview];
//                segementSelectedIndex = 1;
//            }
//        }
//        todayCheckForWeekSection = YES;
//        [self setWeekChart];
//        [self PopulateArrayForWeekCollectionView];
//        [self.innerView addSubview:self.weekView];
//        [self.weekCollectionView reloadData];
//    }
//    
//    else if (segmentIndex == 2)
//    {
//        for (UIView *view in [self.innerView subviews])
//        {
//            if (view == self.dayView || view == self.weekView || view == self.yearView)
//            {
//                [view removeFromSuperview];
//                segementSelectedIndex = 2;
//            }
//        }
//        
//        [self setMonthChart];
//        dateCounter = 1;
//        firstDayNotFound = TRUE;
//        newMonthStarted = FALSE;
//        
//        [self.innerView addSubview:self.monthView];
//        [self.monthCollectionView reloadData];
//
//    }
//    else if(segmentIndex == 3)
//    {
//        for (UIView *view in [self.innerView subviews])
//        {
//            if (view == self.dayView || view == self.weekView || view == self.monthView)
//            {
//                [view removeFromSuperview];
//                segementSelectedIndex = 3;
//            }
//        }
//        
//        [self.innerView addSubview:self.yearView];
//        [self.yearCollectionView reloadData];
//    }
//    else if (segmentIndex == 4)
//    {
//        [self GetUniqueDatesFromAppointmentArray];
//        for (UIView *view in [self.innerView subviews])
//        {
//            if (view == self.dayView || view == self.weekView || view == self.monthView || view == self.yearView)
//            {
//                [view removeFromSuperview];
//                segementSelectedIndex = 4;
//            }
//        }
//        [self.innerView addSubview:self.listView];
//        [self.leftSideDayList reloadData];
//    }
//    
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)CancelBarBtnTpd:(id)sender
//{
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the NextMonth dates, refreshes the collectionView with animation in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)NextMonthButtonTpd:(id)sender
//{
//    monthOftheYear++;
//    [self setMonthChart];
//    dateCounter = 1;
//    firstDayNotFound = TRUE;
//    newMonthStarted = FALSE;
//    [self.monthCollectionView reloadData];
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.monthView cache:YES];
//    
//    [UIView commitAnimations];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the Previous Month dates, refreshes the collectionView with animation in Monthly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)PrevMonthButtontpd:(id)sender
//{
//    monthOftheYear--;
//    [self setMonthChart];
//    dateCounter = 1;
//    firstDayNotFound = TRUE;
//    newMonthStarted = FALSE;
//    [self.monthCollectionView reloadData];
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.monthView cache:YES];
//    
//    [UIView commitAnimations];
//
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the NextYear calendars, refreshes the collectionView with animation in Yearly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)nextYearButtonTpd:(id)sender
//{
//    currentYear++;
//    self.yearViewLabel.text = [NSString stringWithFormat:@"%i", currentYear];
//    [self.yearCollectionView reloadData];
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.yearView cache:YES];
//    
//    [UIView commitAnimations];
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method sets the PreviousYear calendars, refreshes the collectionView with animation in Yearly Calendar.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (IBAction)prevYearButtonTpd:(id)sender {
//    
//    currentYear--;
//    self.yearViewLabel.text = [NSString stringWithFormat:@"%i", currentYear];
//    [self.yearCollectionView reloadData];
//    [UIView beginAnimations:@"Flip" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.yearView cache:YES];
//    
//    [UIView commitAnimations];
//}
//
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// The date sort function
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//NSComparisonResult dateSort(NSString *s1, NSString *s2, void *context)
//{
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    
//    NSDate *d1 = [formatter dateFromString:s1];
//    NSDate *d2 = [formatter dateFromString:s2];
//    
//    return [d1 compare:d2]; // ascending order
//}
//
///*****************************************************************************************************************/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// This method gets the unique date sets and sort them for List Calender View.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)GetUniqueDatesFromAppointmentArray
//{
//    NSSet *uniqueStates = [NSSet setWithArray:[self.appointmentArray valueForKey:@"csAppointmentDate"]];
//    uniqueDatesArray = [uniqueStates allObjects];   
//    uniqueDatesArray = [uniqueDatesArray sortedArrayUsingFunction:dateSort context:nil];
//    
//    [uniqueDatesArray retain];
//    [self.leftSideDayList reloadData];
//}



@end
