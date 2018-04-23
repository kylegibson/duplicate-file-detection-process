# duplicate-file-detection-process

## Step 1 - Generate SHA224 Hash Report

```
bash step_1_generate_hash_report.sh <directory> | tee step-1.log
```

Calculate the sha224 digest for the first 16KB of all files in a specified
directory.

## Step 2 - Find Partial Duplicates

Group files together by digest.

```
bash step_2_find_partial_duplicates.sh step-1.log | tee step-2.log
```

## Step 3 - Verify duplicates

Calculate the sha224 digest for all the files detected in step 2.

```
bash step_3_verify_duplicates.sh step-2.log | tee step-3.log
```

## Step 4 - Group Duplicates

Group duplicates in a way that makes it easier to manually go line by
line.

```
python step_4_group_dupes.py step-3.log | tee step-4.log
```

1. Open `step-4.log`
2. Remove the lines for the files you want to **keep**.

## Step 5 - Move files

Move all files in `step-4.log` to another directory,
while preserving the directory structure.

```
mkdir dupes
bash step_5_move_files.sh dupes step-4.log
```
