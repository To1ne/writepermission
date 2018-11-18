mds:=$(wildcard _posts/*.md)
orgs:=$(patsubst %.md,%.org,$(mds))

convert-all: $(orgs)
	mv _posts posts

%.org: %.md
	pandoc -f markdown -t org -o $@ $<
	rm $<
