//
//  AMSContact.m
//  Contacts
//
//  Created by Alexander Supe on 30.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "AMSContact.h"

@implementation AMSContact

- (void)dealloc
{
    [_name release];
    [_email release];
    [_phone release];
    [super dealloc];
}

@end
