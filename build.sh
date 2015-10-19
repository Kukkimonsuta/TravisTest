#!/bin/sh

dnvm use default
dnu restore
dnu build ./src/* ./samples/* --framework dnxcore50