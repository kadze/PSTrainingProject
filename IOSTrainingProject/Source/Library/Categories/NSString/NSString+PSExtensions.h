//
//  NSString+PSExtensions.h
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PSExtensions)

+ (NSString *)letterAlphabet;
+ (NSString *)lowerCaseLetterAlphabet;
+ (NSString *)capitalizedCaseLetterAlphabet;
+ (NSString *)alphanumericAlphabet;
+ (NSString *)numericAlphabet;
+ (NSString *)alphabetWithUnicodeRange:(NSRange)range;
+ (NSString *)randomStringWithAlphabetString:(NSString *)alphabet length:(NSUInteger)length;

+ (instancetype)randomStringFromSelfOfLength:(NSUInteger)length;

@end
