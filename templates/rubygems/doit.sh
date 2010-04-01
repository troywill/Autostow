#!/bin/bash
set -o errexit
GEM='rails-2.3.5'
sudo mkdir /stow/${GEM}
sudo chown troy /stow/${GEM}
gem install rails --install-dir /stow/${GEM}/usr/lib/ruby/gems/1.9.1 \
    --bindir /stow/${GEM}/usr/bin \
    --no-rdoc \
    --no-ri
#    --ignore-dependencies \
