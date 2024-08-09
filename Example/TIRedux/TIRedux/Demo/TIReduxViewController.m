//
//  ViewController.m
//  TIRedux
//
//  Created by manajay on 2024/8/9.
//

#import "TIReduxViewController.h"
#import "TIHeaderComponent.h"
#import "TIMiddleComponent.h"
#import "TIBottomComponent.h"

#import "TIRedux.h"
#import "TICustomState.h"
#import "TICustomReducer.h"

@interface TIReduxViewController ()

@property (nonatomic, strong, readwrite) TIComponent *headerComponent;
@property (nonatomic, strong, readwrite) TIComponent *middleComponent;
@property (nonatomic, strong, readwrite) TIComponent *bottomComponent;

@property (nonatomic, strong, readwrite) TIStore *store;
@end

@implementation TIReduxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Redux Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    TICustomState *initState = [[TICustomState alloc] init];
    TICustomReducer *dispatch = [[TICustomReducer alloc] init];
    TIStore *store = [[TIStore alloc] initWithInitState:initState dispatcher:dispatch];
    self.store = store;
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.headerComponent.view];
    [self.view addSubview:self.middleComponent.view];
    [self.view addSubview:self.bottomComponent.view];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    CGFloat offsetY = 100;
    self.headerComponent.view.frame = CGRectMake(0, offsetY , width, 100);
    self.middleComponent.view.frame = CGRectMake(0, height * 0.5 - 50, width, 100);
    self.bottomComponent.view.frame = CGRectMake(0, height - 100 - 64, width, 100);
}

- (TIComponent *)headerComponent {
    if (!_headerComponent) {
        _headerComponent = [[TIHeaderComponent alloc] initWithStore:self.store];
    }
    return _headerComponent;
}

- (TIComponent *)middleComponent {
    if (!_middleComponent) {
        _middleComponent = [[TIMiddleComponent alloc] initWithStore:self.store];
    }
    return _middleComponent;
}

- (TIComponent *)bottomComponent {
    if (!_bottomComponent) {
        _bottomComponent = [[TIBottomComponent alloc] initWithStore:self.store];
    }
    return _bottomComponent;
}


@end
