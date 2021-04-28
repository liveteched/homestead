### The modified Livetech box based on Homestead

- Back up DBs (mysql or even mongo and crate) and then run vagrant destroy
- Back up your aliases, if you have any because this will overwrite them
- `git remote add livetech git@github.com:liveteched/homestead.git` and checkout the main branch
- Update Homestead.yml as per the Homestead.yml.example
- Check to see if you have missing sites in the Homestead.yml file and manually update them
- Ensure Homestead.yml entries have your Sites/code/Code directory in the paths 
- Check that the nginx-configs directory uses your project path at the top (Sites/code/Code)
- Run `vagrant up`

### Customization
If you want to customize something to your liking, create a `user-customizations.sh` file in your Homestead directory on your host machine (Macbook) and run `vagrant reload --provision` to apply the changes
