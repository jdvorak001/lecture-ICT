Úloha č. 7
==========

V souboru [file-sizes.csv](https://github.com/jdvorak001/lecture-ICT/blob/master/problem-007/file-sizes.csv) v tomto adresáři
jsou uvedeny údaje o 37 501 souboru, které tvoří [March 2020 Public Data File from Crossref](https://doi.org/10.13003/83B2GP).
Jde o soubory komprimované příkazem `gzip`.

([Crossref](https://www.crossref.org) je registrační autorita [DOI](https://en.wikipedia.org/wiki/Digital_object_identifier) specializující se na oblast vědecké komunikace.
Jeho data jsou standardně dostupná pod volnou licencí přes [API](https://api.crossref.org), 
letos ale byla [vydána také souborně](https://www.crossref.org/blog/free-public-data-file-of-112-million-crossref-records/).)

Část 1 (R)
----------

Založte si v RStudiu nový projekt, stáhněte si do něj soubor [file-sizes.csv](https://github.com/jdvorak001/lecture-ICT/raw/master/problem-007/file-sizes.csv) 
a načtěte si jeho obsah do proměnné `data`.
- Doplňte údaj `ratio` jako poměr nekomprimované velikosti souboru ku velikosti komprimované.
- Vykreslete graf závislosti komprimované velikosti souboru na velikosti nekomprimované. Barvou odlište různé kompresní poměry. Jak se v grafu vyrovnat s tím, že několik souborů je opravdu velikých? Jaké druhy grafů vás napadají, že by mohly být pro tento účel vhodné?

Část 2 (Unix shell)
-------------------

Soubor `file-sizes.csv` vznikl následujícími příkazy:
```
cd /data/Crossref/crossref
gzip -lv *.json.gz | \
awk -vFS=\  'BEGIN { print "filename;compressed_size;uncompressed_size" } ( NR > 1 ) { print $9 ";" $6 ";" $7 }' | \
sed -e '$d' >../file-sizes.csv
```
Vysvětlete význam jednotlivých příkazů a případně demonstrujte jejich efekt. 
K tomu můžete využít server, na který jsme se připojovali při přednášce 14.04.2020.
