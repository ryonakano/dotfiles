CHEZMOI_DIR = ~/bin
CHEZMOI = $(CHEZMOI_DIR)/chezmoi

.PHONY: all
all: install_chezmoi init apply

# Install chezmoi https://www.chezmoi.io/install/#one-line-package-install
.PHONY: install_chezmoi
install_chezmoi:
	sh -c "$$(curl -fsLS get.chezmoi.io)" -- -b $(CHEZMOI_DIR)

.PHONY: init
init:
	$(CHEZMOI) init .

.PHONY: apply
apply:
	$(CHEZMOI) apply
