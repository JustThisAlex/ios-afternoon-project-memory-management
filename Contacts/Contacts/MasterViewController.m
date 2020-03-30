//
//  MasterViewController.m
//  Contacts
//
//  Created by Alexander Supe on 30.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AMSContact.h"

@interface MasterViewController ()
//@property NSMutableArray<AMSContact *> *objects;
@end

@implementation MasterViewController

static NSMutableArray<AMSContact *> *_objects;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

+ (NSMutableArray<AMSContact *> *)objects {
    if (_objects == nil) {
        _objects = [NSMutableArray<AMSContact *> new];
    }
    return _objects;
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AMSContact *object = MasterViewController.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.detailItem = object;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        self.detailViewController = controller;
    }
}


#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MasterViewController.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    AMSContact *object = MasterViewController.objects[indexPath.row];
    cell.textLabel.text = object.name;
    return cell;
}

@end
