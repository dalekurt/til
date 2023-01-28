# How to deploy MkDocs to GitHub Pages

I'm using Obsidian + MkDocs + GitHub to make my notes public. 

## Getting started

1. Create a new github repository
2. Clone the repository into your Obsidian folder/vault.
3. Create mkdocs
	```bash
	cd repo-name
	mkdocs new .
	```
	
4. Create or move your notes you would like to make public to the `repo-name/docs`
5. [Create an empty branch on your GitHub repository](../git/create-empty-branch-on-github.md) 
6. On your GitHub reposito, go to `Settings > Pages` and select the select the **Source** as your `gh-pages` branch.

```
INFO - Copying '/home/runner/work/til/til/site' to 'gh-pages' branch and pushing to GitHub.

remote: Permission to dalekurt/til.git denied to github-actions[bot].
```

![[github-workflow-permissions.png]]
