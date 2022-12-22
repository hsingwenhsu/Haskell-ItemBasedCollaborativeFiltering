#!/bin/bash
cp main_versions/Main2.hs app/Main.hs
stack build

mkdir outputs
mkdir eventlogs
mkdir outputs/2
mkdir eventlogs/2

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_1_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2/2_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_2_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/2/3_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_3_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/2/4_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_4_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/2/5_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_5_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/2/6_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_6_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/2/7_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_7_100000.eventlog

stack exec movie-rec-par-exe 1 1 3 1 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1_1.txt
stack exec movie-rec-par-exe 2 1 3 1 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1_2.txt
stack exec movie-rec-par-exe 3 1 3 1 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_1.eventlog

stack exec movie-rec-par-exe 1 1 3 10 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10_1.txt
stack exec movie-rec-par-exe 2 1 3 10 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10_2.txt
stack exec movie-rec-par-exe 3 1 3 10 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_10.eventlog

stack exec movie-rec-par-exe 1 1 3 100 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100_1.txt
stack exec movie-rec-par-exe 2 1 3 100 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100_2.txt
stack exec movie-rec-par-exe 3 1 3 100 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_100.eventlog

stack exec movie-rec-par-exe 1 1 3 1000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1000_1.txt
stack exec movie-rec-par-exe 2 1 3 1000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1000_2.txt
stack exec movie-rec-par-exe 3 1 3 1000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_1000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_1000.eventlog

stack exec movie-rec-par-exe 1 1 3 10000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10000_1.txt
stack exec movie-rec-par-exe 2 1 3 10000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10000_2.txt
stack exec movie-rec-par-exe 3 1 3 10000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_10000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_10000.eventlog

stack exec movie-rec-par-exe 1 1 3 100000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100000_1.txt
stack exec movie-rec-par-exe 2 1 3 100000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100000_2.txt
stack exec movie-rec-par-exe 3 1 3 100000 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/2/8_100000_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m2_8_100000.eventlog