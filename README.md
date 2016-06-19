# build-sites

Automatically deploy software to our vServer. 

## Install Jekyll

Jekyll is required on vServer for some websites.

* <http://lc3dyr.de/blog/2012/07/22/Jekyll-auf-Uberspace/>
* <http://www.wittistribune.com/jekyll-auf-uberspace-mit-git>

## Deploy sites

Create executable (`chmod a+x`) script to clone git repository from bitbucket and build site (with Jekyll).

* <http://oldarticles.kahlil.co/2011/07/24/uberkyll/> (Original script)
* <https://gist.github.com/philipp-r/a07009762dea99929784> (My modification to work with current Jekyll version)
* <http://jekyllrb.com/docs/usage/> (Jekyll docs)

## Deploy

### Webhooks

Bitbucket calls PHP script on Server. This script executes a command in shell to deploy the site.

```
shell_exec("/var/build-sites/spamty.website.sh");
```

### Git Hook

The Git hooks do only work if we have an own git server (gogs) but not with bitbucket!

This script (see section above) has to be called automatically everytime a push is send to the repository.

We need a link in hooks folder with the name `post-receive` to the script:

    ln -s ~/build-sites/SCRIPT.sh ~/gogs-repositories/USERNAME/REPOSITORY.git/hooks/post-receive

This will be triggered when the repository is updated and deploys the site to web directory.

>The post-receive hook runs after the entire process is completed and can be used to update other services or notify users.

* <https://git-scm.com/book/uz/v2/Customizing-Git-Git-Hooks> (Git Hooks)
* <https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks>
* <http://githooks.com>
* <https://wiki.ubuntuusers.de/ln/> (Symbolic links)

### Deploy manually

Call the build script on server eg: `./spamty.website.sh` 