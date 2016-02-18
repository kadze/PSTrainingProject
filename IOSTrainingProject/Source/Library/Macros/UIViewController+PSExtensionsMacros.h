//
//  UIViewController+PSExtensionsMacros.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef UIViewController_PSExtensionsMacros_h
#define UIViewController_PSExtensionsMacros_h

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

#endif /* UIViewController_PSExtensionsMacros_h */
