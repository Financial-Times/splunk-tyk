TMPDIR := $(shell mktemp -d)

.PHONY: clean

latest: splunk_tyk-latest.tar.gz

# Splunk expects specific file and folder permissions that are
# lost when using `git archive`, use `tar` to preserve permissions
#
# The tar directory structure must include a base directory named
# after the app ID in app.conf.
splunk_tyk-%.tar.gz: $(wildcard app/default/*.conf) $(wildcard app/metadata/*.meta)
	mkdir -p $(TMPDIR)/splunk_tyk/
	cp -r app/* $(TMPDIR)/splunk_tyk/
	tar -C $(TMPDIR) -czf $(TMPDIR)/$@ splunk_tyk/
	mv $(TMPDIR)/$@ .

clean:
	rm -f splunk_tyk-*.tar.gz
