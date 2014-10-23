//
//  ContainerViewController.m
//  kxmovie
//
//  Created by Kenji on 10/23/14.
//
//

#import "ContainerViewController.h"
#import "KxMovieViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)dealloc {
  _moviePath = nil;
  _movieVC = nil;
}

- (instancetype)initWithMoviePath:(NSString *)path {
  if ((self = [super initWithNibName:nil bundle:nil])) {
    self.moviePath = path;
  }
  return self;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor blueColor];
  
  self.movieVC = [KxMovieViewController movieViewControllerWithContentPath:self.moviePath parameters:nil];
  [self addChildViewController:self.movieVC];
  
//  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
//  view.clipsToBounds = YES;
//  [self.view addSubview:view];
  
  [self.movieVC.view setFrame:CGRectMake(0, 20, 320, 320)];
  [self.view addSubview:self.movieVC.view];
  
  [self.movieVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end
