require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Url do
  
  it 'should generate keys for the url' do
    url = Url.new(:url => 'http://google.com')
    url.key.should_not be_true
    url.save.should be_true
    url.key.nil?.should_not be_true
  end

  it 'should validate the url' do
    url = Url.new(:url => 'invalidurl')
    url.save.should_not be_true
  end

  it 'should change the key' do
    url = Url.new(:url => 'http://google.com')
    url.save.should be_true
    url.key.should_not be_nil
  end

end
