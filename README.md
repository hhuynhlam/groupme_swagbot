# GroupMe SwagBot

GroupMe Fantasy Sports Bot

---

---

## Prerequisites

1. [mongodb](https://docs.mongodb.com/manual/installation/)

1. [redis](http://redis.io/topics/quickstart)

---

## Setup

1. Install [`rbenv`](https://github.com/sstephenson/rbenv#installation)

1. Install [`ruby-build`](https://github.com/sstephenson/ruby-build#installation)

1. Install the correct version of ruby

  ```sh
  ruby --version      # to find version number
  rbenv install 2.3.1 # If you have installed rbenv
  ```

1. Install bundle

  ```sh
  gem install bundle
  bundle
  ```

1. Create `.env` with values:

  ```
  MONGO_URL=
  REDIS_URL=

  GROUP_ME_URL=https://api.groupme.com/v3
  GROUP_ME_BIG_BALLER_BOT_ID=
  GROUP_ME_SWAG_BOT_ID=

  NBA_URL=https://data.nba.com/data/10s/v2015

  SIDEKIQ_USER=
  SIDEKIQ_PASSWORD=

  YAHOO_FANTASY_SPORTS_OAUTH_CLIENT_ID=
  YAHOO_FANTASY_SPORTS_OAUTH_CLIENT_SECRET=
  YAHOO_FANTASY_SPORTS_OAUTH_REFRESH_TOKEN=
  YAHOO_FANTASY_SPORTS_OAUTH_TOKEN_URL=https://api.login.yahoo.com/oauth2/get_token
  YAHOO_FANTASY_SPORTS_URL=https://fantasysports.yahooapis.com/fantasy/v2
  ```

1. Add `RUBY_ENV='development'` to `~/.bash_profile`

---

## Workflow

* Start MongoDB

  ```sh
  mongod
  ```

* Start Redis

  ```sh
  redis-server
  ```

---

## Development

1. Start server

  ```sh
  rails s
  ```

## Deployment

To deploy to staging, you must add your local SSH public key to the Dokku server:
http://dokku.viewdocs.io/dokku/deployment/user-management/

Then run the following commands to setup Git remotes for staging and production environments:

#### Staging

```sh
git remote add staging dokku@45.79.65.209:groupme-swagbot-staging
```

To deploy, push to the Dokku remote:

```sh
git push staging master:master -f
```

#### Production

```sh
git remote add staging dokku@45.79.65.209:groupme-swagbot
```

To deploy, push to the Dokku remote:

```sh
git push production master:master -f
```
