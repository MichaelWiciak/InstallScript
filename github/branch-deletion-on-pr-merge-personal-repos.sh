gh repo list MichaelWiciak --source: --json name -q '.[].name' | while read repo; do
  if [ "$(gh api repos/MichaelWiciak/$repo --jq '.delete_branch_on_merge')" = "false" ]; then
    echo "Enabling auto-delete for $repo..."
    gh repo edit "MichaelWiciak/$repo" --delete-branch-on-merge
  fi
done
