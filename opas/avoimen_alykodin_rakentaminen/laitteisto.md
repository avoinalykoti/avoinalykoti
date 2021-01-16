# Laitteisto ja käyttöjärjestelmä

Laitteiston pohjana pyörii lähes kokonaan avoin Raspberry Pi -minitietokone.

Toimiakseen, tulee tietokoneessa olla massamuisti, eli joko muistikortti tai kiintolevy (SSD/NVMe).

Muistikortteja ei suositella, koska ne ovat ensinnäkin hitaita ja varsin usein epäluotettavia. Muistikortteja voi kuitenkin käyttää väliaikaiseen - esimerkiksi testaus/varalaite - käyttöön.

Massamuisti voi olla joko erillisessä kotelossa tai vaihtoehtoisesti kotelossa, jossa on sopiva liitäntä integroituna.

Laitteessa on hyvä olla varavirtalähde ainakin kahdesta syystä:
* Jos tulee sähkökatko, älykotijärjestelmä jatkaa toimintaansa
* Jos tulee sähkökatko, äkillinen virtojen menetys ei tuota lisäongelmia

Varavirtalähteeksi soveltuu joko ulkoinen "oikea" UPS tai pieni UPS-lisälaite Raspberry PI:hin.

Zigbee-liikennettä varten laitteeseen kytketään soveltuva USB-sovitin tarvittaessa.

## Ostoslista

Tässä on listattu ostoslista esimerkkikauppoineen ja noin-hintoineen.

Erillisistä komponenteista koostuva paketti, UPS-lisälaitteella: ~160€
* Raspberry Pi 4 2G (tai suuremmalla muistilla varustettu): 50€
  * https://shop.vadelmapii.com/tuote/raspberry-pi-4-model-b-tietokone/
* UPS HAT ja siihen akut: 25€ + 20€
  * https://www.waveshare.com/ups-hat.htm
  * https://www.biltema.fi/toimisto---tekniikka/akut-ja-paristot/ladattavat-paristot/ladattava-icr18650-akku-2950-mah-2000037909
* TBDT -massamuistikotelo: 35€
  * https://www.amazon.com/TDBT-Enclosure-Thermal-Cooling-External/dp/B07TJT6W8K
* M2 128G massamuisti: 30€
  * https://www.karkkainen.com/verkkokauppa/xpg-sx6000-lite-128gb-m2-ssd-asema


Yhteen koteloon menevä paketti, ilman UPS-lisälaitetta: ~130€
* Raspberry Pi 4 2G (tai suuremmalla muistilla varustettu): 50€
  * https://www.berrybase.de/en/raspberry-pi-co/raspberry-pi/boards/raspberry-pi-4-computer-modell-b-2gb-ram
* Virtalähde: 8€
  * https://www.berrybase.de/en/raspberry-pi-co/raspberry-pi/power-supply/power-supply-units-for-the-socket/offizielles-raspberry-pi-usb-c-netzteil-5-1v/3-0a-eu-schwarz
* Argon ONE M.2 kotelo: 50€
  * https://www.berrybase.de/en/new/argon-one-m.2-case-f-252-r-raspberry-pi-4
* Massamuisti: 22€:
  * https://www.berrybase.de/en/new/kingston-m.2-ssd-a400-120gb

Kun olet tilannut ja vastaanottanut tarvikkeet, kokoa ne. Pitäisi olla yhtä helppoa kuin 10-palaisen palapelin kokoaminen.

Zigbee-laitteen osalta suositus on ostaa joko:
* zig-zig-ah: https://www.tindie.com/stores/electrolama/
* slaesh: https://www.tindie.com/products/slaesh/cc2652-zigbee-coordinator-or-openthread-router/
* CC2538 + CC2592 - Zigbee dongle https://www.tindie.com/products/GiovanniCas/cc2538-cc2592-zigbee-dongle-zb30/

## Tarvittavat muut tarvikkeet

Raspberry PI tulee liittää verkkoon kaapelilla. Tarvitset siis normaalin verkkokaapelin Raspberry PIn ja reitittimesi/kytkimen välille.

Tarvitset myös jonkun tietokoneen (Win/Mac/Linux), jonka kautta asennukset tehdään.
