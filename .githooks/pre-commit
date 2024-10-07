#!/usr/bin/env bash

# Initialize variables
BRANCH_DEST=master
FOLDERS_TO_CHECK=("lib" "test")

# Check if dart is available
if command -v dart &> /dev/null
then
	DART_COMMAND="dart"
else
	echo "Error: Failed to find dart in your path"
	exit 1
fi

# Check if flutter is available
if command -v flutter &> /dev/null
then
	FLUTTER_COMMAND="flutter"
else
	echo "Error: Failed to find flutter in your path"
	exit 1
fi


DART_FORMAT_COMMAND="${DART_COMMAND} format -l 80"
ANALYZE_COMMAND="${FLUTTER_COMMAND} analyze"

# Initialize empty strings to store files that fail formatting
FILES_NEEDING_FORMAT=""
FILES_WITH_ANALYSIS_ISSUES=""

# Get changed files from git
CHANGED_FILES=$(git diff --name-only origin/${BRANCH_DEST})
GIT_DIFF_EXIT_CODE=$?
if [ $GIT_DIFF_EXIT_CODE -ne 0 ]; then
    echo "Error: Failed to execute git diff"
    exit $GIT_DIFF_EXIT_CODE
fi

# Exit early if no files have changed
if [ -z "$CHANGED_FILES" ]; then
    echo "No files have changed."
    exit 0
fi

# Check each changed file for formatting and analysis issues
for FOLDER in "${FOLDERS_TO_CHECK[@]}"
do
    for FILE in $(echo "${CHANGED_FILES}" | grep "${FOLDER}.*.dart$")
    do
        # Check for formatting issues
        ${DART_FORMAT_COMMAND} -o none --show none --set-exit-if-changed "${FILE}"
        FORMAT_EXIT_CODE=$?
        if [ $FORMAT_EXIT_CODE -ne 0 ]; then
            FILES_NEEDING_FORMAT="${FILES_NEEDING_FORMAT}\n$FILE"
        fi

        # Check for analysis issues
        ${ANALYZE_COMMAND} "${FILE}" --fatal-infos --fatal-warnings
        ANALYZE_EXIT_CODE=$?
        if [ $ANALYZE_EXIT_CODE -ne 0 ]; then
            FILES_WITH_ANALYSIS_ISSUES="${FILES_WITH_ANALYSIS_ISSUES}\n$FILE"
        fi
    done
done

# Report formatting issues
if [ ! -z "$FILES_NEEDING_FORMAT" ]; then
    echo -e "\nThe following files need formatting:\n$FILES_NEEDING_FORMAT\n"
fi

# Report analysis issues
if [ ! -z "$FILES_WITH_ANALYSIS_ISSUES" ]; then
    echo -e "\nThe following files have analysis issues:\n$FILES_WITH_ANALYSIS_ISSUES\n"
fi

# If any issues are found, exit with error code
if [ ! -z "$FILES_NEEDING_FORMAT" ] || [ ! -z "$FILES_WITH_ANALYSIS_ISSUES" ]; then
    exit 1
else
    echo "No formatting or analysis issues found in the changed files."
    exit 0
fi
