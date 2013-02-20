require 'spec_helper'

describe Myrr::Methods::Estimate do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  let(:preference){Myrr::Preference.new(1,2)}

  subject{Myrr::Methods::Estimate.new(client,preference)}

  describe "#perform" do
    it "performs a GET request with the correct parameters" do
      stub = stub_request(:get, "#{uri}:#{port}/estimate/#{preference.user_id}/#{preference.item_id}")
      subject.perform
      stub.should have_been_requested
    end
  end
end