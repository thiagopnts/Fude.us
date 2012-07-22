class Url
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :url
  attr_reader :key

  validates_presence_of :url
  validates_format_of :url, :with => /^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?$/

  def initialize(params = {})
    @key = params[:key]
    @url = params[:url]
  end

  def persisted?
    false
  end

  def to_key
    nil
  end

  def generate_key
      @key = (rand(26) + 65).chr + (rand(26) + 65).chr +
        (rand(26) + 65).chr + (rand(26) + 65).chr
  end

  def save
    generate_key unless @key
    return false unless valid?
    if REDIS.get(@key).nil?
      REDIS.set(@key, @url)
    else
      generate_key
      REDIS.set(@key, @url)
    end
    true
  end

  class << self

    def all(*args)
      []
    end

  end

end
