@printf "\n"
@printf "deleting public_html\n\n"
@rm -r ../public_html/*

@printf "generating css\n"
@compass compile
@printf "\n"

@printf "copying favicon\n\n"
@cp ../private_src/favicon.ico ../public_html

@printf "copying posts:\n"
@cd ../private_src/posts
for dir in */
do
	if [ -e "$dir"index.html ] # If a private_src/posts/* subdirectory has the index.html file,
	then                       # then we will copy the entire subdirectory to public_html.
		@printf "\t$dir\n"
		@mkdir ../../public_html/"$dir"
		@cp -R "$dir"/* ../../public_html/"$dir"
	fi
done
@printf "\n"


# Copying is finished at this point. However, we did not want to publish any files or
# directories whose names start with an underscore, _.  I would have preferred not to
# even copy these files, but I'm finding it difficult to execute that under Windows.
# So instead, we delete all those files and folders here.

@printf "deleting directories that start with _"
/cygwin64/bin/find ../../public_html -type d -name "_*" | xargs rm -r
@printf "deleting files that start with _"
/cygwin64/bin/find ../../public_html -type f -name "_*" | xargs rm

@printf "all done\n"