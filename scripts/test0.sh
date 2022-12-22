#!/bin/bash
cp main_versions/Main0.hs app/Main.hs
stack build
mkdir outputs
mkdir eventlogs
mkdir outputs/0
mkdir eventlogs/0

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/0/1_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/0/1_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N1 2>&1 | tee -a outputs/0/1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c1.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/0/2_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/0/2_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N2 2>&1 | tee -a outputs/0/2_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c2.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/0/3_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/0/3_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N3 2>&1 | tee -a outputs/0/3_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c3.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/0/4_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/0/4_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N4 2>&1 | tee -a outputs/0/4_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c4.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/0/5_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/0/5_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N5 2>&1 | tee -a outputs/0/5_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c5.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/0/6_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/0/6_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N6 2>&1 | tee -a outputs/0/6_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c6.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/0/7_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/0/7_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N7 2>&1 | tee -a outputs/0/7_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c7.eventlog

stack exec movie-rec-par-exe 1 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/0/8_1.txt
stack exec movie-rec-par-exe 2 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/0/8_2.txt
stack exec movie-rec-par-exe 3 1 3 -- +RTS -ls -s -N8 2>&1 | tee -a outputs/0/8_3.txt
mv movie-rec-par-exe.eventlog eventlogs/m0_c8.eventlog
