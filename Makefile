all: lit_fam

lit_fam:
	cd src && zip -r ../$@.love *
