#!/usr/bin/bash

if [ $# -eq 0 ]; then
	echo "ファイルを指定してください。"
	exit 1
fi

for file in "$@"; do
	echo
	echo "=====${file}====="
	echo "> javac ${file}"
	cp $file tmp.java
	cat tmp.java | grep -v "package" > $file
	javac $file 2> error.log
	mv tmp.java $file
	if [ -s error.log ]; then
		cat error.log
		rm error.log
		exit 1
	else
		class=${file##*/}
		echo "> java ${class}"
		java ${class} 2> runtime_error.log

		if [ -s runtime_error.log ]; then
			cat runtime_error.log
			rm runtime_error.log
			exit 1
		fi

		rm runtime_error.log
	fi

	rm error.log
	ruby -e "puts '=' * (${#file} + 10)"
done
