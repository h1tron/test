#!/bin/bash



folder=~/Dokumente
to=~/backup

if [ ! -d "$wo" ]; then
	mkdir "$to"
fi

filename="backup-dokumente"
filenada="$filename-$(date +'%Y-%m-%d')"

tar -cjf "$to/$filenada.tar.bz2" -C "$folder" .

if [ -r "$to/$filenada.tar.bz2" ]; then
	echo "Backup erfolgreich!";
else
	echo "Nicht erfolgreich!";
fi

oldbackups=$(find ~/backup/ -type f ! -name "$filename-$(date +'%Y-%m')" | cut -d '-' -f 3,4 | sort | uniq)

for x in $oldbackups; do
	echo "Backup Monate:  $x"
	month_files=$(ls $to/$filename-$x-*.tar.bz2 | tail -n +2)
	rm $month_files;	

done
