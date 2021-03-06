# build-sites

Automatically deploy software to our vServer.

## Scripts

Create executable (`chmod a+x`) script which calls `deploy-web.sh`.

### git-fetch.sh

Purpose: Download all files from Bitbucket to a local git repo.

_This is now done with bitbucket pipelines! Add code here! And update documentation!_

### deploy-web.sh

Purpose: Copy all files from bitbucket to local website directory (`/var/www`). 

The script `deploy-web.sh` clones from GitHub into the webroot directory.

Call this script with the GitHub repository and the website directory. Example: `deploy-web.sh git@github.com:USERNAME/REPOSITORY.git /var/www/WEBSITE deploy_branch`


## Deploy

### Deploy manually

Call the build script on server eg: `./spamty.website.sh`


### Webhooks

*Webhooks are currently not working because now on bitbucket! Deploy manually!*

The software webhooks <https://github.com/adnanh/webhook> allows us to create HTTP endpoints (hooks) on the server, which can be used to execute configured commands.

#### Configuration

The hooks are defined in *webhooks.json* file. Example:

```
[
  {
    "id": "HOOK_NAME",
    "execute-command": "/var/build-sites/SCRIPT.sh",
    "command-working-directory": "/var/build-sites",
    "response-message": "Hook running",
    "trigger-rule":
    {
          "match":
          {
            "type": "payload-hash-sha1",
            "secret": "XXXXXXXXX",
            "parameter":
            {
              "source": "header",
              "name": "X-Hub-Signature"
            }
          }
    }
  }
]
```

The "secret" can be defined in GitHub (*Webhooks / Add webhook / Secret*) to validate the request.

#### Running

The software has to run in background. We change the URL prefix (`-urlprefix` option) and port (`-port` option).

```
nohup ~/go/bin/webhook -hooks webhooks.json -verbose -urlprefix webhooks -port 9419 -ip "84.200.76.123" -hotreload -cert "/etc/letsencrypt/live/webhooks-spamty/cert.pem" -key "/etc/letsencrypt/live/webhooks-spamty/priv.pem" -secure >output.log 2>error.log &
```

### Git Hook

The Git hooks do only work if we have an own git server but not with bitbucket or GitHub (use Webhooks in this case)!

This script (see section above) has to be called automatically everytime a push is send to the repository.

We need a link in hooks folder with the name `post-receive` to the script:

    ln -s /var/build-sites/SCRIPT.sh /var/git/REPOSITORY.git/hooks/post-receive

This will be triggered when the repository is updated and deploys the site to web directory.
The post-receive hook runs after the entire process is completed and can be used to update other services or notify users.

* <https://git-scm.com/book/uz/v2/Customizing-Git-Git-Hooks> (Git Hooks)
* <https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks>
* <http://githooks.com>
* <https://wiki.ubuntuusers.de/ln/> (Symbolic links)
