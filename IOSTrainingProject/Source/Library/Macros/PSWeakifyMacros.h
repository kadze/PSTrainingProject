//
//  Macros.h
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "PSReturnMacros.h"

#define PSClangDiagnosticPush    _Pragma ("clang diagnostic push")
#define PSClangDiagnosticPop     _Pragma ("clang diagnostic pop")

#define PSClangDiagnosticPushOption(option) \
    PSClangDiagnosticPush \
    _Pragma(option) \

#define PSClangDiagnosticPopOption PSClangDiagnosticPop

#define PSWeakify(object) __weak typeof(object) __weak_##object = object

#define KSWeakify(obj) __weak typeof(obj) __weak_##obj = obj

#define PSStrongify(object) \
    PSClangDiagnosticPushOption("clang diagnostic ignored \"-Wshadow\"") \
    __strong __typeof(object) object = __weak_##object; \
    PSClangDiagnosticPopOption

#define __PSStrongifyAndReturnValueIfNil(object, value) \
    PSStrongify(object); \
    PSReturnValueIfNil(object, value)

#define PSStrongifyAndReturnIfNil(object) __PSStrongifyAndReturnValueIfNil(object, PSEmpty)

#define PSStrongifyAndReturnNilIfNil(object) __PSStrongifyAndReturnValueIfNil(object, nil)

#endif /* Macros_h */
