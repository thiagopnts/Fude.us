require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UrlsController do

  it 'should create new urls' do
    post :create, :url => {:url => 'http://google.com'}
    flash[:key].should_not be_nil
    response.status.should == 200
  end

  it 'should redirect to other urls' do
    post :create, :url => {:url => 'http://google.com'}
    flash[:key].should_not be_nil
    get :redirect, :key => flash[:key]
    response.should redirect_to("http://google.com")
  end

end
