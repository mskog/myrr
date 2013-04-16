require 'spec_helper'

describe Myrr::Methods::EstimateMany do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  let(:user_id){1}
  let(:item_ids){[1,2]}
  let(:values){[0.009714708,-0.3421511]}

  subject{Myrr::Methods::EstimateMany.new(client,user_id, item_ids)}

  describe "#perform" do
    it "returns an array of Estimations" do
      raw_response_file = File.new('spec/fixtures/estimate/multiple.txt')
      items = item_ids.join('/')
      stub = stub_request(:get, "#{uri}:#{port}/estimate/#{user_id}/#{items}").to_return(raw_response_file)
      response = subject.perform


      estimations = [Myrr::Estimation.new(user_id, item_ids[0], values[0]),Myrr::Estimation.new(user_id, item_ids[1], values[1])]

      response.should eq estimations
    end
  end
end