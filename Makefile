.PHONY: all
# Make sure to put additional targets between extra-pre and extra-post
all: extra-pre general git vim codespell flatpak chrome elementary-sdk virtualbox extra-post

.PHONY: extra-pre
extra-pre:
	@cd extra && ./configure_extra.sh extra-pre.tar.gz

.PHONY: general
general:
	@cd general && ./configure_general.sh

.PHONY: git
git:
	@cd git && ./configure_git.sh

.PHONY: vim
vim:
	@cd vim && ./configure_vim.sh

.PHONY: codespell
codespell:
	@cd codespell && ./configure_codespell.sh

.PHONY: flatpak
flatpak:
	@cd flatpak && ./configure_flatpak.sh

.PHONY: chrome
chrome:
	@cd chrome && ./install_chrome.sh

.PHONY: elementary-sdk
elementary-sdk:
	@cd elementary-sdk && ./install_sdk.sh

.PHONY: virtualbox
virtualbox:
	@cd virtualbox && ./install_virtualbox.sh

.PHONY: extra-post
extra-post:
	@cd extra && ./configure_extra.sh extra-post.tar.gz
