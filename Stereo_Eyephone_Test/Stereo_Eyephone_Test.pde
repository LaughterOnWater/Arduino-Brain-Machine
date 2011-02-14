/*********************************************************
Sketch: Eyephone Test
Author: Chris Sparnicht - http://low.li
Date: 2011.01.31
License: Creative Commons 2.5 Attrib. & Share Alike
Description: A test for stereo led eye phones.
Notes:
  Common Anode Blink Test for existing LED Glasses
  Blinks two sets of LED's alternately in loop, using a common anode.
  When pins 5 and 6 are set to LOW, they emit light (on).
  When each pin is set to HIGH the no longer emit light (off).
*********************************************************/
 
 // Some variables:
int intensity[]={255, 127, 63, 31, 15};
int rintensity[]={15, 31, 63, 127, 255};
 
/*********************************************************
Setup defines LED outputs.
*********************************************************/
void setup() {                
  // initialize the digital pin as an output.
  // The LED's anodes :
  pinMode(5, OUTPUT);     // LED's on right side
  pinMode(6, OUTPUT);     // LED's on left side
}

/*********************************************************
Main function - blink the LED's continuously in a loop
*********************************************************/
void loop() {
  for (int i = 0; i < 5; i++) {
  // Two blinks on one side to confirm which pin is right or left. 
  // Do this five times.
  digitalWrite(5, HIGH);   // Common Anode: Turn LED off.
  digitalWrite(6, LOW);    // Common Anode: Turn LED on.
  delay(250);              // wait for a second
  digitalWrite(5, LOW);   // Common Anode: Turn LED off.
  digitalWrite(6, LOW);    // Common Anode: Turn LED on.
  delay(250);              // wait for a second
  digitalWrite(5, HIGH);   // Common Anode: Turn LED off.
  digitalWrite(6, LOW);    // Common Anode: Turn LED on.
  delay(250);              // wait for a second
  digitalWrite(5, LOW);   // Common Anode: Turn LED off.
  digitalWrite(6, LOW);    // Common Anode: Turn LED on.
  delay(250);              // wait for a second
  // Single blink on second in order to verify both sides function.
  digitalWrite(5, LOW);    // Common Anode: Turn LED on.
  digitalWrite(6, HIGH);    // Common Anode: Turn LED off.
  delay(1000);              // wait for a second
  }
  // Now do some PWM to show it works in reverse for PWM too.
  for (int i = 0; i < 5; i++) {
      for (int i = 0; i < 5; i++) { // over the course of a second
        analogWrite(5, intensity[i]); // Right side: dim to bright
        analogWrite(6, 0); // 
        delay(200);
      }
      for (int i = 0; i < 5; i++) { // over the course of a second
        analogWrite(5, 0); // 
        analogWrite(6, rintensity[i]); // Left Side: bright to dim
        delay(200);
      }
  }
}
