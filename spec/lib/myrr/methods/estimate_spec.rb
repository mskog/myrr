require 'spec_helper'

describe Myrr::Methods::Estimate do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}

  let(:user_id){1}
  let(:item_id){2}
  let(:value){0.009714708}

  subject{Myrr::Methods::Estimate.new(client,user_id, item_id)}

  describe "#perform" do
    it "returns an Estimation" do
      raw_response_file = File.new('spec/fixtures/estimate/single.txt')
      stub = stub_request(:get, "#{uri}:#{port}/estimate/#{user_id}/#{item_id}").to_return(raw_response_file)
      response = subject.perform
      response.user_id.should eq user_id
      response.item_id.should eq item_id
      response.value.should eq value
    end
  end
end