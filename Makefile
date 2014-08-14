cabal.sandbox.config:
	cabal sandbox init
	cabal install --only-dependencies

README.md: EMERALDS.ipynb
	ipython nbconvert --to markdown --stdout EMERALDS.ipynb | \
		pandoc -f markdown -t markdown_github --filter haskell.hs - | \
		sed 's/\`\`\` {.haskell}/\`\`\`haskell/g' > $@
	# Replace <img> tags with Markdown images
	for im in `ls EMERALDS_files` ; do \
		sed -i '' "1,/<img.*/s/<img.*/![](EMERALDS_files\/$$im)/" $@ ; \
	done
