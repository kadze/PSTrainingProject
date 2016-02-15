//
//  Macros.h
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define PSEmpty

#define PSDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass *propertyName;

#define PSBaseViewGetterSynthesize(selector, viewClass) \
    - (viewClass *)selector { \
    if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
        return (viewClass *)self.view; \
    } \
    \
    return nil; \
}

#define PSViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__##baseViewClass##__##propertyName) \
    PSDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__##baseViewClass##__##propertyName) \
    \
    @dynamic propertyName; \
    \
    PSBaseViewGetterSynthesize(propertyName, baseViewClass) \
    \
    @end


#define PSWeakify(object) \
    __weak __typeof(object) __PSWeak_##object = object

#define PSStrongify(object) \
    __strong __typeof(object) object = __PSWeak_##object

#define __PSStrongifyAndReturnValueIfNil(object, value) \
    PSStrongify(object); \
    if (!object) { \
        return value; \
    }

#define PSStrongifyAndReturnIfNil(object) \
    __PSStrongifyAndReturnValueIfNil(object, PSEmpty)


#endif /* Macros_h */
