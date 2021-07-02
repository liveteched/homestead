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

### Running:
To run octane you will have to run `php artisan octane:start --watch --host=0.0.0.0` from within your homestead box
and then visit http://qevin.test:8000 not http://qevin.test . 8000 is octane, no port is php-fpm (unless you change your nginx config to always use octane, we don’t because we didn’t need to, because for dev it makes the flow a bit sucky, you always have to run octane before opening the site. This way if we want to check something quick, we don’t have to run octane. But maybe we should set up a supervisor task for it someday in our homestead box).

If you end up wanting to also run websockets and horizon for some reason, horizon will just be php artisan horizon, but websockets need to run on port 6002 since we introduced octane. So you would run `php artisan websockets:serve --port=6002`  and also ensure the nginx config uses the 6002 for ws, instead of 6001

if you don’t want to use your local crate instance, there’s copy (from July 2 2021) of production crate - just set this in your .env CRATE_DB_HOST=3.235.180.130
