# A movie recommendation system with Haskell
## Introduction
This is the final project of COMS4995 Parallel Functional Programming at Columbia University.

## Files
```
| -- app 
|    |--- Main.hs
| -- src
|    |--- CFDataStructures.hs
|    |--- CFLib.hs
|    |--- IOUtils.hs
|    |--- SimilarityLib.hs  
| -- scripts
|    |--- main0.hs
|    |--- main1.hs
|    |--- main2.hs
|    |--- rmse.hs
| -- matrix_files
|    |--- mc
|    |--- original
| -- main_versions
|    |--- Main0.hs
|    |--- Main1.hs
|    |--- Main2.hs
|    |--- getRMSE.hs

```
- The matrix_files folder contains two folders
    - `original`: text files for the original utiltiy matrices
    - `mc`: text files for the mean-centered utility matrices
- main_versions: 
    - Contains different versions of main. You can run them with the build scripts in `scripts/`

# How to run the programs
- There are three versions (sequential, parList, parListChunk)
- To run the sequential version:
    - Build
    ```
    $ ./scripts/build0.sh
    ```
    - Example usage
    ```
    stack exec movie-rec-par-exe $userId $rec-num $predict-num -- +RTS -ls -s -N1
    ```

- To run the parList version:
    - Build
    ```
    $ ./scripts/build1.sh
    ```
    - Example usage
    ```
    stack exec movie-rec-par-exe $userId $rec-num $predict-num -- +RTS -ls -s -N1
    ```
    
- To run the parListChunk version
    - Build
    ```
    $ ./scripts/build2.sh
    ```
    - Example usage
    ```
    stack exec movie-rec-par-exe $userId $rec-nun $predict-num $chunk-size -- +RTS -ls -s -N1 2>&1 | tee -a outputs/2/1_1000_1.txt
    ```

