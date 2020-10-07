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

  def open_for_lunch?()
    if @opening_time[0,2].to_i < 12
      true
    else
      false
    end
  end

  def menu_dish_names
    menu = []
    @dishes.each do |dish|
      menu << dish.upcase
    end
    menu
  end
end
