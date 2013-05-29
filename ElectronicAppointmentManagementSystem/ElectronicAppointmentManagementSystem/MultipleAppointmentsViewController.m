//
//  MultipleAppointmentsViewController.m
//  MedMasterPro
//
//  Created by TechCorp on 13/05/2013.
//
//

#import "MultipleAppointmentsViewController.h"
#import "MultipleAppointmentCell.h"
//#import "Appointment.h"
//#import "GlobalFunctions.h"

@interface MultipleAppointmentsViewController ()

@end

@implementation MultipleAppointmentsViewController

@synthesize datasource;
@synthesize delegate;
@synthesize sender;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MultipleAppointmentCell *cell = (MultipleAppointmentCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MultipleAppointmentCell" owner:self options:nil];
    cell = [array objectAtIndex:0];
    //Appointment *item = [self.datasource objectAtIndex:indexPath.row];
    cell.contentView.backgroundColor = [UIColor purpleColor];
    cell.contentView.alpha = 0.3;
 //   cell.name.text = [NSString stringWithFormat:@"%@ %@",item.csLastName,item.csFirstName];
    //cell.facility.text = [NSString stringWithFormat:@"%@",item.csFacilty];
    
//    if(indexPath.row % 2 == 0)
//    {
//        cell.contentView.backgroundColor = [GlobalFunctions getPatientTabTablesBlankColor];
//    }
//    else
//    {
//       cell.contentView.backgroundColor = [GlobalFunctions getPatientTabTablesFilledColor];
//    }
    // Configure the cell...

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.delegate respondsToSelector:@selector(didSelectRow:withObject:)])
    {
        UIActionSheet *subMenuOptionsSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self.delegate cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        [subMenuOptionsSheet addButtonWithTitle:@"Start Visit"];
        [subMenuOptionsSheet addButtonWithTitle:@"Edit Appointment"];
        [subMenuOptionsSheet addButtonWithTitle:@"Edit Patient"];
        [subMenuOptionsSheet addButtonWithTitle:@"Patient Chart"];
        [subMenuOptionsSheet addButtonWithTitle:@"Delete Appointment"];
        [subMenuOptionsSheet setDestructiveButtonIndex:4];
        
        CGRect rect = [self.view convertRect:[self.tableView cellForRowAtIndexPath:indexPath].frame toView:self.sender.superview];
        
        [subMenuOptionsSheet showFromRect:rect inView:self.sender.superview animated:YES];
        [self.delegate didSelectRow:indexPath.row withObject:[self.datasource objectAtIndex:indexPath.row]];
    }
}

@end
