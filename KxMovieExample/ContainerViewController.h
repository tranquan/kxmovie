//
//  ContainerViewController.h
//  kxmovie
//
//  Created by Kenji on 10/23/14.
//
//  demo how to use KxMovieController inside another ViewController
//

#import <UIKit/UIKit.h>

@class KxMovieViewController;

@interface ContainerViewController : UIViewController

@property (nonatomic, strong) NSString *moviePath;
@property (nonatomic, strong) KxMovieViewController *movieVC;

- (instancetype)initWithMoviePath:(NSString *)path;

@end
