# Ulkoiset palvelut

Avoin älykoti on myös riippuvainen. Toisaalta se ei ole riippuvainen vain yhdestä toimijasta, mutta suoraviivaisuuden takia tässä esitellään vain yksi toimija joka kategoriasta.

Ulkoisten palveluiden kanssa tulee tehdä sopimus, joka siis tässä tapauksessa on kaikkien palveluntarjoajien osalta veloitukseton.

Sitoudut kuitenkin tiettyihin käyttöehtoihin, jotka ovat äärimmäisen vapaat. Et siis saa käyttää palvelua väärin tai haitata sen toimintaa ja jos palvelu ei toimi, sinulla ei ole oikeutta haastaa heitä oikeuteen jne.

## DNS (DuckDNS)

Jokaisella IP-osoitteella voi olla nimi tai useampi. Esimerkiksi DNS-nimi google.fi osoittaa tiettyyn IP-osoitteeseen. Tämä osoite kysytään google.fi -domainia hallitsevalta nimipalvelimelta.

Avoimessa älykodissa DNS-nimeä - eli juuri sinun älykodin DNS-nimeä - käytetään ensisijaisesti mukavuuden tavoitteluun, mutta sillä on myös tärkeä rooli TLS-sertifikaatin hankinnassa.

## TLS / https (Let's Encrypt)

Kun jollain palvelulla on olemassa DNS-nimi, voidaan liikenteessä sillepäin käyttää salausta.
Mikäli liikenne palveluun menee salaamattomana, valittavat selaimet monesti haittasivustoista tai muista vaarallisista sivuista. Tämä on syy, miksi omassa lähiverkossakin - joka lähtökohtaisesti on turvallinen, tai pitäisi ainakin olla - liikenne on hyvä olla salattua.

Nykyään kaikki http-salaus on TLS-protokollalla toteutettua. TLS-protokolla vaatii sertifikaatin ulkoiselta taholta. Let's Encrypt on avoin organisaatio, joka tuottaa näitä sertifikaattipalveluita.

Palvelu perustuu siihen, että tietyllä DNS-tiedolla todistetaan Let's Encryptille, että sertifikaatin hakija omistaa domainin. DuckDNS:n tapauksessa `duckdns token` todistaa omistajuuden.

## VPN (Zerotier)

Mikäli älykotijärjestelmään halutaan päästä kotiverkon ulkopuolelta käsiksi, voidaan se toteuttaa useammalla eri tavalla:

1. Avaamalla portteja paikallisesta verkkoreitittimestä ja tekemällä sinne pääsyreitin
2. Käyttämällä ulkoista VPN-palvelinta/palvelua jonka kautta liikenne ohjautuu

Zerotier on VPN-palvelu, joka poikkeaa merkittävästi yleisimmistä VPN-palveluista. Zerotieriä voi ajatella äärimmäisen turvallisena - avoimeen lähdekoodiin perustuvana - "jossain tuolla pilvessä" olevana verkkoreitittimenä. Se siis yhdistää turvallisesti ympäri Internetiä olevia laitteita yhdeksi verkoksi.

Palvelu on veloitukseton pienille verkoille ja toisaalta palvelua voi myös ajaa omalla palvelimellaan, jos siihen on halua ja kykyä.
