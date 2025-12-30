# Opinions Framework Repository Extraction Guide

This guide documents the process of extracting the `opinions-framework` directory from the `jayers99/praxis-ai` repository into its own standalone repository with preserved git history.

## Overview

The `projects/write/opinions-framework/` directory has been successfully extracted from the praxis-ai repository using `git-filter-repo`. The extracted repository is ready to be pushed to a new GitHub repository.

## What Was Done

### 1. Extraction Process

The extraction was performed using `git-filter-repo`, which:
- Cloned the source repository (`jayers99/praxis-ai`)
- Filtered the history to keep only commits affecting `projects/write/opinions-framework/`
- Rewrote the repository structure to move files from the subdirectory to the root
- Preserved all 19 commits (plus merge commits) that touched this directory

### 2. Repository Preparation

The extracted repository includes:
- **All original files**: `docs/`, `praxis.yaml`
- **New README.md**: Comprehensive documentation of the project
- **New .gitignore**: Appropriate ignore patterns for a documentation repository
- **Preserved history**: All commits from the original repository

### 3. Location

The extracted repository is available in two formats:

1. **Directory format**: `extracted-repos/opinions-framework/` (included in this repository)
2. **Tarball format**: `opinions-framework-extracted.tar.gz` (for easy transfer and extraction)

To extract from the tarball:
```bash
tar -xzf opinions-framework-extracted.tar.gz
cd opinions-framework
```

## Next Steps: Creating the GitHub Repository

Since this automated process cannot create GitHub repositories directly, follow these manual steps:

### Step 1: Create the GitHub Repository

1. Go to https://github.com/new
2. Set the following:
   - **Owner**: jayers99
   - **Repository name**: opinions-framework
   - **Description**: "Opinions Framework for Praxis AI - structured guidance for each Domain × Lifecycle Stage"
   - **Visibility**: Public (as specified in praxis.yaml)
   - **Initialize**: DO NOT initialize with README, .gitignore, or license (we have these already)

### Step 2: Push the Extracted Repository

From your local machine or a secure environment with GitHub credentials:

**Option A - Extract from tarball first**:
```bash
# Extract the tarball
tar -xzf opinions-framework-extracted.tar.gz
cd opinions-framework

# Add the new GitHub repository as remote
git remote add origin https://github.com/jayers99/opinions-framework.git

# Push all branches and history
git push -u origin main

# Push all tags (if any)
git push --tags
```

**Option B - Use the directory directly**:
```bash
# Navigate to the extracted repository
cd extracted-repos/opinions-framework

# Add the new GitHub repository as remote
git remote add origin https://github.com/jayers99/opinions-framework.git

# Push all branches and history
git push -u origin main

# Push all tags (if any)
git push --tags
```

**Option C - Use the provided helper script**:
```bash
# Runs interactive prompts and handles the push process
./push-extracted-repo.sh
```

### Step 3: Verify the Repository

1. Visit https://github.com/jayers99/opinions-framework
2. Verify that:
   - All files are present (`docs/`, `praxis.yaml`, `README.md`, `.gitignore`)
   - Git history shows 24 commits (19 original + merge commits + 2 new commits for README and .gitignore)
   - The commit history matches the original (use `git log` to compare)

### Step 4: Update the Parent Repository

After successfully creating the new repository, the `projects/write/opinions-framework/` directory can be removed from the `praxis-ai` repository and optionally replaced with:

1. A README reference pointing to the new repository, or
2. A git submodule reference (if needed)

## Repository Details

### Extracted Content

- **Domain**: Write
- **Stage**: Capture  
- **Privacy Level**: Public
- **Environment**: Home

### File Structure

```
opinions-framework/
├── .git/               # Full git history (24 commits)
├── .gitignore          # Ignore patterns
├── README.md           # Project documentation
├── praxis.yaml         # Project configuration
└── docs/               # Framework documentation
    ├── capture.md
    ├── opinions-contract-draft.md
    ├── 00-prerequisites/
    ├── 04-define-opinion-structure-story.md
    ├── 05-tracer-bullet-story.md
    ├── 06-document-process-story.md
    ├── 07-validate-render-run-story.md
    └── brain-dump-dictation.txt
```

### Git History Summary

The repository preserves 19 commits from the original repository:

- Initial project creation (9d0e863)
- Lifecycle and domain research spikes
- Merge commits from various feature branches
- Documentation reorganization
- Opinion contract drafts
- Recent brain dump and structure documentation

Plus 2 new commits:
- README addition
- .gitignore addition

## Verification Commands

To verify the extraction was successful:

```bash
# Check commit count
cd extracted-repos/opinions-framework
git log --oneline | wc -l
# Should show 24 commits

# Check file structure
ls -la
# Should show: .git/, docs/, .gitignore, praxis.yaml, README.md

# Check history preservation
git log --oneline
# Should show commits from praxis-ai with opinion-framework related messages

# Verify no uncommitted changes
git status
# Should be clean
```

## Troubleshooting

### If push fails with authentication error:
- Ensure you have proper GitHub credentials configured
- Use SSH instead: `git remote set-url origin git@github.com:jayers99/opinions-framework.git`
- Or use a Personal Access Token (PAT) with appropriate permissions

### If you need to re-extract:
The extraction script and process are documented in this repository and can be re-run if needed.

## Technical Details

### Tools Used
- **git-filter-repo** (v2.47.0): Modern tool for rewriting git history
- **git**: Version control

### Alternative Approach
If `git-filter-repo` is not available, you can use `git subtree split`:

```bash
cd /path/to/praxis-ai
git subtree split --prefix=projects/write/opinions-framework --branch opinions-framework-split
git checkout opinions-framework-split
# Then push to new repository
```

However, `git-filter-repo` is the recommended approach as it's more robust and handles edge cases better.

## References

- Source repository: https://github.com/jayers99/praxis-ai
- Original path: `projects/write/opinions-framework/`
- git-filter-repo documentation: https://github.com/newren/git-filter-repo
