//
//  PSReturnMacros.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef PSReturnMacros_h
#define PSReturnMacros_h

#define PSEmpty

#define PSReturnValueIfNil(satement, value) \
    if (!(satement)) { \
        return value; \
    }

#define PSReturnIfNil(satement) PSReturnValueIfNil(satement, PSEmpty)

#define PSReturnNilIfNil(satement) PSReturnValueIfNil(satement, 0)

#endif /* PSMacros_h */
