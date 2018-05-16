#!/bin/sh

# dataset from http://data.europa.eu/euodp/en/data/dataset/cordisH2020projects, the "H2020 Organizations" in CSV format
wget --no-verbose --timestamping --directory-prefix=data/ http://cordis.europa.eu/data/cordis-h2020organizations.csv

COUNTRIES="CZ SK PL HU AT SI"

for X in $COUNTRIES
do
	N=$(
		grep ';'$X';' data/cordis-h2020organizations.csv | \
		cut -f2 -d';' | \
		sort | \
		uniq | \
		tee data/proj-id-$X.txt | \
		wc -l | \
		sed -e 's/^ *//'
	)
	echo $X $N
done

for X in $COUNTRIES
do
	for Y in $COUNTRIES
	do
		N=$(
			join data/proj-id-$X.txt data/proj-id-$Y.txt | \
			wc -l | \
			sed -e 's/^ *//'
		)
		echo $X $Y $N
	done
done

