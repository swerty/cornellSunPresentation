//
//  SPAddCategoriesViewController.h
//  cornellSunPresentation
//
//  Created by Sean Wertheim on 2/22/14.
//  Copyright (c) 2014 Sean Wertheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SPAddCategoriesViewControllerDelegate;

@interface SPAddCategoriesViewController : UITableViewController

@property (nonatomic, weak) NSObject <SPAddCategoriesViewControllerDelegate> *delegate;

- (IBAction)handleDoneButton:(id)sender;

@end

@protocol SPAddCategoriesViewControllerDelegate <NSObject>

- (void)addCategoriesViewController:(SPAddCategoriesViewController*)viewController
             didAddCategories:(NSArray *)categories;

@end
