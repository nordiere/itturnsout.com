@ printf "\n"
@ printf "deleting public_html\n\n"
@ rm -r ../public_html/*

@ printf "generating css\n"
@ call compass compile
@ printf "\n"

@ printf "copying root\n\n"
@ cp ../private_src/favicon.ico ../public_html
@ cp ../private_src/index.html ../public_html

@ printf "copying posts\n"
@ cd ../private_src/posts
@ cp -r * ../../public_html
@ printf "done copying posts\n"

: Copying is finished at this point. However, we did not want to publish any files or
: directories whose names start with an underscore, _.  I would have preferred not to
: even copy these files, but I'm finding it difficult to execute that under Windows.
: So instead, we delete all those files and folders here.

@ printf "deleting directories that start with _\n"
@ /cygwin64/bin/find ../../public_html -type d -name "_*" | xargs rm -rf
@ printf "deleting files that start with _\n"
@ /cygwin64/bin/find ../../public_html -type f -name "_*" | xargs rm -f

@ cd ../../generator

@ printf "all done\n"