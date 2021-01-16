# Verkkotekniikat

Älykoti perustuu moneen eri tietoliikenneprotokollaan. Tämän listan tarkoituksena on toimia referenssinomaisena listana käytetyistä protokollista ja niihin liittyvistä huomioitavista asioista.

## Wifi

Wifi-kytkentä on yksi yleisimmistä älykotilaitteiden liitäntätavasta. Tekniikka ei sovellu paristokäyttöisiin sensoreihin, mutta käytännössä kaikkiin muihin kyllä.

Wifi-laitteiden huonona puolena tietoturvamielessä on se, että laitteet pääsevät Internetiin ja tätä kautta avautuu muutamia riskejä.

Monet Wifi-älykotilaitteet perustuvat nykyään ESP8266 -pohjaisiin piireihin ja monessa tapauksessa laitteeseen pystytään lataamaan täysin avoimen lähdekoodin ohjelmisto (esimerkiksi ESPHome tai Tasmota).

## Zigbee

Zigbee on avoimiin standardeihin perustuva tietoliikenneprotokolla, joka on nykyään äärimmäisen paljon käytetty. Liikenne kulkee 2,4Ghz taajuudella.

Tekniikka mahdollistaa äärimmäisen pienen virrankulutuksen. Usein esimerkiksi lämpötilasensori kestää yhdellä paristolla jopa 2-3 vuotta.

Tekniikka toimii "mesh"-perustaisesti, useimmat verkkovirtaan kytkettävät Zigbee-laitteet (valot, pistorasiat jne) toimivat verkon tukiasemina.

Tekniikka on tietoturvallinen sekä sisäisesti että ulkoisesti - Zigbee-laitteet pystyvät kommunikoimaan ainoastaan Zigbee-tukiasemalle - eivät siitä eteenpäin Internetiin.

Zigbee-laitteita on saatavilla nykyään äärimmäisen edullisesti. Lämpötila/liike/jne sensorit ovat noin 10€/kpl kiinakaupoissa.

## Z-wave

Z-wave on avoimeen standardiin perustuva protokolla, joka toimii Euroopassa 868Mhz taajuudella.

Tekniikka mahdollistaa - kuten Zigbeekin - pienen virrankulutuksen.

## MQTT

MQTT on standardiksi muodostunut protokolla, jolla älykotilaitteet keskustelevat keskenään.

MQTT koostuu palvelimesta (broker), sinne viestejä lähettävistä ohjelmista ja sieltä viestejä kuuntelevista ohjelmista.

Yksi broker voi toimia koko älykodin keskipisteenä. Jokainen laite lähettää tietoa omaan aiheeseen (topic) ja useampi vastaanottaja voi kuunnella samaa aihetta.

## Bluetooth ja Bluetooth Low Energy (BLE)

Bluetooth on tietoliikenneprotokollana omituinen tapaus. Bluetooth koostuu useasta eri tavasta kommunikoida ja näiden välillä ei ole aina ihan tarkkaa standardia.

Liikenne kulkee 2,4Ghz taajuudella.

Älykotiympäristössä harvoin käytetään ns. perinteistä bluetoothia jossa kaksi laitetta muodostaa keskenään parin vaan useimmin törmää BLE-ratkaisuihin, jotka useimmiten ovat vain lähettäviä sensoreita. Esimerkiksi Ruuvitag lähettää BLE:llä lämpötila/kosteus/jne -dataa lähiympäristöön ja kaikki kuuntelevat BLE-laitteet, jotka ovat Ruuvitagin kantoalueella, voivat vastaanottaa viestit.

## "Analoginen" 433Mhz

433Mhz radiosignaalia käytetään esimerkiksi langattomissa lämpömittareissa. Tätä voisi ajatella BLE-signaalinen edeltäjänä. 433Mhz laite lähettää viestin kaikille, jotka kantoalueella ovat.

On olemassa myös samaan teknikkaan perustuvia etäohjattavia pistorasioita / led-himmentimiä jne.

Protokolla on toimiva, mutta siinä on kaksi merkittävää ongelmaa:

* Tietoturvaa ei ole ollenkaan
* Palautesanomaa harvoin saadaan (viestiä esimerkiksi siitä, menikö pistorasia päälle vai ei)
