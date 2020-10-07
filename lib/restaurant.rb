class Restaurant
  attr_reader :opening_time, :name

  def initialize(time, name)
    @opening_time = time
    @name = name
  end 
end
