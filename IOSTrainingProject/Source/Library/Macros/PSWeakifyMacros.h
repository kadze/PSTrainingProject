//
//  Macros.h
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "PSPragmaMacros.h"
#import "PSReturnMacros.h"

#define PSWeakify(object) __weak typeof(object) __weak_##object = object

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
