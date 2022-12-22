#!/bin/bash
cp main_versions/Main1.hs app/Main.hs
stack build
mkdir outputs
mkdir eventlogs
mkdir outputs/1
mkdir eventlogs/1

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1/1_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1/1_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1/1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c1.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/1/2_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/1/2_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/1/2_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c2.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/1/3_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/1/3_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/1/3_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c3.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/1/4_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/1/4_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/1/4_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c4.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/1/5_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/1/5_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/1/5_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c5.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/1/6_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/1/6_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/1/6_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c6.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/1/7_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/1/7_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/1/7_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c7.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/1/8_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/1/8_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/1/8_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m1_c8.eventlog
