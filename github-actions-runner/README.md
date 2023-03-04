# GitHub Actions runner
Make your home-assistant usefull and save money on Github.

## Setup guide

## Step 0
Install this addon to hassio:
- go to addons
- add repository
```https://github.com/kdosiodjinud/homeassistant-addons```
- install `GitHub Actions runner` addon

## Step 1 - Get runner token
1) Go to your github repo settings
   ![Go to your github repo settings](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/click-settings.png)
2) Select "Actions" -> "Runners"
   ![Select "Actions" -> "Runners"](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/click-runners.png)
3) Create new self-hosted runner
   ![Create new self-hosted runner](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/click-new-runner.png)
4) Select your hassio architecture
   ![Select your hassio architecture](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/select-runner-settings.png)
5) Copy token
   ![Copy token](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/pick-settings.png)

## Step 2
1) Go to addon settings
2) paste config for runner

```
- url: https://github.com/[username]/[repo]
  token: ABC123456789
  name: First
  labels: runner,first
- url: https://github.com/[username]/[repo]
  token: ABC123456789
  name: First2
  labels: runner,first
- url: https://github.com/[username]/[repo]
  token: DEF123456789
  name: Second
  labels: runner,second
```
When you start addon, log print status informations:
    ![Copy token](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/running-runner.png)
If all is ok, you can show live runners on github:
    ![Copy token](https://github.com/kdosiodjinud/homeassistant-addons/raw/master/github-actions-runner/doc/active-runners.png)

### Tips:
- for efective parallel job in GitHub actions you need more runners
- you can make **more runners with the same token**
- name must be without spaces and special chars
- different repos must be have different configuration

### Troubleshooting
#### In log after authentication you have 404 error
Your token is probably expired. Please, generate new token.
