#include "Lixie_II.h" // Include Lixie II Library

#define DATA_PIN   13
#define NUM_LIXIES 4

// switch
#define SWITCH1 5
#define SWITCH2 14
#define BUZZER  12
int counter, Last_sate_sw1, Last_sate_sw2;

Lixie_II lix(DATA_PIN, NUM_LIXIES); // Set class name to "lix" and define your Lixie II setup

uint16_t count = 0; // Use this number to count up

void setup() {
  Serial.begin(115200);
  pinMode(SWITCH1, INPUT_PULLUP);
  pinMode(SWITCH2, INPUT_PULLUP);
  pinMode(BUZZER, OUTPUT);
  lix.begin();                   // Initialize LEDs
  lix.color_all(ON, CRGB(167, 237, 255)); // (Optional) Nixie tube coloring
  lix.transition_time(125);            // (Optional) 125 milliseconds crossfade time
}

void loop() {
  Serial.println(digitalRead(SWITCH1));
  Serial.println(digitalRead(SWITCH2));
  if (digitalRead(SWITCH1) == 0 && Last_sate_sw1 == 1) {
    counter += 1;
    if (counter == 6) {
      counter = 0;
    }
  }
  Last_sate_sw1 = digitalRead(SWITCH1);

  if (digitalRead(SWITCH2) == 0 && Last_sate_sw2 == 1) {
    counter -= 1;
    if (counter < 0) {
      counter = 0;
    }
  }
  Last_sate_sw2 = digitalRead(SWITCH2);

  Serial.println(counter);
  lix.write(count);             // Write the count to the displays
  count++;                      // Increment count
    if (count >= 10) {
      count = 0;
    }
  delay(1000);
}
