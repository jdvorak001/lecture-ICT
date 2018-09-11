#!/bin/sh

# dataset from http://data.europa.eu/euodp/en/data/dataset/cordisH2020projects, the "H2020 Organizations" in CSV format
wget --no-verbose --timestamping --directory-prefix=data/ http://cordis.europa.eu/data/cordis-h2020organizations.csv

# ???
iconv -f windows-1252 -t UTF-8 <data/cordis-h2020organizations.csv | \
sed 1d | \
grep ';coordinator;' | \
cut -f2,6,11 -d';' | \
sort > data/c.txt

# ???
iconv -f windows-1252 -t UTF-8 <data/cordis-h2020organizations.csv | \
sed 1d | \
grep -v ';coordinator;' | \
cut -f2,6,11 -d';' | \
sort > data/p.txt

# ???
join -t';' data/c.txt data/p.txt | \
cut -f2-5 -d';' | \
sort | \
uniq -c | \
sort -n -r | \
sed -e 's/^ *\([0-9]*\) */\1;/' > data/m1.txt

# ???
join -t';' data/c.txt data/p.txt | \
cut -f3,5 -d';' | \
sort | \
uniq -c | \
sort -n -r | \
sed -e 's/^ *\([0-9]*\) */\1;/' > data/m2.txt
