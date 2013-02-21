require 'faraday'
require 'faraday_middleware'
require 'csv'

require "myrr/version"

require 'myrr/methods/refresh'
require 'myrr/methods/add_preference'
require 'myrr/methods/ingest'
require 'myrr/methods/remove_preference'
require 'myrr/methods/recommend'
require 'myrr/methods/estimate'

require 'myrr/estimation'
require 'myrr/preference'
require 'myrr/preferences'
require 'myrr/client'

module Myrr
end
