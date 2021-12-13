dir=$HOME/local/bin

mkdir -p $dir

# rsync -av  --include '*' --exclude '.git' --exclude='.*.swp' --exclude '*~' . $dir/
rsync -av  --cvs-exclude --exclude='.*.swp' --exclude install.sh . $dir/
