.DEFAULT_GOAL := html

# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    = -W -j auto
SPHINXBUILD   = python -msphinx
SPHINXPROJ    = api-documentation
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

css:
	@./node_modules/.bin/parcel build source/theme/styles/main.scss --out-dir source/_static --out-file style --detailed-report

css-reload:
	@./node_modules/.bin/parcel source/theme/styles/main.scss --out-dir build/_static --out-file style --no-hmr

html-reload:
	sphinx-autobuild -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	make css
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
