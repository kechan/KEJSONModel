//
//  KEJSONModelTests.m
//  KEJSONModelTests
//
//  Created by Kelvin Chan on 7/4/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModelTests.h"
#import "Root.h"
#import "MenuItem.h"
#import "Review.h"

@interface KEJSONModelTests ()
@property (nonatomic, strong) Root *root;
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
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    self.root = [[Root alloc] initWithDictionary:dict];
}

- (void)tearDown
{
    self.root = nil;
    [super tearDown];
}

- (void)testBasic
{
    //    STFail(@"Unit tests are not implemented yet in LibJSONModelTests");
    MenuItem *menuItem = self.root.menuItems[0];
    
    STAssertTrue([menuItem.itemId isEqualToString:@"JAP122"], @"Menuitem id is not JAP122");
    STAssertTrue([menuItem.image isEqualToString:@"http://d1.myhotel.com/food_image1.jpg"], @"Menuitem image url is not http://d1.myhotel.com/food_image1.jpg");
    STAssertTrue([menuItem.name isEqualToString:@"Teriyaki Bento"], @"Menuitem Name is not Teriyaki Bento");
    STAssertTrue([menuItem.spicyLevel isEqualToString:@"2"], @"Menuitem Spicy level is not 2");
    STAssertTrue([menuItem.rating isEqualToString:@"4"], @"Menuitem Rating is not 4");
    STAssertTrue([menuItem.itemDescription isEqualToString:@"Teriyaki Bento is one of the best lorem ipsum dolor sit"], @"Menuitem description is not right");
    STAssertTrue([menuItem.waitingTime isEqualToString:@"930"], @"Menuitem Waiting time is not 930");
    STAssertTrue([menuItem.reviewCount isEqualToString:@"4"], @"Menuitem ReviewCount is not 4");
    
    NSArray *reviews = menuItem.reviews;
    for (Review *review in reviews) {
        STAssertTrue([review.reviewId isEqualToString:@"rev1"], @"Review reviewId is not rev1");
        STAssertTrue([review.rating isEqualToString:@"5"], @"Review rating is not 5");
        STAssertTrue([review.reviewedDate isEqualToString:@"10229274633"], @"Review date is not 10229274633");
        STAssertTrue([review.reviewerName isEqualToString:@"Awesome Man"], @"Review reviewerName is not Awesome Man");
        STAssertTrue([review.reviewText isEqualToString:@"This is an awesome place to eat"], @"Review reviewText is not This is an awesome place to eat");
    }
}


@end
