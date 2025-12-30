#!/bin/bash

# Script to push the extracted opinions-framework repository to GitHub
# 
# Prerequisites:
# 1. GitHub repository jayers99/opinions-framework must be created
# 2. GitHub credentials must be configured (SSH or HTTPS with PAT)
#
# Usage:
#   ./push-extracted-repo.sh

set -e

REPO_DIR="extracted-repos/opinions-framework"
GITHUB_OWNER="jayers99"
GITHUB_REPO="opinions-framework"

echo "======================================"
echo "Opinions Framework Repository Push"
echo "======================================"
echo ""

# Check if extracted repository exists
if [ ! -d "$REPO_DIR" ]; then
    echo "❌ Error: Extracted repository not found at $REPO_DIR"
    echo "Please ensure the extraction process completed successfully."
    exit 1
fi

cd "$REPO_DIR"

# Verify we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: $REPO_DIR is not a git repository"
    exit 1
fi

# Check current git status
echo "📊 Repository status:"
git status --short
echo ""

# Verify we're on main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Warning: Current branch is '$CURRENT_BRANCH', not 'main'"
    echo "Switching to main branch..."
    git checkout main
fi

# Show commit history summary
COMMIT_COUNT=$(git log --oneline | wc -l)
echo "📝 Total commits: $COMMIT_COUNT"
echo ""
echo "Recent commits:"
git log --oneline -5
echo ""

# Check if origin remote exists
if git remote get-url origin &> /dev/null; then
    CURRENT_ORIGIN=$(git remote get-url origin)
    echo "⚠️  Warning: Remote 'origin' already exists: $CURRENT_ORIGIN"
    echo ""
    read -p "Do you want to replace it? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote remove origin
        echo "✓ Removed existing origin"
    else
        echo "❌ Cancelled. Please remove or rename the existing remote manually."
        exit 1
    fi
fi

# Prompt for remote URL preference
echo ""
echo "Choose remote URL type:"
echo "  1) HTTPS (recommended for token authentication)"
echo "  2) SSH (recommended for SSH key authentication)"
echo ""
read -p "Enter choice (1 or 2): " -n 1 -r
echo ""

if [[ $REPLY == "1" ]]; then
    REMOTE_URL="https://github.com/${GITHUB_OWNER}/${GITHUB_REPO}.git"
elif [[ $REPLY == "2" ]]; then
    REMOTE_URL="git@github.com:${GITHUB_OWNER}/${GITHUB_REPO}.git"
else
    echo "❌ Invalid choice. Exiting."
    exit 1
fi

# Add remote
echo "Adding remote: $REMOTE_URL"
git remote add origin "$REMOTE_URL"
echo "✓ Remote added"
echo ""

# Confirm before pushing
echo "⚠️  Ready to push to: $REMOTE_URL"
echo ""
echo "This will:"
echo "  - Push all commits ($COMMIT_COUNT total)"
echo "  - Push the main branch"
echo "  - Push any tags (if present)"
echo ""
read -p "Continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Push cancelled."
    exit 1
fi

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo ""

# Push main branch
git push -u origin main

# Push tags if any exist
TAG_COUNT=$(git tag | wc -l)
if [ "$TAG_COUNT" -gt 0 ]; then
    echo ""
    echo "📦 Pushing $TAG_COUNT tag(s)..."
    git push --tags
fi

echo ""
echo "======================================"
echo "✅ Successfully pushed to GitHub!"
echo "======================================"
echo ""
echo "Repository URL: https://github.com/${GITHUB_OWNER}/${GITHUB_REPO}"
echo ""
echo "Next steps:"
echo "  1. Visit the repository on GitHub"
echo "  2. Verify all files and history are present"
echo "  3. Consider adding repository description and topics"
echo "  4. Update the parent repository (praxis-ai) to remove or reference this directory"
echo ""
