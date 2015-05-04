printf "\n"
printf "deleting public_html\n\n"
rm -r ../public_html/*

printf "copying posts to public_html:\n"
cd ../private_src/posts
for dir in */
do
	if [ -e "$dir"index.html ]
	then
		printf "\t$dir\n"
		mkdir ../../public_html/"$dir"
		cp "$dir"index.html ../../public_html/"$dir"
	fi
done
printf "\n"

printf "copying favicon\n\n"
cd ..
cp favicon.ico ../public_html

printf "generating css\n"
cd ../generator
compass compile
printf "\n"

printf "all done\n"