//
//  CategoriesViewController.h
//  cornellSunPresentation
//
//  Created by Sean Wertheim on 2/22/14.
//  Copyright (c) 2014 Sean Wertheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoriesViewControllerDelegate;

@interface CategoriesViewController : UITableViewController

@property (nonatomic, weak) NSObject <CategoriesViewControllerDelegate> *delegate;

@end

@protocol CategoriesViewControllerDelegate <NSObject>

-(void)categoriesViewController:(CategoriesViewController*)viewController didDeleteCategories:(NSArray*)categories;

@end
