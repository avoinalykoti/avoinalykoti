# Asennus

Asentaminen tapahtuu yksinkertaistettuna seuraavasti:

1. Ladataan koneelle "asennustarvikepaketti" ja puretaan se omalle tietokoneelle
2. Laitetaan asentumaan asennukseen tarvittavat ohjelmistot
3. Laitetaan latautumaan Raspbian -image massamuistille 
3. Avataan tarvittavat [ulkoiset palvelut](avoimen_alykodin_rakentaminen/ulkoiset_palvelut.md)
4. Muokataan `vars/main.json` tiedostoon oikeat asetukset
5. Kytketään massamuisti Raspberry Pi:hin ja kytketään Raspi verkkoon ja virtaan
6. Käynnistetään asennus

## Asennuspaketin lataaminen

Asennuspaketti löytyy [Githubista](https://github.com/avoinalykoti/avoinalykoti).

Paketin saa ladattua joko git-apuohjelmalla tai suoraan palvelusta klikkaamalla Code -> Download ZIP.

Pura paketti esimerkiksi työpöydälle.

Paketista tulee sekä tämä opas että hakemisto `ansible`. Tuon hakemiston alla on kaikki asennukseen tarvittava.

## Asennukseen tarvittavien ohjelmistojen asennus

Asennusprosessi perustuu Ansibleen, joka toimii Python -ohjelmointikielellä. 

Asennukseen tarvittavien ohjelmien asennus hoituu hieman eri tavalla eri käyttöjärjestelmillä.

### Windows

Windows-maailmassa tuki Ansiblelle on huono, joten siinä joudutaan käyttämään Cygwin-ympäristöä apuna. Cygwin on käytännössä Windowsin päällä toimiva Linux.

Mikäli sinulla on käytössä WSL (Windows Subsystem for Linux), voit seurata Linux-ohjeita.

Tarvittavat ohjelmistot saadaan asennettua helpoiten Chocolatey -pakettihallintaohjelmalla. Seuraavilla ohjeilla saat asennettua kaiken tarvittavan:

1. Käynnistä komentokehote järjestelmänvalvojana
2. Kopioi ja liitä nämä komennot komentokehotteeseen

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install -y cygwin cyg-get
choco install -y rpi-imager vscode
cyg-get python38 python38-pip python38-devel libffi-devel libssl-devel openssh make gcc-g++ sshpass python38-paramiko

```
  * Ensimmäinen rivi asentaa Chocolatey-pakettienhallinnan
  * Toinen rivi asentaa Cygwinin
  * Kolmas rivi asentaa Raspberry Pi Imagerin ja VSCoden
  * Neljäs rivi asentaa Cygwiniin Ansiblen vaatimat palikat
3. Komentojen ajamiseen menee noin 5 minuuttia
4. Tämän jälkeen voit käynnistää `Cygwin64 Terminal` -ohjelman
5. Kun sen ikkuna aukeaa, kirjoita sinne
```
pip3 install -v ansible
```
6. Nyt alkaa varsinainen Ansiblen asennus, se kestää noin 25 minuuttia

Jätä kone asentamaan, voit jatkaa muita toimenpiteitä seuraavaksi.


### Mac

Mac-järjestelmissä on pääsääntöisesti lähes kaikki tarvittavat komponentit olemassa. Järjestelmään tulee asentaa kuitenkin kaksi apuohjelmaa, Ansible ja Paramiko. Paramiko on Python-pohjainen SSH-client.

Tee asennukset seuraavasti:
1. Käynnistä Pääte (Terminal)
2. Kirjoita päätteeseen
```
pip install ansible
pip install paramiko
```
3. Asennus on valmis

### Linux

Linuxissa tuki on hyvin pitkälti samanlainen kuin Mac-ympäristössä. Voit tehdä samat toimet kuin Mac-ohjeissakin.

## Raspbian -imagen lataaminen massamuistille

Massamuistille ladataan Raspbian -käyttöjärjestelmä, joka toimii Raspberry PI:n virallisena käyttöjärjestelmänä.

Käyttöjärjestelmä ladataan massamuistille näin:
1. Kytke massamuisti (SD-kortti/SSD-levy) tietokoneeseesi
2. Lataa koneellesi Raspberry Pi Imager: https://www.raspberrypi.org/software/
3. Käynnistä Raspberry Pi Imager
4. Valitse (Choose OS) ladattavaksi käyttöjärjestelmäksi
    * Raspberry Pi Os (other) --> Raspberry Pi OS Lite
5. Valtse (Choose SD Card) oikea massamuisti
6. Paina Write

Tässä vaiheessa massamuistille latautuu käyttöjärjestelmä. Siinä voi mennä muutamia minuutteja.

Kun kirjoitus on valmis, ota massamuisti irti ja kytke takaisin koneeseesi.

Koneeseesi ilmestyy `BOOT`-niminen levy. Luo sinne tiedosto, esimerkiksi muistiolla, sisällöllä ei ole merkitystä, mutta tiedostonimen tulee olla `ssh.txt`.

Tämä tiedosto aktivoi SSH-palvelimen käynnistyksessä.

## Ulkoisten palveluiden avaaminen

Avataan kaksi palvelua:
1. DuckDNS
2. Zerotier

## DuckDNS

Rekisteröi DuckDNS-tili seuraavasti:

1. Kirjaudu sisään haluamallasi tavalla osoitteessa https://www.duckdns.org/ 
2. Tee uusi subdomain, vaikkapa avoinalykoti.duckdns.org, laita tämä osoite muistiin, tämä on `duckdns domain`.
3. Ota talteen sivun ylälaidassa näkyvä token, tämä on `duckdns token`

## Zerotier

Avaa itsellesi Zerotier-tunnus seuraavasti:
1. Kirjaudu sisään/rekisteröidy osoitteessa https://www.zerotier.com/
2. Tee uusi verkko (Create A network)
3. Klikkaa verkko auki, vaihda sille nimi, jos haluat
4. Ota Network ID ylös, tämä on `zerotier network_id`
5. Klikkaa ylhäältä Account
6. Paina New Token
7. Anna nimeksi vaikkapa Avoin älykoti
8. Paina Generate
9. Saatu token on `zerotier token`

## Määritystiedoston `vars/main.yaml` muokkaus

Kaikki asennukseen tarvittavat tiedot määritellään YAML-muotoisessa tiedostossa `vars/main.yaml`.

Asennustarvikepaketissa ei tuota tiedostoa vielä löydy, vaan siellä on vain `main.example.yaml` -tiedosto. Kopioi se ensin nimelle `main.yaml`.

Avaa sen jälkeen tiedosto haluamaasi tekstieditoriin. Mikäli et tiedä, mikä tekstieditori sinulle soveltuu, käytä Visual Studio Codea (VS Code).

Tiedostoon muokataan ainakin seuraavat tiedot:
* `timezone`: Aikavyöhyke, jos oletus ei ole sinulle oikea, katso oikea täältä: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
* `letsencrypt_email` Sähköpostiosoite, johon Let's Encrypt lähettää viestiä, jos sertifikaatti uhkaa vanhentua
* DuckDNS-asetukset:
  * `token`: Syötä tähän DuckDNS-palvelusta saamasi token
  * `domain`: Syötä tähän valitsemasi domain
* Zerotier:
  * `token`: Syötä tähän Zerotier-palvelusta saamasi token
  * `network_id`: Syötä tähän Zerotier-palveluun luomasi verkon id
* `data_dir`: Tämän hakemiston alle asennus tekee kaikki tiedostot
* `installation_type`: Tulevaisuudessa tällä pystytään määrittämään asennuksen tyyppi
* Home Assistant-asetukset:
  * `name`: Anna älykodillesi nimi
  * `latitude` ja `longitude`: Kotisi koordinaatit. Home Assistant käyttää tätä mm. säätietojen hakemiseen ja auringonnousun/laskun määrittämiseen. Etsi osoitteesi esimerkiksi Google Mapsista ja katso osoiteriviltä 
  * `elevation`: Kotisi korkeus merenpinnasta - tätä käytetään auringonnousun/laskun määrittämiseen myös.
  * Määritetyt tiedot tallentuvat Home Assistantin `configuration.yaml` -tiedostoon, voit muuttaa niitä myöhemmin
* Komponentit:
  * Nämä valinnat määrittävät, mitkä komponentit asennetaan. `true` kertoo, että kyseinen komponentti asennetaan, `false` kertoo, että sitä ei asenneta
* Code-server:
  * `password`: Tämä määrittää salasanan, jota code-server kysyy ennenkuin päästää muokkaamaan tiedostoja
* PostgreSQL -asetukset:
  * `postgresql_databases`/`name` määrittää tietokannan nimen
  * `postgresql_users`/`name` ja `password` määrittää millä käyttäjätunnuksilla Home Assistant pääsee tietokantaan 
* Github
  * Asetukset eivät ole vielä käytössä


## Raspberry PI:n ensimmäinen käynnistäminen

Kytke massamuisti Raspberry PI:hin ja kytke laitteeseen virta.

Ensimmäisessä käynnistyksessä voi mennä useampia minuutteja.

Laite saa verkkoon kytkeytyessä automaattisesti (DHCP-protokollalla) IP-osoitteen. IP-osoite on numerosarja, esimerkiksi `192.168.100.3`, jolla laite löytyy lähiverkostasi.

Tähän on muutamia selvittämistapoja:

1. Ping
    * Käynnistä komentokehote (tai Mac:ssä Pääte)
    * Kirjoita
    ```
    ping raspberrypi
    ```
    * Mikäli laite löytyy oikealla nimellä, vastaa laite ip-osoitteella, ota ip-osoite ylös
2. Reititin
    * Kirjaudu omaan verkkoreitittimeesi ja katso sieltä jaetut DHCP-osoitteet

Tässä vaiheessa on mahdotonta kirjoittaa ohjetta, joka selvittää tämän kohdan, muokataan ohjetta kun ongelmatilanteita tulee vastaan :)

Vahva suositus on kuitenkin, että laitteelle asetetaan reittimen päästä kiinteä IP-osoite. Tämä on mahdollista useimmissa reitittimissä.

Mikäli laite ei käynnisty ollenkaan, voi laitteessa olla väärä laitteisto-ohjelmaversio (firmware).

Tässä tapauksessa päivityksen voi tehdä esimerkiksi tällä ohjeella: https://www.tomshardware.com/how-to/boot-raspberry-pi-4-usb

Päivitys vaatii yhden SD-kortin, jolta käynnistäminen tehdään ohjelmistopäivityksen ajaksi.

Lopputuloksena on kuitenkin lähiverkossa kytkettynä oleva Raspberry PI -laite.

## Asennuksen käynnistys

### IP-osoitteen asettaminen

Aseta Raspberry PI:n ip-osoite tiedostoon `hosts.yaml`. Mikäli käytät muita kuin oletuskäyttäjätunnuksia (`pi`/`raspberry`) laitteessasi, voit määrittää ne myös samaan tiedostoon.

### Asennuksen käynnistäminen

Asennus käynnistetään suorittamalla `start.sh` -komentojono `ansible`-hakemistossa.

Mikäli käytät Windowsia, tee seuraavasti:
1. Käynnistä Cygwin64 Terminal
2. Mene oikeaan hakemistoon:
    * Cygwin käsittelee hakemistoja hieman eri tavalla kuin Windows normaalisti. Mikäli sinulla on tiedostot esimerkiksi työpöydällä hakemistossa `C:\Users\Käyttäjänimi\Desktop\avoinalykoti\ansible` niin kyseinen hakemisto löytyy Cygwin-puolelta muodossa `/cygdrive/c/users/käyttäjänimi/desktop/avoinalykoti/ansible`
```
cd /cygdrive/c/avoinalykoti/ansible
```

Käynnistä asennusprosessi komennolla
```
./start.sh
```

Asennus kestää noin 10 minuuttia. Kun asennus on päättynyt, voit kokeilla päästä selaimella DuckDNS:ään määrittelemälläsi domain-nimellä ja sieltä pitäisi vastata Home Assistant.

Huom! Sertifikaatin haku voi joskus kestää. Odota rauhassa asennuksen päättymisen jälkeen 5 minuuttia.
