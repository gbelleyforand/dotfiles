# dotfiles

MacOS configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
    aerospace/      # Aerospace window manager config
    nvim/           # Neovim configuration
    sketchybar/     # Sketchybar config
```

## Prerequisites

### Core Tools
```bash
brew install stow
```

### Application Dependencies

**Aerospace:**
```bash
brew install nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
```

**Sketchybar:**
```bash
brew install sketchybar
brew install --cask sf-symbols
brew tap FelixKratz/formulae
brew install sketchybar-app-font
brew install font-hack-nerd-font
```

**Neovim:**
```bash
brew install neovim
```

## Installation

From the dotfiles directory, stow individual packages:

```bash
cd ~/dotfiles
stow aerospace
stow nvim
stow sketchybar
```

Or stow all configs at once:

```bash
stow */
```

## Uninstall

```bash
stow -D aerospace nvim sketchybar
```

## Adding New Configs

1. Create a new directory: `mkdir -p dotfiles/package-name`
2. Mirror the home directory structure inside it
3. Copy your configs: `cp ~/.config/example dotfiles/package-name/.config/`
4. Stow it: `stow package-name`

## Theme System (Sketchybar)

> ?? **Work in Progress**: The automatic theme switching system is still under development and currently very buggy. Manual theme switching is more reliable.

The Sketchybar configuration includes an automatic theme switching system that responds to macOS system appearance changes.

**How it works:**

1. **`theme_config.sh`** - Configuration file where you set:
   - `DARK_THEME` - Theme to use in dark mode (default: `gruvbox`)
   - `LIGHT_THEME` - Theme to use in light mode (default: `gruvbox-light`)
   - `AUTO_SWITCH_ENABLED` - Enable/disable automatic switching (default: `true`)

2. **`auto_theme.sh`** - Monitors system appearance and switches themes automatically

3. **`colors.sh`** - Loads the current theme from `.theme` file

4. **`themes/`** - Individual theme files defining color variables:
   - `BAR_COLOR` - Status bar background
   - `ITEM_BG_COLOR` - Item background
   - `ITEM_LABEL_COLOR` - Label text color
   - `ITEM_ICON_COLOR` - Icon color
   - `ITEM_BORDER_COLOR` - Border color
   - `WORKSPACE_*_BORDER` - Aerospace workspace border colors

**Manual theme switching:**

```bash
echo "gruvbox" > ~/.config/sketchybar/.theme
sketchybar --reload
```

**Available themes:** `gruvbox`, `gruvbox-light`, `default`

## Known Issues

- **YouTube Music player**: Only works for Arc browser, needs adaptation for other browsers
- **Gruvbox-light theme**: Still a work in progress
- **Theme system**: Does not support updating borders color
- **Theme auto-switch**: Still a work in progress and very buggy
- **Multi-monitor setup**: Aerospace space highlights in Sketchybar are janky and need polish
- **Music player**: Sometimes displays incorrect information and needs polish
