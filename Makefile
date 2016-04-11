dotfiles:
	@for file in $(shell find $(CURDIR) -name '.*' -mindepth 1 -maxdepth 1 -not -name '.git' -not -name '.gitmodules'); do \
		base=$$(basename "$$file"); \
		ln -sfnv "$$file" "$(HOME)/$$base"; \
	done
