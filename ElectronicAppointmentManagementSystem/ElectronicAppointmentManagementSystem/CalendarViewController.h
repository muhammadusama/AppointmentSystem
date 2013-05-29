//
//  CalendarViewController.h
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import <UIKit/UIKit.h>
//#import "ASyncURL.h"		// Import AsyncURL class to access web and delegate details for this purpose.
//#import "TBXML.h"
#import "KLCalendarView.h"
#import "MultipleAppointmentsViewController.h"
//#import "CalenderViewController.h"

@protocol CalenderViewControllerDelegate <NSObject>

-(void) removeCalenderView:(id)appointmentItem;

@end


@class KLTile;
@class DailyViewController;
@class Appointment;
@class DetailViewController;

@interface CalendarViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, KLCalendarViewDelegate, UIActionSheetDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, MultipleAppointmentsDelegate>
{
    NSMutableArray *appointmentArray;
    NSMutableArray *pDataSource;
    NSMutableArray *pTimeArray;
    //ASyncURL*	m_pURLRequest;			// URL access mechanism based on REST.
//	TBXML*		m_pXmlParser;			// XML parser.
    NSDate *selectedDate;
    KLCalendarView   *m_pCalendarView;
    NSString * csSelectedDate;
    id <CalenderViewControllerDelegate> myCalendarDelegate;
    
    NSString* csSelectedTime;
    int IndexOfCell;
    UIActionSheet *subMenuOptionsSheet;
    Appointment *pCurrentObject;
    
    DetailViewController* pAppointmentsParent;
    bool fromViewDidLoad;
    NSMutableArray* arrayOfindexPaths;
    
    NSIndexPath *selectedIndexPath;
    NSIndexPath *sidetableIndexPath;
    
     KLTile *prevTile;
    
    //////////////////// week Section//////////////
    int weekOftheYear;
    BOOL todayCheckForWeekSection;
    NSMutableArray * pWeekDataSource;
    NSMutableArray * pVisibleWeekDatesArray; // It will contain the dates of Visible week in the calendar;
    int segementSelectedIndex;
    UIView *v;
    
    /////////////////// Month view ///////////////
    int monthOftheYear;

    NSMutableArray *pMonthDataSource;
    NSMutableArray *pVisibleMonthDatesArray; // It will contain the dates of Visible Month in the calendar;
    int dateCounter;
    NSString *firstDayOfMonth;
    BOOL firstDayNotFound;
    BOOL newMonthStarted;
    int numberofDaysInMonth;
    int year;
    NSArray *weekDaysArray;

    /////////////////Year View //////////////////
    int currentYear;
    NSArray* uniqueDatesArray;
    IBOutlet UILabel *listYearLabel;

    IBOutlet UILabel *listDateLabel;
    NSMutableArray* rightSideListDataSource;
    BOOL isBubbleShown;
    UIPopoverController *popoverController;
}

@property (retain, nonatomic) NSString* csSelectedDate;
@property (retain, nonatomic) NSString* csSelectedTime;

@property (retain, nonatomic) id <CalenderViewControllerDelegate> myCalendarDelegate;
@property (retain, nonatomic) NSDate *selectedDate;
@property (retain, nonatomic) NSMutableArray *appointmentArray;
@property (retain, nonatomic) NSMutableArray *pDataSource;
@property (retain, nonatomic) IBOutlet UILabel *dateLabel;
@property (retain, nonatomic) IBOutlet UILabel *completeDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *yearLabel;
@property (retain, nonatomic) IBOutlet UITableView *appointmentsTableView;

@property (retain, nonatomic) IBOutlet UIView *calenderBackGroundView;
@property (retain, nonatomic) IBOutlet UITableView *timeTableView;
@property (retain, nonatomic) IBOutlet UIView *dayView;

@property (retain, nonatomic) IBOutlet UIView *dayLeftSideView;
@property (retain, nonatomic) IBOutlet UIView *dayRightSideView;
@property (retain, nonatomic) IBOutlet UIView *listView;


