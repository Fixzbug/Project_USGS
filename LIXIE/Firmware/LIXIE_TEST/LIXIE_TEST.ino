#include <Lixie_II.h> // https://github.com/connornishijima/Lixie_II
#define DATA_PIN   13
#define NUM_LIXIES 4
Lixie_II lix(DATA_PIN, NUM_LIXIES); // Set class name to "lix" and define your Lixie II setup

uint16_t count = 0; // Use this number to count up

void setup() {
  Serial.begin(115200);
  lix.begin();                   // Initialize LEDs
  //  lix.white_balance(Tungsten100W); // Default
  lix.color_all(ON, CRGB(0, 255, 255));
  lix.transition_time(125);            // (Optional) 125 milliseconds crossfade time
  //  lix.max_power(5, 450); // Set software power limit
}

void loop() {
  lix.write(count);             // Write the count to the displays
  count++;                      // Increment count
  //    if (count >= 10) {
  //      count = 0;
  //    }
  Serial.println(count);
  delay(300);

  delay(1000);
}
