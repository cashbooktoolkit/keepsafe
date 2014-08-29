# Keepsafe - A simple file store for organizations.

Keepsafe (the name is play on Keepsake) is a simple file storage service that organizations can use to distribute user specific files that require users to login to view/download.

## Environment/Platform

* Rails 4.1.x (.4 right now)
* Ruby 2.1.2

## Bouncer

Keepsafe uses Bouncer ( https://github.com/sourdoughlabs/bouncer ) for authentication. The configuration for your Bouncer instance is in config/application.yml.

## Running

* bundle install
* rake db:create
* rake db:schema:load
* rails s

## Upload files via API

Files are intended to be added to a users Keepsafe folder via a simple API call.  I wrote a simple bash script to show how this is done called **upload**.  

There is a secret key used for the HMAC hash located in config/application.yml.  Naturally both sides (client and server) need to agree on the secret.

## TODO

* Finish tag support (list tags, filter document list by tag)
* Date filters for document list.
* Notificatons (email or otherwise) when new documents have been added (and the associated configurate pages for controlling that behaviour)
* Maybe add Evernote and/or Dropbox support.
* Improve the HMAC token stuff.
* S3 is a valid storage option for CarrierWave, look into supporting that (optionally ideally)

## Contributing

1. Fork it ( https://github.com/sourdoughlabs/keepsafe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## LICENSE: MIT
