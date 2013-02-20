require 'spec_helper'

describe Myrr::Methods::Refresh do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  subject{Myrr::Methods::Refresh.new(client)}

  describe "#perform" do

    it "performs a POST request with the correct parameters" do
      stub = stub_request(:post, "#{uri}:#{port}/refresh")
      subject.perform
      stub.should have_been_requested
    end
  end
end