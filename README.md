# ShareLaTeX Config

Dockerfiles, scripts to support a ShareLaTeX server. The docker-related resources are a fork-ish of the [official repo](https://github.com/sharelatex/sharelatex). Key differences address:

* Upgrading `tlmgr` to 2018 with a custom [image](https://github.com/sharelatex/sharelatex/issues/601)
* Downgrading mongodb to version 3, otherwise [`mongodump` fails](https://dba.stackexchange.com/questions/215534/mongodump-unrecognized-field-snapshot) because apparently the version of `mongodump` installed through the debian `apt` repository wasn't compiled to work with mongodb version 4

## Usage

### Spinning up the server

```sh
docker-compose up -d
```

### Automated backups 

```sh
sudo cp sync_sharelatex.sh /etc/cron.d/sync_sharelatex.sh
sudo cp sync_latest_sharelatex.sh /etc/cron.d/sync_latest_sharelatex.sh
crontab -e
# then edit the crontab accordingly
```

