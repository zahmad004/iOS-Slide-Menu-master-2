

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.tableView.separatorColor = [UIColor darkGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"watson.jpg"]];
    self.tableView.backgroundView = imageView;
	

}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
	
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"Home";
			break;
			
		case 1:
			cell.textLabel.text = @"HRV Dashboard";
			break;
            
        case 2:
            cell.textLabel.text = @"Tone Analyzer";
            break;
			
		case 3:
			cell.textLabel.text = @"Word Picker";
			break;
        
        case 4:
            cell.textLabel.text = @"Sqaud Leaders";
            break;
       
			
		case 5:
			cell.textLabel.text = @"Sign Out";
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
															 bundle: nil];
	
	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
			break;
			
		case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HRVViewController"];
			break;
			
		case 2:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ToneViewController"];
			break;
            
        case 3:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"WordViewController"];
            break;
            
        case 4:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
            break;
			
        case 5:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
}

@end
