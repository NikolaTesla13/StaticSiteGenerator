#!/bin/bash

INPUT_DIR=input/*
OUTPUT_DIR=output/

rm $OUTPUT_DIR/index.html
touch $OUTPUT_DIR/index.html

generateSucklessWebsite() {
    echo $(curl -s https://pastebin.com/raw/iJzCacTi) > $OUTPUT_DIR/index.html
    echo $(cat input/title.txt) >> $OUTPUT_DIR/index.html
    echo $(curl -s https://pastebin.com/raw/g28cqNFq) >> $OUTPUT_DIR/index.html
    echo $(cat input/title.txt) >> $OUTPUT_DIR/index.html
    echo $(curl -s https://pastebin.com/raw/es4QasJj) >> $OUTPUT_DIR/index.html

    for FILE in $INPUT_DIR
    do 
        if [ $FILE != "input/bloat" ] && [ $FILE != "input/title.txt" ]
        then
            ARTICLE_TITLE=$(sed -e 's/\input//g' -e 's/\.md//g' <<< $FILE)
            ARTICLE_CONTENT=$(cat input$ARTICLE_TITLE.md) | markdown

            echo $(curl https://pastebin.com/raw/BKnqvmXh) > $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo $(cat input/title.txt) >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo $(curl https://pastebin.com/raw/0kg78gdv) >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo $ARTICLE_TITLE >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo '</h1><hr>' >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo $(cat input$ARTICLE_TITLE.md) | markdown >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo '</body></html>' >> $OUTPUT_DIR/articles/$ARTICLE_TITLE.html
            echo "<li><a href='articles"$ARTICLE_TITLE".html'>"$ARTICLE_TITLE"</a></li>" >> $OUTPUT_DIR/index.html
        fi
    done

    echo $(curl -s https://pastebin.com/raw/XPmDhNT5) >> $OUTPUT_DIR/index.html
}

generateBloatWebsite() {
    echo "still in development!"
}

if [ $# -eq 0 ]
then
    generateSucklessWebsite
else
    if [ $1 == "--bloat" ] 
    then
        generateBloatWebsite
    else
        generateSucklessWebsite
    fi
fi