VERSION = 01
DOCNAME = draft-toorop-dnsop-dns-zone-provisioning-yang
YANGDOCVERSION = 2020-04-13
YANGDOCNAME = ietf-dns-zone-provisioning

all: $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html

$(DOCNAME)-$(VERSION).txt: $(DOCNAME).xml
	xml2rfc --text -o $@ $<

$(DOCNAME)-$(VERSION).html: $(DOCNAME).xml
	xml2rfc --html -o $@ $<

$(DOCNAME).xml: $(DOCNAME).md  $(YANGDOCNAME).tree $(YANGDOCNAME).yang
	sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< | mmark --xml2 --page > $@

$(YANGDOCNAME).tree: $(YANGDOCNAME)@$(YANGDOCVERSION).yang
	pyang -f tree --ietf $< >$@

$(YANGDOCNAME).yang: $(YANGDOCNAME)@$(YANGDOCVERSION).yang
	( echo "<CODE BEGINS> file \"$<\""; cat $<; echo "<CODE ENDS>" ) > $@

clean:
	rm -f $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html \
	      $(DOCNAME).xml $(YANGDOCNAME).yang
