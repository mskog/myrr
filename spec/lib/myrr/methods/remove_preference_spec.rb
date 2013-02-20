require 'spec_helper'

describe Myrr::Methods::RemovePreference do
  let(:preference){Myrr::Preference.new(1,2)}
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  subject{Myrr::Methods::RemovePreference.new(client,preference)}

  describe "#perform" do
    it "performs a request with the correct parameters" do
      stub = stub_request(:delete, "#{uri}:#{port}/pref/#{preference.user_id}/#{preference.item_id}")

      subject.perform
      stub.should have_been_requested
    end
  end
end