//
//  BIDViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/8/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "BIDViewController.h"
#import "LoginPopOverViewController.h"
#import "CustomCellDoctorInfo.h"
#import "DoctorInfoItem.h"
#import "ReceptionistDoctorVerifiedViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

@synthesize doctorsTableView;
@synthesize signInButton;
@synthesize arrayDoctorInfo;


- (void)viewDidLoad
{
    [super viewDidLoad];
    objDocProfile = [[PatientViewDocProfileViewController alloc] initWithNibName:@"PatientViewDocProfileViewController" bundle:nil];
    
    arrayDoctorInfo = [[NSMutableArray alloc] init];
    
    ///////////////////////obj1////////////////////////
    DoctorInfoItem *objDoctorInfoItem;    
    objDoctorInfoItem = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem.name =@"Doctor Irfan";
    objDoctorInfoItem.qualification =@"MBBS";
    objDoctorInfoItem.specialization =@" Orthopedic";
    [arrayDoctorInfo addObject:objDoctorInfoItem];

    /////////////////////obj2//////////////////////////
    
    DoctorInfoItem *objDoctorInfoItem1;
    objDoctorInfoItem1 = [[DoctorInfoItem alloc] init];
    
    objDoctorInfoItem1.name =@"Doctor Rizwan";
    objDoctorInfoItem1.qualification =@"MBBS, FRCPS";
    objDoctorInfoItem1.specialization =@" Cardiologist";
    [arrayDoctorInfo addObject:objDoctorInfoItem1];
    /////////////////////obj3//////////////////////////
    
    DoctorInfoItem *objDoctorInfoItem2;
    objDoctorInfoItem2 = [[DoctorInfoItem alloc] init];
    
    objDoctorInfoItem2.name =@"Doctor Zafar";
    objDoctorInfoItem2.qualification =@"MBBS";
    objDoctorInfoItem2.specialization =@"ENT";
    [arrayDoctorInfo addObject:objDoctorInfoItem2];
    //////////////////////obj4/////////////////////////
    DoctorInfoItem *objDoctorInfoItem3;
    objDoctorInfoItem3 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem3.name =@"Doctor Fehmida";
    objDoctorInfoItem3.qualification =@"MBBS";
    objDoctorInfoItem3.specialization =@"Dermatologist";
    [arrayDoctorInfo addObject:objDoctorInfoItem3];
    
    //////////////////////obj4/////////////////////////
    DoctorInfoItem *objDoctorInfoItem4;
    objDoctorInfoItem4 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem4.name =@"Doctor Irfan";
    objDoctorInfoItem4.qualification =@"MBBS";
    objDoctorInfoItem4.specialization =@"Dermatologist";
    [arrayDoctorInfo addObject:objDoctorInfoItem4];
    
    //////////////////////obj4////////////////////////
    DoctorInfoItem *objDoctorInfoItem5;
    objDoctorInfoItem5 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem5.name =@"Doctor Zafar";
    objDoctorInfoItem5.qualification =@"MBBS";
    objDoctorInfoItem5.specialization =@"Dermatologist";
    [arrayDoctorInfo addObject:objDoctorInfoItem5];
    
    //////////////////////obj4////////////////////////
    DoctorInfoItem *objDoctorInfoItem6;
    objDoctorInfoItem6 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem6.name =@"Doctor Zain";
    objDoctorInfoItem6.qualification =@"MBBS";
    objDoctorInfoItem6.specialization =@"Dermatologist";
    [arrayDoctorInfo addObject:objDoctorInfoItem6];

    ////////////////////////Adding array 2 objects//////////////////////

	
    // Do any additional setup after loading the view, typically from a nib.
}

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

///////////////////////////////Table View Methods//////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayDoctorInfo.count;
    NSLog(@"%d",arrayDoctorInfo.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"DoctorInfo";
    
        CustomCellDoctorInfo *cell = (CustomCellDoctorInfo *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellDoctorInformation" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    DoctorInfoItem *tempItem = [arrayDoctorInfo objectAtIndex:indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.nameOfDoctorCustomCellLabel.text =  tempItem.name;
    cell.qualificationAndExpertiseOfDoctorCustomCellLabel.text = tempItem.qualification;
    cell.specializationOfDoctorCustomCellLabel.text = tempItem.specialization;
        return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
////////////////////// did select table method ////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorInfoItem *docItem = [arrayDoctorInfo objectAtIndex:indexPath.row];
    
    [self.view addSubview:objDocProfile.view];
    [objDocProfile SetDoctorDetail:docItem];
    
}

//////////////////////////////SignIn Button and Popover//////////////////////////
- (IBAction)SignInBttn:(id)sender
{
    if(![popover isPopoverVisible])
    {
        loginPopOverViewController = [[LoginPopOverViewController alloc] initWithNibName:@"LoginPopOverViewController" bundle:nil];
        loginPopOverViewController.myDelegate = self;
        popover = [[UIPopoverController alloc]initWithContentViewController:loginPopOverViewController];
        [popover setPopoverContentSize:CGSizeMake(300, 150) animated:YES];
        [popover presentPopoverFromBarButtonItem:self.signInButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        popover.delegate = self;
    }
  
    
    
}

/////////////////////////////Delegate method for user autentification///////////////
-(void)AuthenticateUser
{
    [popover dismissPopoverAnimated:YES];
     receptionist = [[ReceptionistDoctorVerifiedViewController alloc] initWithNibName:@"ReceptionistDoctorVerifiedViewController" bundle:nil];
    [self.view addSubview:receptionist.view];
    
}

@end
