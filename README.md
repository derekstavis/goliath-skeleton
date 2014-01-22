# Goliath-Skeleton

Example app giving you a good foundation for building a robust API
service with Goliath, Grape, and Rabl.

See my original presentation at http://slidesha.re/18noOc3

## Author

Matt E. Patterson -- Digimonkey Studios (http://code.digimonkey.com)

## Installation

1. Get the code, put it on a server.
2. Configure stuff. see `config/application.rb` and `db/config.yml`
3. run `ruby app.rb -sv -p 9000` to make it go (on port 9000)!

## Generators

I've started adding some thor generator scripts to make working with the API easier/faster. Right now, there's only one, but it's cool...

`./gen` will give you the standard help listing

It has two options: `create_resource` and `destroy_resource`

These will create/destroy a resource, its associated files and directories, and add a mount line to the API class.

## RABL Template Structure

My structure always starts with a `base.json.rabl` template for each resource. This is, essentially, the base set of things that will _always_ be displayed when a record of that resource is returned. From there, you should then create a specific template for each endpoint (see `index.json.rabl` and `show.json.rabl`) These extend the base and then bolt on any additional stuff you only want displayed for that particular request. As an example, I've setup this skeleton to only show :description on the #show endpoint for an Unlock.

## Error Handling

My example automatically intercepts any exceptions that occur in the Goliath app. Instead of just crashing the process, this results in the app logging a FATAL with all the pertinent info and then throwing a Rack response with that same info. This may or may not be the desired behavior, depending on how you intend for this API to work within your own infrastructure.
