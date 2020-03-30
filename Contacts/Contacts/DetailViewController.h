//
//  DetailViewController.h
//  Contacts
//
//  Created by Alexander Supe on 30.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AMSContact;
@interface DetailViewController : UIViewController

@property (strong, nonatomic) AMSContact *detailItem;

@end

