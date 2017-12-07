#!/bin/bash

hugo new site Blog
git submodule add https://github.com/yoshiharuyamashita/blackburn.git themes/blackburn
cd Blog;\
git init;\
git submodule add https://github.com/yoshiharuyamashita/blackburn.git themes/blackburn;\

# Edit your config.toml configuration file
# and add the Ananke theme.
echo 'theme = "blackrun"' >> config.toml