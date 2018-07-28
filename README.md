# Getting and Cleaning Data Course Project

### This is the **Final Project** for the Coursera course `Getting and Cleaning Data`

This Project has a R Program called `run_analysis.R` which does the following steps -
> `UCI HAR Dataset` should be inside the working directory
1. **Loads** all the `Features`
2. **Loads** and **Merges**, `Subject Dataset`,`Activity Dataset`,`Variable Dataset` from *Train*
3. **Loads** and **Merges**, `Subject Dataset`,`Activity Dataset`,`Variable Dataset` from *Test*
4. **Merges** *Train* and *Test* to `Total Dataset`
5. **Extracts** needed features(Mean,Features) from the `Total Dataset`
6. Calculates **Average** for each **Subject** per **Activity** for every **Variable**
7. Saves the **Tidy** Data to `tidy_data.txt` file
