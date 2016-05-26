all: dotfiles vim_modules

dotfiles:
	@for file in $(shell find "$(CURDIR)" -mindepth 1 -maxdepth 1 -name '.*' -not -name '.git' -not -name '.gitmodules'); do \
		ln -sfnv "$$file" "$(HOME)/$$(basename "$$file")"; \
	done

vim_modules:
	git submodule init
	git submodule update
