//
//  NSString+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "NSString+PSExtensions.h"

#define PSCapitalLetters NSMakeRange('A', 'Z' - 'A')
#define PSLowerCaseLetters NSMakeRange('a', 'z' - 'a')
#define PSRangeOfNumbers NSMakeRange('0', '9' - '0')

@implementation NSString (PSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)letterAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self lowerCaseLetterAlphabet]];
    [result appendString:[self capitalizedCaseLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (NSString *)lowerCaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:PSLowerCaseLetters];
}

+ (NSString *)capitalizedCaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:PSCapitalLetters];
}

+ (NSString *)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self numericAlphabet]];
    [result appendString:[self letterAlphabet]];
    
    return [self stringWithString:result];
}

+ (NSString *)numericAlphabet {
    return [self alphabetWithUnicodeRange:PSRangeOfNumbers];
}

+ (NSString *)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar symbol = range.location; symbol <= NSMaxRange(range); symbol++) {
        [result appendFormat:@"%c", symbol];
    }
    
    return [self stringWithString:result];
}

+ (NSString *)randomStringWithAlphabetString:(NSString *)alphabet length:(NSUInteger)length {
    int alphabetLength = (int)alphabet.length;
    unichar unichars[length];
    for (uint index = 0; index < length; index++) {
        unichars[index] = [alphabet characterAtIndex:arc4random_uniform(alphabetLength)];
    }
    
    return [self stringWithCharacters:unichars length:length];
}

#pragma mark -
#pragma mark Public Method

+ (instancetype)randomStringFromSelfOfLength:(NSUInteger)length {
    return [self randomStringWithAlphabetString:[self letterAlphabet] length:length];
}

@end
