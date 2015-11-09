docka-salt
==========

This is the example salt repo that you can use to set up your test and
production environments. It includes all the code required to set up the
listening service to handle the full deployment process.

For this to work users will have ensure you've followed the steps in the
`docka-hub` directory, otherwise the web hook will not be set up correctly
to interface with the salt server.

This example project contains three components. A Salt master, and two Salt
minions.

NOTE: This project is using CentOS 7, and was designed as a very basic
tutorial without too much logic. This means that some code will need to be
modified for other distros.

Components
----------

Salt Master
-----------

The Salt master contains our critical components, Salt itself, the listener
for our Docker hub pushes, and the reactor code for Salt which will deploy
our keys. All files in this directory should go in their respective directories
on the master.

Salt Minion
-----------

This example uses two Salt minions, both minions connect to the master, one is
treated as the production environment, and one is treated as the test
environment. These minions require minimal configuration as most of the Salt
code lives on the master (reactors are NOT currently supported on masterless
minions, see: https://github.com/saltstack/salt/issues/15265 for updates.

The production minion requires the following settings in the minion config:

master: your_master_domain_or_ip
grains:
  env:
    - prod

The test minion requires the following settings in the minion config:

master: your_master_domain_or_ip
grains:
  env:
    - test

When set these grains allow us to target the production or test environment
as specific in our reactor states.

Installation
============

Begin by installing the Salt Master as specified here but only installing the
Salt Master package:

https://docs.saltstack.com/en/latest/topics/installation/

Once completed install the Salt minion using the same process on both the 
test and production servers. Once the master has been installed and the user
have confirmed it is listening modify the minion configs with the data from the
`Salt Minion` section above and restart both minions. On the master a
privileged system user should now be able to run `salt-key --list-all` and see
the two minions trying to connect, the user should now run
`salt-key --accept-all` to accept both pending keys. The comamnd
`salt '*' test.ping` should now return a response from both the production and
test servers.

Directories should now be copied to their relevant directory on the master
system as mapped below:

