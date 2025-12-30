# Quick Start: Push opinions-framework to GitHub

This is a quick reference for pushing the extracted opinions-framework repository to GitHub.

## Prerequisites

✅ Completed:
- Repository extraction with full history (24 commits)
- README and documentation added
- Tarball created for easy transfer

⚠️ Required (Manual):
- GitHub repository `jayers99/opinions-framework` must be created
- GitHub authentication configured (SSH keys or Personal Access Token)

## Three Methods to Push

### Method 1: Extract from Tarball (Recommended for transfer)

```bash
# 1. Extract the tarball
tar -xzf opinions-framework-extracted.tar.gz
cd opinions-framework

# 2. Add GitHub remote (use SSH or HTTPS)
# For SSH:
git remote add origin git@github.com:jayers99/opinions-framework.git
# OR for HTTPS:
git remote add origin https://github.com/jayers99/opinions-framework.git

# 3. Push to GitHub
git push -u origin main
```

### Method 2: Use the Helper Script

```bash
# Interactive script with prompts
./push-extracted-repo.sh
```

The script will:
- Verify repository integrity
- Show commit summary
- Prompt for remote URL type (HTTPS/SSH)
- Confirm before pushing
- Push all commits and tags

### Method 3: Use Directory Directly

```bash
# Navigate to extracted repository
cd extracted-repos/opinions-framework

# Add GitHub remote
git remote add origin https://github.com/jayers99/opinions-framework.git

# Push to GitHub
git push -u origin main
```

## Create GitHub Repository First

Before using any method, create the repository:

1. Go to: https://github.com/new
2. Settings:
   - **Owner**: jayers99
   - **Repository name**: opinions-framework
   - **Description**: "Opinions Framework for Praxis AI - structured guidance for each Domain × Lifecycle Stage"
   - **Visibility**: Public
   - **Important**: DO NOT initialize with README, .gitignore, or license
3. Click "Create repository"

## Authentication Options

### SSH (Recommended)
```bash
git remote add origin git@github.com:jayers99/opinions-framework.git
```
Requires: SSH key configured in GitHub settings

### HTTPS with Personal Access Token
```bash
git remote add origin https://github.com/jayers99/opinions-framework.git
```
**Requires**: Personal Access Token (PAT) with `repo` scope
- **Create token**: https://github.com/settings/tokens/new
- **Scopes needed**: Check `repo` (Full control of private repositories)
- **When prompted for password**: Use your PAT instead of GitHub password

## Verify After Push

Visit https://github.com/jayers99/opinions-framework and check:
- ✓ 24 commits are present
- ✓ All files visible: README.md, praxis.yaml, docs/, .gitignore
- ✓ README renders correctly
- ✓ Commit history shows original authors and messages

## What Gets Pushed

- **24 commits** with full history
- **All files**:
  - README.md (project documentation)
  - praxis.yaml (configuration)
  - docs/ (framework documentation with stories and research)
  - .gitignore (repository settings)
- **Original commit metadata**:
  - Authors preserved
  - Timestamps preserved
  - Commit messages intact

## Troubleshooting

**"fatal: repository not found"**
- Ensure you created the GitHub repository first
- Check the repository name is exactly `opinions-framework`
- Verify you have access to create repos under `jayers99`

**"Permission denied"**
- For SSH: Verify SSH key is added to your GitHub account
- For HTTPS: Use a Personal Access Token instead of password

**"Updates were rejected"**
- The GitHub repo should be completely empty (no README, no initial commit)
- If it has content, delete and recreate it empty

## Next Steps After Push

1. **Add repository description** on GitHub
2. **Add topics**: praxis, documentation, framework, ai-governance
3. **Configure settings**: Enable Issues, Discussions if needed
4. **Update praxis-ai repo**: Remove or reference the extracted directory

## Need Help?

See the detailed guides:
- `EXTRACTION_GUIDE.md` - Complete extraction process documentation
- `EXTRACTION_SUMMARY.md` - Summary of what was done
- `push-extracted-repo.sh` - Interactive push script

---

**Ready to push?** Choose a method above and execute the commands. The repository is ready!
