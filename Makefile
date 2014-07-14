cabal.sandbox.config:
	cabal sandbox init
	cabal install --only-dependencies

README.md: EMERALDS.ipynb
	ipython nbconvert --to markdown --stdout EMERALDS.ipynb | \
		pandoc -f markdown -t markdown_github --filter haskell.hs - | \
		sed 's/\`\`\` {.haskell}/\`\`\`haskell/g' > $@
	@rm -rf EMERALDS_files
