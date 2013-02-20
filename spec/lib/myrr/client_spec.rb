require 'spec_helper'

describe Myrr::Client do

  def preference
    Myrr::Preference.new(1, 2, 1.0)
  end

  let(:uri){'http://localhost'}
  let(:port){1234}

  subject{Myrr::Client.new(uri, port)}

  describe ".initialize" do
    it "sets the uri" do
      uri = 'http://localhost'
      port = 1234
      client = Myrr::Client.new(uri, port)
      client.uri.should eq uri
    end

    it "sets the port" do
      uri = 'http://localhost'
      port = 1234
      client = Myrr::Client.new(uri, port)
      client.port.should eq port
    end
  end
end