require 'spec_helper'

describe Myrr::Methods::AddPreference do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  subject{Myrr::Methods::AddPreference.new(client,preference)}

  describe "#perform" do
    context "when no strength value is given" do
      let(:preference){Myrr::Preference.new(1,2)}
      it "performs a request with the correct parameters" do
        stub = stub_request(:post, "#{uri}:#{port}/pref/#{preference.user_id}/#{preference.item_id}")

        subject.perform
        stub.should have_been_requested
      end
    end

    context "when a strength value is given" do
      let(:preference){Myrr::Preference.new(1,2,3)}
      it "performs a request with the correct parameters" do
        stub = stub_request(:post, "#{uri}:#{port}/pref/#{preference.user_id}/#{preference.item_id}").with(:body => preference.value.to_s)

        subject.perform
        stub.should have_been_requested
      end
    end
  end
end