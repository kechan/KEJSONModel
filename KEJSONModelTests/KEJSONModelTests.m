//
//  KEJSONModelTests.m
//  KEJSONModelTests
//
//  Created by Kelvin Chan on 7/4/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModelTests.h"
#import "Menu.h"
#import "MenuItem.h"
#import "Review.h"

@interface KEJSONModelTests ()
@property (nonatomic, strong) Menu *menu;
@end

@implementation KEJSONModelTests

- (void)setUp
{
    [super setUp];
    
    NSString *fullfilename = [[NSBundle bundleForClass:[self class]] pathForResource:@"sample" ofType:@"json"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fullfilename]) {
        STFail(@"sample.json not found in KEJSONModelTests");
    }
    
    NSError *error = nil;
    
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:fullfilename];
    
    Class NSJSONSerializationClass = NSClassFromString(@"NSJSONSerialization");
    
    if (NSJSONSerializationClass == nil)
        STFail(@"KEJSONModelTests need iOS 5.0 or above");

    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    self.menu = [[Menu alloc] initWithDictionary:dict];
}

- (void)tearDown
{
    self.menu = nil;
    [super tearDown];
}

- (void)testBasic
{
    //    STFail(@"Unit tests are not implemented yet in LibJSONModelTests");
    MenuItem *menuItem = self.menu.menuItems[0];
    
    STAssertTrue([menuItem.itemId isEqualToString:@"JAP122"], @"Menuitem id is not JAP122");
    STAssertTrue([menuItem.name isEqualToString:@"Teriyaki Bento"], @"Menuitem Name is not Teriyaki Bento");
    STAssertTrue([menuItem.spicyLevel isEqualToString:@"2"], @"Menuitem Spicy level is not 2");
    STAssertTrue([menuItem.itemDescription isEqualToString:@"Teriyaki Bento is one of the best lorem ipsum dolor sit"], @"Menuitem description is not right");
    STAssertTrue([menuItem.reviewCount isEqualToString:@"4"], @"Menuitem ReviewCount is not 4");
    
    NSArray *reviews = menuItem.reviews;
    for (Review *review in reviews) {
        STAssertTrue([review.reviewId isEqualToString:@"rev1"], @"Review reviewId is not rev1");
        STAssertTrue([review.rating isEqualToString:@"5"], @"Review rating is not 5");
        STAssertTrue([review.reviewerName isEqualToString:@"Awesome Man"], @"Review reviewerName is not Awesome Man");
        STAssertTrue([review.reviewText isEqualToString:@"This is an awesome place to eat"], @"Review reviewText is not This is an awesome place to eat");
    }
    
    // Checking the status
    STAssertTrue([self.menu.status.code isEqualToString:@"0"], @"Status code is not 0");
    STAssertTrue([self.menu.status.localdesc isEqualToString:@"Everything is alright."], @"Status description does not match 'Everything is alright.'");
    
}


@end
