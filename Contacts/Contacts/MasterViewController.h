//
//  MasterViewController.h
//  Contacts
//
//  Created by Alexander Supe on 30.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class AMSContact;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
+ (NSMutableArray<AMSContact *> *)objects;


@end

