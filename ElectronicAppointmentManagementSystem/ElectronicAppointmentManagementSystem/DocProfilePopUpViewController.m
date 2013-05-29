//
//  DocProfilePopUpViewController.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "DocProfilePopUpViewController.h"
#import "DoctorInfoItem.h"
#import "CustomCellForDoctorPopOver.h"
#import "DoctorProfileViewController.h"
@interface DocProfilePopUpViewController ()

@end

@implementation DocProfilePopUpViewController
@synthesize tableViewDoctor;
@synthesize arrayDocPopOver;
@synthesize myDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ////////Allocing the array///////
    arrayDocPopOver = [[NSMutableArray alloc] init];
    
    ///////////////////////obj1////////////////////////
    DoctorInfoItem *objDoctorInfoItem;
    objDoctorInfoItem = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem.name =@"Doctor Irfan";
    objDoctorInfoItem.qualification =@"MBBS";
    objDoctorInfoItem.specialization =@" Orthopedic";
    [arrayDocPopOver addObject:objDoctorInfoItem];
    
    /////////////////////obj2//////////////////////////
    
    DoctorInfoItem *objDoctorInfoItem1;
    objDoctorInfoItem1 = [[DoctorInfoItem alloc] init];
    
    objDoctorInfoItem1.name =@"Doctor Rizwan";
    objDoctorInfoItem1.qualification =@"MBBS, FRCPS";
    objDoctorInfoItem1.specialization =@" Cardiologist";
    [arrayDocPopOver addObject:objDoctorInfoItem1];
    /////////////////////obj3///////////////////////////
    
    DoctorInfoItem *objDoctorInfoItem2;
    objDoctorInfoItem2 = [[DoctorInfoItem alloc] init];
    
    objDoctorInfoItem2.name =@"Doctor Zafar";
    objDoctorInfoItem2.qualification =@"MBBS";
    objDoctorInfoItem2.specialization =@"ENT";
    [arrayDocPopOver addObject:objDoctorInfoItem2];
    //////////////////////obj4//////////////////////////
    DoctorInfoItem *objDoctorInfoItem3;
    objDoctorInfoItem3 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem3.name =@"Doctor Fehmida";
    objDoctorInfoItem3.qualification =@"MBBS";
    objDoctorInfoItem3.specialization =@"Dermatologist";
    [arrayDocPopOver addObject:objDoctorInfoItem3];
    
    //////////////////////obj4//////////////////////////
    DoctorInfoItem *objDoctorInfoItem4;
    objDoctorInfoItem4 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem4.name =@"Doctor Irfan";
    objDoctorInfoItem4.qualification =@"MBBS";
    objDoctorInfoItem4.specialization =@"Dermatologist";
    [arrayDocPopOver addObject:objDoctorInfoItem4];
    
    //////////////////////obj4//////////////////////////
    DoctorInfoItem *objDoctorInfoItem5;
    objDoctorInfoItem5 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem5.name =@"Doctor Zafar";
    objDoctorInfoItem5.qualification =@"MBBS";
    objDoctorInfoItem5.specialization =@"Dermatologist";
    [arrayDocPopOver addObject:objDoctorInfoItem5];
    
    //////////////////////obj4//////////////////////////
    DoctorInfoItem *objDoctorInfoItem6;
    objDoctorInfoItem6 = [[DoctorInfoItem alloc] init];
    objDoctorInfoItem6.name =@"Doctor Zain";
    objDoctorInfoItem6.qualification =@"MBBS";
    objDoctorInfoItem6.specialization =@"Dermatologist";
    [arrayDocPopOver addObject:objDoctorInfoItem6];
    

    
    
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
    return arrayDocPopOver.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"DoctorInfo";
    CustomCellForDoctorPopOver *cellPop = (CustomCellForDoctorPopOver *) [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cellPop == nil)
    {
        NSArray *nibDocCell = [[NSBundle mainBundle] loadNibNamed:@"CustomCellForDoctorPopOver" owner:self options:nil];
        cellPop = [nibDocCell objectAtIndex:0];
        
    }
    DoctorInfoItem *itemDoc = [arrayDocPopOver objectAtIndex:indexPath.row];
    
    [cellPop setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cellPop.firstNameDoctorCustomCellLabel.text = itemDoc.name;
    cellPop.qualificationDoctorCustomCellLabel.text = itemDoc.qualification;
    cellPop.specializationDoctorCustomCellLabel.text = itemDoc.specialization;
    return cellPop;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorInfoItem* item = [arrayDocPopOver objectAtIndex:indexPath.row];
    
    [myDelegate ShowProfile:item];
    
    
    
}
@end
