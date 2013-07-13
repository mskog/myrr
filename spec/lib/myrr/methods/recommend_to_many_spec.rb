require 'spec_helper'

describe Myrr::Methods::Recommend do
  let(:uri){'http://localhost'}
  let(:port){8080}
  let(:client){Myrr::Client.new(uri,port)}
  let(:user_ids){Array.new(20){rand(100)}}
  let(:user_ids_parameter){user_ids.join(',')}
  let(:options){{}}

  subject{Myrr::Methods::RecommendToMany.new(client,user_ids,options)}

  describe "#perform" do
    let(:raw_response_file){File.new('spec/fixtures/recommend/single.txt')}

    context "without options" do
      it "performs a GET request with the correct parameters" do

        stub = stub_request(:get, "#{uri}:#{port}/recommendToMany/#{user_ids_parameter}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        subject.perform
        stub.should have_been_requested
      end

      it "returns recommendations with the correct size" do
        raw_response_file = File.new('spec/fixtures/recommend/single.txt')
        stub = stub_request(:get, "#{uri}:#{port}/recommendToMany/#{user_ids_parameter}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        recommendations = subject.perform
        recommendations.count.should eq 10
      end

      it "returns the expected recommendations" do
        raw_response_file = File.new('spec/fixtures/recommend/single.txt')
        stub = stub_request(:get, "#{uri}:#{port}/recommendToMany/#{user_ids_parameter}").with(:headers => {'Content-Type' => 'application/json'}).to_return(raw_response_file)
        recommendations = subject.perform
        recommendations.first.to_a.should eq [nil, 305,0.72179806]
      end
    end

    context "with additional arguments" do
      let(:number){5}
      let(:options){{:how_many => number, :consider_known_items => true}}

      it "perfoms a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommendToMany/#{user_ids_parameter}").with(
          :query => {:howMany => number, :considerKnownItems => "true"},
          :headers => {'Content-Type' => 'application/json'}
        ).to_return(raw_response_file)
        subject.perform
      end
    end

    context "with illegal options" do
      let(:number){5}
      let(:options){{:how_many => number, :consider_known_items => true, :foo => 'bar'}}

      it "perfoms a GET request with the correct parameters" do
        stub = stub_request(:get, "#{uri}:#{port}/recommendToMany/#{user_ids_parameter}").with(
          :query => {:howMany => number, :considerKnownItems => "true"},
          :headers => {'Content-Type' => 'application/json'}
        ).to_return(raw_response_file)
        subject.perform
      end
    end
  end
end