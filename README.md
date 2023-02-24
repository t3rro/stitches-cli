# stitches-cli

## Configuration

Configuration behavior is merge behavior of directories in this order.

* /opt/share/stitches.<ext>
* /etc/stitches/stitches.<ext>
* /etc/stitches/conf.d/*.<ext>
* $XDG_CONFIG_HOME/stitches/stitches.<ext>
* $XDG_CONFIG_HOME/stitches/conf.d/*.<ext>
* stitches.<ext>
* stitches/config.d/*.<ext>
* .stitches.<ext>
* .stitches/config.d/*.<ext>

obs.

<ext> is enum rb|json|yml|yaml|toml|nix
