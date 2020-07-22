# Data Bag Maker for Datadog

##### Last Updated: July 22, 2020

This is an unofficial tool made to let the onboarding process be more streamlined for a Datadog employee. This script will guide your through the process of creating your data bag, so that you can begin using your public ssh key to get into the jumpbox.

### Usage:

1. Clone this repository to a folder of your choice.
2. `cd` into this folder if you haven't already in your terminal emulator of choice.
3. Ensure that you have "execute" permissions on `data_bag_maker.sh` by running `chmod +x data_bag_maker.sh`
4. Run the script with the command `./data_bag_maker.sh` and follow the on-screen instructions.

#### Caveats:

- This script will default your shell to bash without option to change it. This is because the jumpbox has issues with other shell types, including zsh. If you know what you are doing, you can manually change the shell yourself in the json file, but I _highly_ suggest that you do not.
- As mentioned in the end of the script, if your public key is not the default file location of `~/.ssh/id_rsa.pub`, you will need to change the contents of `"ssh_keys"` to the output of `cat path/to/<publickey>.pub` yourself.
    - I tried making this an option in the script, but ran into issues. Feel free to make a PR including this in.
- Double check to make sure the JSON file populated correctly and without errors. This is not an official tool, so I will not take responsibility if it does not work as expected.

### Next Steps:

This script if run correctly will create a file `<your.name>.json` in the same directory as the script. It is your job now to copy/move this file to the `data_bags/users` folder of the devops repo by creating a new PR for the appropriate staging branch for your team (found in `#staging-headsup`), and then prod.

### Issues/Feedback/Etc.

Create an issue, or PR and I will try to review it. You can also ping me on Slack at Griffin Solot-Kehl. I am on the West Coast so please time your messages appropriately 😀