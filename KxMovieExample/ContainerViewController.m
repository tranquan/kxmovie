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

@property (nonatomic, strong) UIButton *btnPlay;
@property (nonatomic, strong) UIButton *btnClose;

@end

@implementation ContainerViewController

- (void)dealloc {
  self.moviePath = nil;
  self.movieVC = nil;
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
  
  UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake(120, 480, 80, 48)];
  [btnClose setTitle:@"Close" forState:UIControlStateNormal];
  [btnClose addTarget:self action:@selector(btnCloseTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btnClose];
  self.btnClose = btnClose;
  
  UIButton *btnPlay = [[UIButton alloc] initWithFrame:CGRectMake(100, 420, 120, 48)];
  [btnPlay setTitle:@"Play" forState:UIControlStateNormal];
  [btnPlay addTarget:self action:@selector(btnPlayTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btnPlay];
  self.btnPlay = btnPlay;
  
  self.movieVC = [KxMovieViewController movieViewControllerWithContentPath:self.moviePath parameters:nil];
  [self.movieVC setAutoPlay:YES];
  [self.movieVC setShowControl:NO];
  [self addChildViewController:self.movieVC];
  
  [self.movieVC.view setFrame:CGRectMake(0, 20, 320, 240)];
  [self.view addSubview:self.movieVC.view];
  
//  KxMovieViewController *movieVC2 = [KxMovieViewController movieViewControllerWithContentPath:self.moviePath parameters:nil];
//  [movieVC2 setAutoPlay:YES];
//  [movieVC2 setShowControl:YES];
//  [self addChildViewController:movieVC2];
//  
//  [movieVC2.view setFrame:CGRectMake(0, 280, 320, 240)];
//  [self.view addSubview:movieVC2.view];
  
  [self.movieVC didMoveToParentViewController:self];
}

- (void)viewWillDisappear:(BOOL)animated {
  
  [super viewWillDisappear:animated];
  
  [self.movieVC willMoveToParentViewController:nil];
  [self.movieVC.view removeFromSuperview];
  [self.movieVC removeFromParentViewController];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

- (void)btnCloseTapped:(id)sender {
  [self.movieVC pause];
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}

- (void)btnPlayTapped:(id)sender {
  if (self.movieVC.playing) {
    [self.movieVC pause];
    [self.btnPlay setTitle:@"Play" forState:UIControlStateNormal];
  } else {
    [self.movieVC play];
    [self.btnPlay setTitle:@"Pause" forState:UIControlStateNormal];
  }
}

@end
