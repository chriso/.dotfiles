dotfiles:
	@for file in $(shell find "$(CURDIR)" -name '.*' -mindepth 1 -maxdepth 1 -not -name '.git' -not -name '.gitmodules'); do \
		ln -sfnv "$$file" "$(HOME)/$$(basename "$$file")"; \
	done
