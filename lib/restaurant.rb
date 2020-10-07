class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(time, name)
    @opening_time = time
    @name = name
    @dishes = []
  end

  def closing_time(int)
    (@opening_time[0,2].to_i + int).to_s + @opening_time[2,3]
  end

  def add_dish(dish)
    @dishes << dish
  end
end
