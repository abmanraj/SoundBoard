//
//  ViewController.m
//  SoundBoard
//
//  Created by Arjun's MacBook Pro on 17/04/17.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <AudioToolbox/AudioServices.h>
@interface ViewController (){
NSMutableArray *soundtrack;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    soundtrack = [NSMutableArray arrayWithObjects: @"Kaabil Hoon (Jubin Nautiyal) 320Kbps", @"arabick_birds",@"Dhoom_Sexy_Ringtone_-_Dhoom_2",@"Maine_Payal_Hai_Chankai_-_Falguni_Pathak",
                  nil];
    self.navigationItem.title = @"BattleBards";
   
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    
    // Active your audio session
    [session setActive: NO error: nil];
    
    // Set audio session category
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    // Modifying Playback Mixing Behavior, allow playing music in other apps
    OSStatus propertySetError = 0;
    UInt32 allowMixing = true;
    
    propertySetError = AudioSessionSetProperty (
                                                kAudioSessionProperty_OverrideCategoryMixWithOthers,
                                                sizeof (allowMixing),
                                                &allowMixing);
    
    // Active your audio session
    [session setActive: YES error: nil];
    NSError *error;
    [session setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (error)
    {
        NSLog(@"Error setting up audio session category: %@", error.localizedDescription);
    }
    [session setActive:YES error:&error];
    if (error)
    {
        NSLog(@"Error setting up audio session active: %@", error.localizedDescription);
    }
    self.player = [EZAudioPlayer audioPlayerWithDelegate:self];
    self.player.shouldLoop = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return soundtrack.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell * cell = (TableViewCell *)[_tablesound dequeueReusableCellWithIdentifier:@"TableViewCell"];
    
    
    
    
    // UIImage *image = [UIImage imageWithData:imgdata];
    // [cell.imgUser setImage:image];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openFileWithFilePathURL:(NSURL *)filePathURL
{
    //
    // Create the EZAudioPlayer
    //
    self.audioFile = [EZAudioFile audioFileWithURL:filePathURL];
    
    //
    // Update the UI
    //
  
    //
    // Play the audio file
    //
    [self.player setAudioFile:self.audioFile];
}

- (IBAction)play:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:_tablesound];
    NSIndexPath *indexPath = [_tablesound indexPathForRowAtPoint:buttonPosition];
    NSString*track =[NSString stringWithFormat:@"%@",soundtrack[indexPath.row]];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:track  ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:[soundFilePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
   // [player playAudioFile:soundFilePath ];
    self.audioFile = [EZAudioFile audioFileWithURL:url ];
    
    //
    // Update the UI
    //
    EZAudioPlayer*player;
    //
    // Play the audio file
    //
    SystemSoundID audioEffect;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) url, &audioEffect);
    AudioServicesPlaySystemSound(audioEffect);

    [player setAudioFile:url];
    
    [player play];
}
@end
