epub:
	pandoc --epub-stylesheet=gh-pandoc.css  CheatSheet.md -f markdown -t epub -s -o CheatSheet.epub

spellcheck:
	aspell -c CheatSheet.md
