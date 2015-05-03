echo "deleting public_html"
rm -r ../public_html/*

echo "copying posts to public_html"
cd ../private_src/posts

for dir in */
do
	if [ -e "$dir"index.html ]
	then
		echo "$dir"
		mkdir ../../public_html/"$dir"
		cp "$dir"index.html ../../public_html/"$dir"
	fi
done

echo "copying favicon"
cd ..
cp favicon.ico ../public_html

echo "generating css"
echo $PWD
cd ../generator
compass compile

echo "all done"