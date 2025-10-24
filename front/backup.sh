#!/bin/bash

mkdir ./backup
cd ./backup

MYSQL='mysql --skip-column-names'

for s in `$MYSQL -e "show databases"`;
do
	mkdir $s
	#echo "Backup database $s"
		for t in `$MYSQL -e "show tables from $s"`;
		do
			#echo "table $t"
			mysqldump $s $t --all-databases --triggers --routines --events --single-transaction > $s/$t.sql
		done
done
echo "Backup successfully completed"
exit 0;
