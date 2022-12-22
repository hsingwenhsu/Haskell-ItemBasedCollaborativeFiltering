#!/bin/bash
cp main_versions/getRMSE.hs app/Main.hs
stack build
mkdir rmse_data
stack run u1 3 > rmse_data/1_3.txt
stack run u2 3 > rmse_data/2_3.txt
stack run u3 3 > rmse_data/3_3.txt
stack run u4 3 > rmse_data/4_3.txt
stack run u5 3 > rmse_data/5_3.txt
