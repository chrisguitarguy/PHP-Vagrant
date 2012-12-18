# Vagrant Example

Decided to give vagrant a try. This was the result. Spins up a 32 bit Ubuntu
12.04 virtual machine, then gets it up and running with Nginx, PHP, and MySQL.

Stuff here works. Mostly.

## Directories

* `conf` -- starting point for various configuration scripts.
* `scripts` -- Shell (or whatever) utilty scripts. Privision script is here.
* `sites` -- Nginx `sites-enabled` directory.
* `src` -- The code for your webapp.

## Other Useful Things

Notes, etc.

### Restart Nginx, PHP, Whatever

    $ vagrant ssh -c "sudo service nginx restart"
    $ vagrant ssh -c "sudo service php5-fpm restart"
