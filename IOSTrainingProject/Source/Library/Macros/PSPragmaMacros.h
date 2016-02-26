//
//  PSPragmaMacros.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/25/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef PragmaMacros_h
#define PragmaMacros_h

#define PSClangDiagnosticPush    _Pragma ("clang diagnostic push")
#define PSClangDiagnosticPop     _Pragma ("clang diagnostic pop")

#define PSClangDiagnosticPushOption(option) \
    PSClangDiagnosticPush \
    _Pragma(option) \

#define PSClangDiagnosticPopOption PSClangDiagnosticPop

#endif /* PragmaMacros_h */
