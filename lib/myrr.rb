require 'faraday'
require 'faraday_middleware'
require 'csv'

require "myrr/version"
require 'myrr/core_ext'

require 'myrr/methods/refresh'
require 'myrr/methods/ready'
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
