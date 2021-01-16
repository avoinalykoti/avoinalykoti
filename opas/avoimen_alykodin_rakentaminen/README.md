# Avoimen älykodin rakentaminen

Tavoitteena on siis avoimilla tekniikoilla rakennetun kestävän älykotiratkaisun rakentaminen.

Älykoti rakentuu useasta eri komponentista. Älykotirakentamisen alkuvaiheessa saattaa vaihtoehtojen paljous ahdistaa ja tähän oppaaseen on pyritty valitsemaan - ei täydelliset, mutta - hyvät lähtökohdat älykodin pohjaksi. Tekniikka kehittyy nopeasti ja nyt hyvä ratkaisu saattaa osoittautua kuukausien tai vuosien saatossa huonoksi tai tilalle saattaa tulla vain parempi ratkaisu.

Lopputuloksena tässä asennuksessa saat automatisoidusti asentuvan ns. vakiokomponentteihin perustuvan älykotiratkaisun. Ratkaisu on käytettävissä salatun yhteyden yli myös älykodin ulkopuolelta.

Kokonaisuus koostuu seuraavista komponenteista:

* Laitteisto
  * Vaadittavat tarvikkeet
    * Raspberry Pi 4 (2Gt versio riittää)
    * Muistikortti (ei suositella)
    * Virtalähde
  * Suositeltavat lisäkomponentit
    * UPS + 2x18650 akut
    * NVMe -massamuisti
    * USB 3.0 -kotelo massamuistille
    * CC2531 tai vastaava Zigbee-tukiasema
* Ohjelmistot
  * Aina asentuvat
      * Älykodin "keskus": Home Assistant
      * Asennuksen automatisointi: Ansible
      * DNS: DuckDNS
      * Reverse-proxy: Traefik
      * TLS-sertifikaatit: Let's Encrypt
      * Tietokanta: PostgreSQL
      * Kontitus: Docker
  * Oletuksena asentuvat
      * MQTT-broker: Mosquitto
      * VPN-ratkaisu: Zerotier
      * Asetustiedostojen muokkaus: code-server
      * Bluetooth-palvelin: BT-MQTT-Gateway *kesken*
      * Zigbee-palvelin: zigbee2mqtt
  * Valinnaiset
      * Mainosesto: Pi-Hole 
      * Videovalvonta: Frigate *kesken*
      * Integraatio Siriin: Homebridge *kesken*

Mikäli kaikki listassa olevat komponentit olivat tuttuja, hyvä! Projekti auttaa sinua asentamaan nämä nopeasti.

Mikäli taas lista kuulostaa heprealta, älä huoli, jatka lukemista.

Tällä hetkellä kesken-merkinnällä olevat tarkoittavat sitä, että paketit ja palvelut asentuvat, mutta integraatiota Home Assistantiin ei ole vielä varmistettu ja asetustiedostojen muokkaukseen ei ole vielä automatiikkaa.