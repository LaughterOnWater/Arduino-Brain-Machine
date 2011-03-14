/*********************************************************
Sketch: Tone_Test_With_Digital_Potentiometer
Author: Chris Sparnicht - http://low.li
Date: 2011.01.31
License: Creative Commons 2.5 Attrib. & Share Alike
Description: A binaural tone test for arduino.
Note: Make sure you have dual wheel potentiometer to reduce
the volume of the audio with your headset. If you don't, 
you might damage your ear drums, your arduino or your headset.

*********************************************************/
/*********************************************************
Include the arduino tone library (you'll have to download
this from arduino.cc's playground, since it's not standard.
*********************************************************/
#include <Tone.h> 
//Variables for tone generator
float binauralBeat[] = { 14.4, 11.1, 6.0, 2.2 };
Tone rightEar; 
Tone leftEar;
float centralTone = 200; //We're starting at this tone and spreading the binaural beat from there.
int volumeRight = 3;
int volumeLeft = 11;

/*********************************************************
Setup defines pins and tones.
*********************************************************/
void setup()  { 
  Serial.begin(9600);
  rightEar.begin(9);
  leftEar.begin(10);
  pinMode(volumeRight, OUTPUT);
  pinMode(volumeLeft, OUTPUT);
}

/*********************************************************
Main function - play the tones continuously in a loop
*********************************************************/
void loop()
{
  for (int i = 0; i < 4; i++){
  rightEar.play(centralTone - (binauralBeat[i]/2));
  leftEar.play(centralTone + (binauralBeat[i]/2));
  // Serial.print("Right Ear: ");
  Serial.print(centralTone - (binauralBeat[i]/2));
  Serial.print(" | ");
  // Serial.print(" | Left Ear: ");
  Serial.println(centralTone + (binauralBeat[i]/2));
//   delay(3000);
  crescendoDecrescendo();
  rightEar.stop();
  leftEar.stop();
  delay(1000); 
  }
}

void crescendoDecrescendo(){
  for (int j = 0; j < 256; j++){
    analogWrite(volumeRight, j);
    analogWrite(volumeLeft, j);
    delay(7);
  }
  for (int j = 255; j > 0; j--){
    analogWrite(volumeRight, j);
    analogWrite(volumeLeft, j);
    delay(7);
  }
}
