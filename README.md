# cravend.theme

This is my custom ZSH theme, which I feel is a nice balance between being informative and overwhelming.

## Installation

First, download the file:

```sh
curl -o $ZSH_CUSTOM/themes/cravend.zsh-theme \
https://raw.githubusercontent.com/cravend/theme/main/cravend.zsh-theme
```

Then, define your custom theme in `.zshrc`:

```sh
export ZSH_THEME="cravend"
```

If you want the optional right-aligned battery display, add the battery script to `/usr/local/bin`:

```sh
curl -o /usr/local/bin/battery \
https://raw.githubusercontent.com/cravend/theme/main/battery.sh

```

This script hasn't been tested except on macOS.

## Features

- color-coded git symbols (new, modified, etc)
- sane defaults (hide the hostname when you're not in a SSH session)

## Notes

I think this looks best using the [`base16_tomorrow`](https://github.com/chriskempson/tomorrow-theme#tomorrow) and [`base16_tomorrow-night-eighties`](https://github.com/chriskempson/tomorrow-theme#tomorrow-night-eighties) themes, so I wrote [`autodark`](https://github.com/cravend) to help automate switching. You should check it out!
