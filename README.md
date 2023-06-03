# dotfiles
This is my dotfiles which you can freely use, refer to create your own, etc.

## Usage
You'll need the following dependencies:

- apt
- make

You can select components to install/customize by passing the following strings to the `make` command:

- chrome
- codespell
- elementary-sdk
- flatpak
- general
- git
- vim
- virtualbox

```bash
# Install all components
make

# Install selected components
make general git
```
