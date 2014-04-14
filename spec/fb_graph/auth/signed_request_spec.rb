require 'spec_helper'

describe FbGraph::Auth::signedRequest, '.parse' do
  before do
    @client = Rack::OAuth2::Client.new(:identifier => 'client_id', :secret => 'client_secret')
  end

