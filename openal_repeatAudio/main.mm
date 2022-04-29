#define CC_PLATFORM 1
#define CC_PLATFORM_WINDOWS 0
#define CC_PLATFORM_MAC_OSX 1
#define CC_PLATFORM_ANDROID 2
#define CC_PLATFORM_MAC_IOS 3

#include <iostream>
#include "AudioEngine.h"
#include "AudioEngine-inl.h"
#include "Scheduler.h"
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("============= START AUDIO ENGINE TEST ============\n");
    cc::AudioEngine alEngine;
    cc::Scheduler* _scheduler = cc::Scheduler::getInstance();
    _scheduler->removeAllFunctionsToBePerformedInCocosThread();
    _scheduler->unscheduleAll();
    
    std::string audioPath = "/Users/timlyeee/Documents/Cases/openal_repeatAudio/shunzi.mp3";
    printf("============== AUDIO PATH IS %s==============\n", audioPath.c_str());
    int FrameCount = 0;
    while(true){
        cc::Scheduler::getInstance()->update(0.16f);//60fps
        for(int i = 0; i < MAX_AUDIOINSTANCES; i++) {
            if(cc::AudioEngine::getPlayingAudioCount() >= MAX_AUDIOINSTANCES){
                cc::AudioEngine::stopAll();
            }
            alEngine.play2d(audioPath, false, 1);
            
        }
        
        printf("============== WAITING FOR INPUT ===============\n");
        
    }
    
    return 0;
}
