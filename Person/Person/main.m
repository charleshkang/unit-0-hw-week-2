//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (void) setCity : (NSString *) city;
- (NSString *) city;

- (void) setPhoneNumber : (NSString *) phoneNumber;
- (NSString *) phoneNumber;

- (void) setName : (NSString *) name;
- (NSString *) name;

- (void) changePersonsName : (Person *) aPerson
                     toName: (NSString *) newName;

- (BOOL) checkSameCity:(Person *) aPerson;
- (Person *) hasChild;




@end

@implementation Person {
    NSString *_city;
    NSString *_phoneNumber;
    NSString *_name;
    NSString *_aPerson;
}

- (void) setCity:(NSString *) city {
    _city = city;
}

- (Person *) hasChild {
    Person *child = [[Person alloc] init];
    [child setCity: [self city]];
    [child setPhoneNumber: [self phoneNumber]];
    
    return child;
}

- (NSString *) city {
    return _city;
}

- (void) setPhoneNumber:(NSString *) phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *) phoneNumber {
    return _phoneNumber;
}

- (void) setName :(NSString *) name {
    _name = name;
}

- (NSString *) name {
    return _name;
}

- (void) changePersonsName : (Person *) aPerson
                     toName: (NSString *) newName {
    
    [aPerson setName:newName];
}

- (BOOL) checkSameCity:(Person *) aPerson {
    if ([[aPerson city] isEqualToString: [self city]]) {
        return YES;
    } else {
        return NO;
    }
    
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *carl = [[Person alloc] init];
        Person *mike = [[Person alloc] init];
        
        [carl setName:@"Carl"];
        
        [carl setCity:@"Seoul"];
        [mike setCity:@"Okinawa"];
        
        BOOL citiesAreSame = [mike checkSameCity : carl];
        NSLog(@"%d", citiesAreSame);
        
        [carl setPhoneNumber:@"123-456-789"];
        
        NSString *carlsName = [carl name];
        NSLog(@"%@", carlsName);
        
        [carl setName:@"Steven"];
        NSLog(@"changed name to %@", [carl name]);
        
        NSString *carlsCity = [carl city];
        NSLog(@"%@", carlsCity);
        
        [carl setCity:@"New York"];
        NSLog(@"moved to %@", [carl city]);
        
        NSString *carlsNumber = [carl phoneNumber];
        NSLog(@"%@", carlsNumber);
        
        [carl setPhoneNumber:@"111-111-111"];
        NSLog(@"changed number to %@", [carl phoneNumber]);
        
        Person *charles = [[Person alloc] init];
        [charles changePersonsName:carl toName:@"Carl"];
        NSLog(@"%@", [carl name]);
        
        Person *mikesBaby = [mike hasChild];
        NSLog(@"%@", [mikesBaby city]);
        [mike changePersonsName: mikesBaby toName : @"ABC"];
        
    }
    return 0;
}
