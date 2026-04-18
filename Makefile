CHEZMOI_DIR = ~/.local/bin
CHEZMOI = $(CHEZMOI_DIR)/chezmoi

################################################################################
# Main targets
################################################################################
# Run first-time setup
.PHONY: install
install: install_rust install_chezmoi init apply

# Fetch and apply changes in the remote repository
.PHONY: update
update:
	$(CHEZMOI) update

################################################################################
# Sub targets
################################################################################
# Install Rust non-interactively
# See https://qiita.com/maguro_tuna/items/f69b2e41f753d2ff0cc2
.PHONY: install_rust
install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	. "$HOME/.cargo/env"

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
