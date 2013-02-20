require 'spec_helper'

describe Myrr::Methods::Ingest do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  subject{Myrr::Methods::Ingest.new(client, preferences)}

  describe "#perform" do
    let(:preferences){
      preferences = Myrr::Preferences.new
      [1,2,3,4,5,6].each_slice(2) {|slice| preferences << Myrr::Preference.new(slice[0], slice[1])}
      preferences
    }
    it "performs a POST request with the correct parameters" do
      expected_body = CSV.generate do |csv|
        csv << [1,2]
        csv << [3,4]
        csv << [5,6]
      end
      stub = stub_request(:post, "#{uri}:#{port}/ingest").with(:body => expected_body)
      subject.perform
      stub.should have_been_requested
    end
  end
end