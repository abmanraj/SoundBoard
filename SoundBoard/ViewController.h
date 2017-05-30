//
//  ViewController.h
//  SoundBoard
//
//  Created by Arjun's MacBook Pro on 17/04/17.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

#include <EZAudio/EZAudio.h>
@interface ViewController : UIViewController<EZAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btnPlay;

//------------------------------------------------------------------------------

//
// An EZAudioPlayer that will be used for playback
//
@property (nonatomic, strong) EZAudioPlayer *player;

@property (strong, nonatomic) IBOutlet UITableView *tablesound;
- (IBAction)play:(id)sender;
@property (nonatomic, strong) EZAudioFile *audioFile;
@end