@property (retain, nonatomic) NSMutableArray * pWeekDataSource;
@property (retain, nonatomic) NSMutableArray * pVisibleWeekDatesArray;
//@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentBar;
@property (retain, nonatomic) IBOutlet UIView *innerView;

@property (nonatomic, retain) DetailViewController* pAppointmentsParent;
@property (nonatomic, retain) UIPopoverController *popoverController;

- (IBAction)CancelBarBtnTpd:(id)sender;

//- (IBAction)SegmentBarTpd:(id)sender;
-(void) PopulateArrayForTableView;
- (void) ReloadCalendarWithDateTime;
-(void) CalendartTypButtonPressed:(int) segmentIndex;


//////////////////////////// Weekly Calendar view//////////////////
@property (retain, nonatomic) IBOutlet UIView *weekView;
@property (retain, nonatomic) IBOutlet UILabel *weekTopDateLabel;
@property (retain, nonatomic) IBOutlet UICollectionView *weekCollectionView;

@property (nonatomic) int segementSelectedIndex;
@property (retain, nonatomic) IBOutlet UIView *weekHeaderView;
@property (retain, nonatomic) IBOutlet UILabel *sundayLabel;
@property (retain, nonatomic) IBOutlet UILabel *mondayLabel;
@property (retain, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (retain, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property (retain, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (retain, nonatomic) IBOutlet UILabel *fridayLabel;
@property (retain, nonatomic) IBOutlet UILabel *saturdayLabel;
@property (retain, nonatomic) IBOutlet UITableView *sideTimeTableView;

- (IBAction)NextWeekButtonTpd:(id)sender;
- (IBAction)PrevWeekButtonTpd:(id)sender;



///////////////////////////////Month Calendar View /////////////////
@property (retain, nonatomic) IBOutlet UIView *monthView;
@property (retain, nonatomic) IBOutlet UILabel *monthTopLabel;
@property (retain, nonatomic) IBOutlet UICollectionView *monthCollectionView;
@property (retain, nonatomic) IBOutlet UIView *monthHeaderView;
@property (retain, nonatomic) NSMutableArray *pMonthDataSource;
@property (retain, nonatomic) NSMutableArray *pVisibleMonthDatesArray;
@property (retain, nonatomic) IBOutlet UILabel *yearViewLabel;
@property (retain, nonatomic) IBOutlet UICollectionView *yearCollectionView;
@property (retain, nonatomic) IBOutlet UIView *yearView;
@property (retain, nonatomic) NSString *firstDayOfMonth;


//*******************LIST VIEW PROPERTIES**************//
@property (retain, nonatomic) IBOutlet UITableView *leftSideDayList;
@property (retain, nonatomic) IBOutlet UITableView *rightSideDayList;
@property (retain, nonatomic) IBOutlet UILabel *dayLabel;
@property (retain, nonatomic) IBOutlet UILabel *dateMonthLabel;
@property (retain, nonatomic) IBOutlet UIView *listHeaderView;
@property (retain, nonatomic) NSMutableArray* rightSideListDataSource;
@property (retain, nonatomic) IBOutlet UILabel *rightListTopHeaderAppointmentTitle;
@property (retain, nonatomic) IBOutlet UILabel *rightListTopHeaderDateLabel;
@property (retain, nonatomic) NSIndexPath *sidetableIndexPath;


//*****************************************************//
- (IBAction)NextMonthButtonTpd:(id)sender;
- (IBAction)PrevMonthButtontpd:(id)sender;
- (IBAction)nextYearButtonTpd:(id)sender;
- (IBAction)prevYearButtonTpd:(id)sender;
NSComparisonResult dateSort(NSString *s1, NSString *s2, void *context);
NSComparisonResult timeSort(Appointment *s1, Appointment *s2, void *context);


@end
