link:
	@for file in $(shell find "$(CURDIR)" -mindepth 1 -maxdepth 1 -name '.*' -not -name '.git'); do \
		ln -sfnv "$$file" "$(HOME)/$$(basename "$$file")"; \
	done
