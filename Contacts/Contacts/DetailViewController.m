//
//  DetailViewController.m
//  Contacts
//
//  Created by Alexander Supe on 30.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "AMSContact.h"

@interface DetailViewController ()

@property (retain, nonatomic) IBOutlet UITextField *nameField;
@property (retain, nonatomic) IBOutlet UITextField *mailField;
@property (retain, nonatomic) IBOutlet UITextField *phoneField;
@end

@implementation DetailViewController

- (void)configureView {
    if (self.detailItem) {
        self.nameField.text = _detailItem.name;
        self.mailField.text = _detailItem.email;
        self.phoneField.text = _detailItem.phone;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (IBAction)donePressed:(id)sender {
    if (_detailItem) {
        _detailItem.name = _nameField.text;
        _detailItem.email = _nameField.text;
        _detailItem.phone = _phoneField.text;
    } else {
        AMSContact *newContact = [[AMSContact new] autorelease];
        newContact.name = _nameField.text;
        newContact.email = _mailField.text;
        newContact.phone = _phoneField.text;
        [MasterViewController.objects addObject:newContact];
    }
}

- (void)dealloc
{
    [_detailItem release];
    [_nameField release];
    [_mailField release];
    [_phoneField release];
    [super dealloc];
}

@end
