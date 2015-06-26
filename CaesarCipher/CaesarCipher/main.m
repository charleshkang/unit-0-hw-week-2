//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;

// Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value
- (BOOL) isEqual:(NSString *)first other:(NSString * )second;

@end

@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        
    }
    NSString *str = [string lowercaseString]; //method invocation
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);
        
        result[i] = allchars[new_idx];
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

//comparison method
- (BOOL) isEqual:(NSString *)first other:(NSString * )second {
    if ([first length] != [second length]) {
        return NO;
    }
    
    // which tells us whether they are actually the same input message encoded using two different offsets
    
    // decode cipherstring2 using offsets from 0 to cipherstring1.length
    
    
    for (int i = 0; i < first.length; i++) {
        NSString *decoded = [self decode:second offset:i];
        
        if ([decoded isEqualToString:first]) {
            return YES;
            
        }
        
    }
    return NO;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        CaesarCipher *str = [[CaesarCipher alloc] init];
        // come up with 2 strings and 2 offsets, run codebreaker on both
        NSString *example = @"my name is charles";
        NSString *cipher = [str encode:example offset:2];
        NSString *reverse = [str decode: cipher offset:2];
        
        NSLog(@"%@", example);
        NSLog(@"%@", cipher);
        NSLog(@"%@", reverse);
        
        if ([str isEqual: cipher other:[str encode:@"my name is charles" offset:2]]) {
            NSLog(@"Yes");
        }
        else {
            NSLog(@"No");
        }
    }
}

