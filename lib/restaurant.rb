class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(time, name)
    @opening_time = time
    @name = name
    @dishes = []
  end

  def closing_time(int)
    # given a number of hours, this returns the hours + opening time in 24 hour format. Known issue if past idnight. Could be fixed with modulo in future versions.
    # this if statement solves an issue if the opening_time has a time that is either "6:00" or "06:00"
    if @opening_time[0,2].to_i >=10 || @opening_time[0,1].to_i == 0
      (@opening_time[0,2].to_i + int).to_s + @opening_time[2,3]
    else
      (@opening_time[0,2].to_i + int).to_s + @opening_time[1,3]
    end
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

  def convert_to_12_hour(time)
    # given time as a string, this returns a string in the 12 format with AM or PM added
    # This should have been done with a form of modulo, but currently only works if closing time is before 12AM the next day
    temp = time[0,2].to_i
    if temp > 12 && temp < 24
      (temp - 12).to_s + time[2,3] + "PM"
    elsif temp == 12
      "#{time}PM"
    elsif temp < 12
      "#{time}AM"
    elsif temp == 24
      (temp - 12).to_s + time[2,3] + "AM"
    else
      (temp - 24).to_s + time[2,3] + "AM"
    end
  end

  def announce_closing_time(time)
    # given time in hours, announces the reastaurant's closing time
    "#{name} will be closing at #{convert_to_12_hour(closing_time(time))}"
  end
end
