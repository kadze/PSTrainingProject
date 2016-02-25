//
//  UIViewController+PSExtensionsMacros.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef UIViewController_PSExtensionsMacros_h
#define UIViewController_PSExtensionsMacros_h

#define PSDefineBaseViewProperty(viewClass, propertyName) \
    @property (nonatomic, readonly) viewClass *propertyName;

#define PSBaseViewGetterSynthesize(viewClass, selector) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define PSViewControllerBaseViewProperty(viewControllerClass, baseViewClass, propertyName) \
    @interface viewControllerClass (__##viewControllerClass__##baseViewClass__##propertyName) \
    PSDefineBaseViewProperty(baseViewClass, propertyName) \
    \
    @end \
    \
    @implementation viewControllerClass (__##viewControllerClass__##baseViewClass__##propertyName) \
    \
    @dynamic propertyName; \
    \
    PSBaseViewGetterSynthesize(baseViewClass, propertyName) \
    \
    @end

#endif /* UIViewController_PSExtensionsMacros_h */
