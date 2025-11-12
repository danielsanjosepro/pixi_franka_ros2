#!/bin/bash

# Script to apply patches by copying files from patches/ to src/

set -e  # Exit on error

PATCHES_DIR="patches"
SRC_DIR="src"

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Applying patches from ${PATCHES_DIR}/ to ${SRC_DIR}/"
echo "================================================"

# Check if patches directory exists
if [ ! -d "${PATCHES_DIR}" ]; then
    echo -e "${RED}Error: ${PATCHES_DIR}/ directory not found${NC}"
    exit 1
fi

# Iterate through each repository in patches/
for repo in "${PATCHES_DIR}"/*; do
    if [ -d "${repo}" ]; then
        repo_name=$(basename "${repo}")
        target_dir="${SRC_DIR}/${repo_name}"

        # Check if target repository exists
        if [ ! -d "${target_dir}" ]; then
            echo -e "${YELLOW}Warning: Target directory ${target_dir}/ not found, skipping ${repo_name}${NC}"
            continue
        fi

        echo -e "${GREEN}Processing ${repo_name}...${NC}"

        # Find all files in the patch directory and copy them
        while IFS= read -r -d '' file; do
            # Get relative path from patches/repo_name/
            relative_path="${file#${repo}/}"
            target_file="${target_dir}/${relative_path}"
            target_file_dir=$(dirname "${target_file}")

            # Create target directory if it doesn't exist
            mkdir -p "${target_file_dir}"

            # Copy the file
            cp "${file}" "${target_file}"
            echo "  Copied: ${relative_path}"
        done < <(find "${repo}" -type f -print0)
    fi
done

echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}Patches applied successfully!${NC}"
