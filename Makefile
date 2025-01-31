# Usar con make=numero da revista
# exemplo:
# make numero=001

SHELL := bash
.DEFAULT_GOAL := rula

rula: revistas/$(numero)/documento.tex
	latexmk revistas/$(numero)/documento.tex

limpa:
	rm -rf .pdf/* .aux/*

.PHONY: rula limpa
