#!/bin/bash
# SCRIPTID 125
# Enumerate PC24 lighting, set PWM output mask
# Type 0
# Startup 0
# Exclusive  4
icdapp='/mnt/user/icdapp'
function nap { sleep .5 }
#check if our third 3x controller is installed
nano=$(mysql -uroot -proot -s econnect -e'select lru_id from lighting_io_installed where lru_id=3')
$icdapp ENUMERATE_SYSTEM 1 0 0 0
sleep 120
#nc1
$icdapp LIGHTING_IO_SETTINGS 27 1 160 1 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 27 1 164 2 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 27 1 168 4 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 27 1 172 8 4 0 0
nap
#nc2
$icdapp LIGHTING_IO_SETTINGS 28 1 160 16 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 28 1 164 32 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 28 1 168 64 4 0 0
nap
$icdapp LIGHTING_IO_SETTINGS 28 1 172 128 4 0 0
#nc3 if installed
if [[ $nano = 3 ]]; then
  $icdapp LIGHTING_IO_SETTINGS 29 1 160 256 4 0 0
  nap
  $icdapp LIGHTING_IO_SETTINGS 29 1 164 512 4 0 0
  nap
  $icdapp LIGHTING_IO_SETTINGS 29 1 168 1024 4 0 0
  nap
  $icdapp LIGHTING_IO_SETTINGS 29 1 172 2048  4 0 0 
fi
