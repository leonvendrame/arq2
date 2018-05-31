#!/bin/bash
GEM5_CDIR=~/General/gem5/

# Exemplo: GEM5_CDIR=~/General/gem5/
# O diretório deve ser passado por completo e não de forma relativa,
# visto que para alguns algoritmos é necessario estar nas pastas de entrada.
# Note que como no exemplo, deve ser colocado a barra no final do diretorio.

GEM5_MODE=build/X86/gem5.fast
OUT_DIRNAME=out_files

$GEM5_CDIR$GEM5_MODE -d 1/$OUT_DIRNAME/tournament machine.py -b tournament -p 1/nbench
$GEM5_CDIR$GEM5_MODE -d 1/$OUT_DIRNAME/ltage machine.py -b ltage -p 1/nbench
$GEM5_CDIR$GEM5_MODE -d 1/$OUT_DIRNAME/local machine.py -b local -p 1/nbench
$GEM5_CDIR$GEM5_MODE -d 1/$OUT_DIRNAME/bimode machine.py -b bimode -p 1/nbench

cd 2/
$GEM5_CDIR$GEM5_MODE -d $OUT_DIRNAME/tournament ../machine.py -b tournament -p a.out -a 1.dat
$GEM5_CDIR$GEM5_MODE -d $OUT_DIRNAME/ltage ../machine.py -b ltage -p a.out -a 1.dat
$GEM5_CDIR$GEM5_MODE -d $OUT_DIRNAME/local ../machine.py -b local -p a.out -a 1.dat
$GEM5_CDIR$GEM5_MODE -d $OUT_DIRNAME/bimode ../machine.py -b bimode -p a.out -a 1.dat
cd ../

$GEM5_CDIR$GEM5_MODE -d 3/$OUT_DIRNAME/tournament machine.py -b tournament -p 3/floyd-warshall
$GEM5_CDIR$GEM5_MODE -d 3/$OUT_DIRNAME/ltage machine.py -b ltage -p 3/floyd-warshall
$GEM5_CDIR$GEM5_MODE -d 3/$OUT_DIRNAME/local machine.py -b local -p 3/floyd-warshall
$GEM5_CDIR$GEM5_MODE -d 3/$OUT_DIRNAME/bimode machine.py -b bimode -p 3/floyd-warshall

$GEM5_CDIR$GEM5_MODE -d 4/$OUT_DIRNAME/tournament machine.py -b tournament -p 4/flops-8
$GEM5_CDIR$GEM5_MODE -d 4/$OUT_DIRNAME/ltage machine.py -b ltage -p 4/flops-8
$GEM5_CDIR$GEM5_MODE -d 4/$OUT_DIRNAME/local machine.py -b local -p 4/flops-8
$GEM5_CDIR$GEM5_MODE -d 4/$OUT_DIRNAME/bimode machine.py -b bimode -p 4/flops-8

cd 5/input_base/
$GEM5_CDIR$GEM5_MODE -d ../$OUT_DIRNAME/tournament ../../machine.py -b tournament -p ../mpeg2/src/mpeg2enc/mpeg2encode -a input_base_4CIF_96bps_15.par\ ../output_base/output_base_4CIF_96bps_15.mpg
$GEM5_CDIR$GEM5_MODE -d ../$OUT_DIRNAME/ltage ../../machine.py -b ltage -p ../mpeg2/src/mpeg2enc/mpeg2encode -a input_base_4CIF_96bps_15.par\ ../output_base/output_base_4CIF_96bps_15.mpg
$GEM5_CDIR$GEM5_MODE -d ../$OUT_DIRNAME/local ../../machine.py -b local -p ../mpeg2/src/mpeg2enc/mpeg2encode -a input_base_4CIF_96bps_15.par\ ../output_base/output_base_4CIF_96bps_15.mpg
$GEM5_CDIR$GEM5_MODE -d ../$OUT_DIRNAME/bimode ../../machine.py -b bimode -p ../mpeg2/src/mpeg2enc/mpeg2encode -a input_base_4CIF_96bps_15.par\ ../output_base/output_base_4CIF_96bps_15.mpg
cd ../../