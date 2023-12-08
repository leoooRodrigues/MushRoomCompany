#include "DHT.h"
#define dht_type DHT11 //define qual o tipo de sensor DHTxx que se esta utilizando
int dht_pin = A0;
DHT dht_1 = DHT(dht_pin, dht_type); // pode-se configurar diversos sensores DHTxx
const int LM35 = A5;
float temperaturaLM;


void setup()
{
  Serial.begin(9600);
  dht_1.begin();
}

void loop()
{
  temperaturaLM = (float(analogRead(LM35))*5/(1023))/0.01;
  
  Serial.print(temperaturaLM);
  Serial.print (" ; ");

  float umidadeDH = dht_1.readHumidity();
  
  if (isnan(umidadeDH))
{
  Serial.println("Erro ao ler o DHT");
  }
  else
  {
    
    Serial.print(umidadeDH);
    Serial.println(" ; ");
  

     }
     delay(5000);}
