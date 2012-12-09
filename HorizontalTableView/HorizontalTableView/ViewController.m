//
//  ViewController.m
//  HorizontalTableView
//
//  Created by sathishbabuangadi on 09/12/12.
//  Copyright (c) 2012 satishangadi. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define M_PI        3.14159265358979323846264338327950288   /* pi             */


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    tblView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, 320, 320) style:UITableViewStylePlain];
    tblView.delegate = self;
    tblView.dataSource = self;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:tblView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}             // Default is 1 if not implemented

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
        
    tableView.transform = CGAffineTransformMakeRotation(M_PI*1.5);
    
    cell.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    cell.contentView.layer.borderWidth = 1;
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    lable.text = [NSString stringWithFormat:@"image %d",indexPath.row+1];
    [cell addSubview:lable];
    
    cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 250)];
    imageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg",indexPath.row]];
    imageView.backgroundColor = [UIColor redColor];
//    imageView.image = [UIImage imageNamed:@"image0.jpg"];
    [cell addSubview:imageView];

    
    return cell;
}


@end
