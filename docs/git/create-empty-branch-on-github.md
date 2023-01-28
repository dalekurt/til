# Create empty branch on GitHub

Create empty branches with no prior history.

```bash
git switch --orphan <new branch>
git commit --allow-empty -m "Initial commit on orphan branch"
git push -u origin <new branch>
```
