CHEZMOI_DIR = ~/bin
CHEZMOI = $(CHEZMOI_DIR)/chezmoi

################################################################################
# Main targets
################################################################################
# Run first-time setup
.PHONY: install
install: install_chezmoi init apply

# Fetch and apply changes in the remote repository
.PHONY: update
update:
	$(CHEZMOI) update -v

################################################################################
# Sub targets
################################################################################
# Install chezmoi https://www.chezmoi.io/install/#one-line-package-install
.PHONY: install_chezmoi
install_chezmoi:
	sh -c "$$(curl -fsLS get.chezmoi.io)" -- -b $(CHEZMOI_DIR)

.PHONY: init
init:
	$(CHEZMOI) init .

.PHONY: apply
apply:
	$(CHEZMOI) apply -v
