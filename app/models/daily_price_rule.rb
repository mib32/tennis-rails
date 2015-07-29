class DailyPriceRule < ActiveRecord::Base
  belongs_to :special_price
  # after_validation :combine_attributes


  def start= val
    string = val.kind_of?(String) ? val : val.values.join(':')
    super(string)
  end

  def stop= val
    string = val.kind_of?(String) ? val : val.values.join(':')
    super(string)
  end
  # attr_accessor :start_hour, :start_minute, :stop_hour, :stop_minute
  # def combine_attributes
    # self.start = [start_hour, start_minute].join(':')
    # self.stop = [stop_hour, stop_minute].join(':')
  # end

  # def current
  # end
end
