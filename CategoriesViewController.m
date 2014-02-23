//
//  CategoriesViewController.m
//  cornellSunPresentation
//
//  Created by Sean Wertheim on 2/22/14.
//  Copyright (c) 2014 Sean Wertheim. All rights reserved.
//

#import "CategoriesViewController.h"
#import "SPAddCategoriesViewController.h"

@interface CategoriesViewController ()

@property (nonatomic, strong) NSMutableArray *categoriesArray;
@property (nonatomic, strong) NSMutableArray *categoryPicturesArray;
@property (nonatomic, strong) NSArray *articlesArray;
@property (nonatomic, strong) NSMutableArray *deletedCategories;
@property (nonatomic, strong) NSMutableArray *deletedCategoryPictures;


@end

@implementation CategoriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Users can edit which sections are in their table
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.categoriesArray = [NSMutableArray arrayWithObjects: @"News", @"Opinion", @"Sports", @"Arts", @"Science", @"Dining", @"Multimedia", @"Blogs", nil];
    
    UIImage *artsImage = [UIImage imageNamed: @"film_reel-100@2x.png"];
    UIImage *sportsImage = [UIImage imageNamed: @"basketball-100@2x.png"];
    UIImage *diningImage = [UIImage imageNamed: @"coctail-100@2x.png"];
    UIImage *scienceImage = [UIImage imageNamed: @"dna_helix-100@2x.png"];
    UIImage *newsImage = [UIImage imageNamed: @"news-100@2x.png"];
    UIImage *opinionImage = [UIImage imageNamed: @"topic-100@2x.png"];
    UIImage *multimediaImage = [UIImage imageNamed: @"tv-100@2x.png"];
    UIImage *blogsImage = [UIImage imageNamed: @"talk-100@2x.png"];
    
    self.categoryPicturesArray = [NSMutableArray arrayWithObjects:newsImage, opinionImage, sportsImage, artsImage, scienceImage, diningImage, multimediaImage, blogsImage, nil];
    
    //init deleted arrays
    self.deletedCategories = [[NSMutableArray alloc] init];
    self.deletedCategoryPictures = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.categoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    UILabel *categoryLabel = (UILabel *)[cell viewWithTag:2];
    
    categoryLabel.text = self.categoriesArray[indexPath.row];
    
    UIImageView *categoryImageView = (UIImageView *)[cell viewWithTag:1];
    categoryImageView.image = self.categoryPicturesArray[indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.deletedCategoryPictures addObject:self.categoryPicturesArray[indexPath.row]];
        [self.deletedCategories addObject:self.categoriesArray[indexPath.row]];
        
        [self.categoriesArray removeObjectAtIndex:indexPath.row];
        [self.categoryPicturesArray removeObjectAtIndex:indexPath.row];
        
        [tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (IBAction)unwindToCategories:(UIStoryboardSegue *)segue{
    SPAddCategoriesViewController *destView = [segue sourceViewController];
    [self.categoriesArray addObjectsFromArray:destView.addedCategories];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addCatsSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        SPAddCategoriesViewController *addCats = [navigationController viewControllers][0];
        addCats.deletedCategories = self.deletedCategories;
        addCats.deletedCategoryPics = self.deletedCategoryPictures;
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
