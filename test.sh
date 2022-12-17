#!/bin/bash
# 1 core
stack exec movie-rec-par-exe -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1_1.txt
mv movie-rec-par-exe.eventlog eventlogs/1_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1_2.txt
mv movie-rec-par-exe.eventlog eventlogs/1_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1_3.txt
mv movie-rec-par-exe.eventlog eventlogs/1_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1_4.txt
mv movie-rec-par-exe.eventlog eventlogs/1_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N1 2>&1 | tee -a outputs/1_5.txt
mv movie-rec-par-exe.eventlog eventlogs/1_5.eventlog

# 2 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2_1.txt
mv movie-rec-par-exe.eventlog eventlogs/2_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2_2.txt
mv movie-rec-par-exe.eventlog eventlogs/2_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2_3.txt
mv movie-rec-par-exe.eventlog eventlogs/2_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2_4.txt
mv movie-rec-par-exe.eventlog eventlogs/2_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N2 2>&1 | tee -a outputs/2_5.txt
mv movie-rec-par-exe.eventlog eventlogs/2_5.eventlog

# 3 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N3 2>&1 | tee -a outputs/3_1.txt
mv movie-rec-par-exe.eventlog eventlogs/3_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N3 2>&1 | tee -a outputs/3_2.txt
mv movie-rec-par-exe.eventlog eventlogs/3_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N3 2>&1 | tee -a outputs/3_3.txt
mv movie-rec-par-exe.eventlog eventlogs/3_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N3 2>&1 | tee -a outputs/3_4.txt
mv movie-rec-par-exe.eventlog eventlogs/3_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N3 2>&1 | tee -a outputs/3_5.txt
mv movie-rec-par-exe.eventlog eventlogs/3_5.eventlog

# 4 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N4 2>&1 | tee -a outputs/4_1.txt
mv movie-rec-par-exe.eventlog eventlogs/4_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N4 2>&1 | tee -a outputs/4_2.txt
mv movie-rec-par-exe.eventlog eventlogs/4_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N4 2>&1 | tee -a outputs/4_3.txt
mv movie-rec-par-exe.eventlog eventlogs/4_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N4 2>&1 | tee -a outputs/4_4.txt
mv movie-rec-par-exe.eventlog eventlogs/4_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N4 2>&1 | tee -a outputs/4_5.txt
mv movie-rec-par-exe.eventlog eventlogs/4_5.eventlog

# 5 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N5 2>&1 | tee -a outputs/5_1.txt
mv movie-rec-par-exe.eventlog eventlogs/5_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N5 2>&1 | tee -a outputs/5_2.txt
mv movie-rec-par-exe.eventlog eventlogs/5_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N5 2>&1 | tee -a outputs/5_3.txt
mv movie-rec-par-exe.eventlog eventlogs/5_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N5 2>&1 | tee -a outputs/5_4.txt
mv movie-rec-par-exe.eventlog eventlogs/5_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N5 2>&1 | tee -a outputs/5_5.txt
mv movie-rec-par-exe.eventlog eventlogs/5_5.eventlog

# 6 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N6 2>&1 | tee -a outputs/6_1.txt
mv movie-rec-par-exe.eventlog eventlogs/6_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N6 2>&1 | tee -a outputs/6_2.txt
mv movie-rec-par-exe.eventlog eventlogs/6_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N6 2>&1 | tee -a outputs/6_3.txt
mv movie-rec-par-exe.eventlog eventlogs/6_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N6 2>&1 | tee -a outputs/6_4.txt
mv movie-rec-par-exe.eventlog eventlogs/6_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N6 2>&1 | tee -a outputs/6_5.txt
mv movie-rec-par-exe.eventlog eventlogs/6_5.eventlog

# 7 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N7 2>&1 | tee -a outputs/7_1.txt
mv movie-rec-par-exe.eventlog eventlogs/7_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N7 2>&1 | tee -a outputs/7_2.txt
mv movie-rec-par-exe.eventlog eventlogs/7_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N7 2>&1 | tee -a outputs/7_3.txt
mv movie-rec-par-exe.eventlog eventlogs/7_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N7 2>&1 | tee -a outputs/7_4.txt
mv movie-rec-par-exe.eventlog eventlogs/7_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N7 2>&1 | tee -a outputs/7_5.txt
mv movie-rec-par-exe.eventlog eventlogs/7_5.eventlog

# 8 cores
stack exec movie-rec-par-exe -- +RTS -ls -s -N8 2>&1 | tee -a outputs/8_1.txt
mv movie-rec-par-exe.eventlog eventlogs/8_1.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N8 2>&1 | tee -a outputs/8_2.txt
mv movie-rec-par-exe.eventlog eventlogs/8_2.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N8 2>&1 | tee -a outputs/8_3.txt
mv movie-rec-par-exe.eventlog eventlogs/8_3.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N8 2>&1 | tee -a outputs/8_4.txt
mv movie-rec-par-exe.eventlog eventlogs/8_4.eventlog
stack exec movie-rec-par-exe -- +RTS -ls -s -N8 2>&1 | tee -a outputs/8_5.txt
mv movie-rec-par-exe.eventlog eventlogs/8_5.eventlog
