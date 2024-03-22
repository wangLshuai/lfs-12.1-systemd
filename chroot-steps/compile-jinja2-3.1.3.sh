#!/usr/bin/env bash
set -e
cd /sources

rm -rf Jinja2-3.1.3
tar -xvf Jinja2-3.1.3.tar.gz
cd Jinja2-3.1.3
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links=dist Jinja2
rm -rf /sources/Jinja2-3.1.3

