class Option < ActiveRecord::Base
  def self.current
    last || create
  end
end
