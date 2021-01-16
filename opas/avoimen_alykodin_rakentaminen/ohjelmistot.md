# Ohjelmistojen yleisesittely

## Home Assistant

Home Assistant on avoimen lähdekoodin älykodin "sydän". Käytännössä yhdistää kaikki laitteet, tekee niiden välille automaatiot jne.

## Mosquitto

MQTT-palvelin.

## Zigbee2mqtt

Zigbee-tukiaseman ja MQTT-palvelimen välillä oleva silta, joka tulkkaa Zigbee-laitteiden viestejä ja lähettää ne eteenpäin MQTT:lle ja toisinpäin.


## Code-server

Microsoftin Visual Studio Codeen (VS Code) perustuva palvelimella toimiva tiedostoeditori. Äärimmäisen laajennettava.

## BT-MQTT-Gateway

Vastaava kuin Zigbee2mqtt, mutta Bluetooth-laitteille

## Pihole

Mainosesto-ohjelma. Toimii DNS-perustaisesti, eli pysäyttää mainosalustojen pyynnöt jo DNS-tasolle.
Vaatii yleensä kone/reititinmuutoksia, jotta tulee koko verkkoon käyttöön.

## Frigate

Hahmontunnistin/kamerapalvelin. Ottaa vastaan mm. RTSP-signaalia verkkokameroilta, prosessoi niiden kuvan ja tunnistaa niistä haluttuja hahmoja (esim autot, ihmiset, eläimet) ja viestittää nämä eteenpäin MQTT:lle.

## Homebridge

Mahdollistaa esimerkiksi sen, että Home Assistantin laitteet päätyvät näkymään Applen HomeKitiin.

## Node-RED

Äärimmäisen kehittynyt visuaalinen automaatiotyökalu. 