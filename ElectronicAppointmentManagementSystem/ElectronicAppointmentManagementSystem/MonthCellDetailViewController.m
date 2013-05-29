//
//  MonthCellDetailViewController.m
//  MedMasterPro
//
//  Created by Hanny on 3/27/13.
//
//

#import "MonthCellDetailViewController.h"
#import "MonthDetailCell.h"
//#import "Appointment.h"


@interface MonthCellDetailViewController ()

@end

@implementation MonthCellDetailViewController
@synthesize pDataSource;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dealloc
{
    [super dealloc];
    [pDataSource release];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.pDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = [indexPath row];
    static NSString *CellIdentifier = @"MonthDetailCell";
    
    MonthDetailCell *cell = (MonthDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MonthDetailCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    else
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MonthDetailCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    //Appointment * obj = [self.pDataSource objectAtIndex:index];
   // cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@",obj.csFirstName, obj.csLastName];
    //cell.locationLabel.text = obj.csFacilty;

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
