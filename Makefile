publish_dir := public
timestamps_dir := .timestamps
orgs := $(wildcard *.org)
emacs_pkgs := org

publish_el := elisp/publish.el

^el = $(filter %.el,$^)
EMACS.funcall = emacs --batch --no-init-file $(addprefix --load ,$(^el)) --funcall

all: publish

publish: $(publish_el) $(orgs)
	$(EMACS.funcall) rw-publish-all

clean:
	rm -rf $(publish_dir)
	rm -rf $(timestamps_dir)



mds:=$(wildcard _posts/*.md)
orgs:=$(patsubst %.md,%.org,$(mds))

convert-all: $(orgs)
	mv _posts posts

%.org: %.md
	pandoc -f markdown -t org -o $@ $<
	rm $<
