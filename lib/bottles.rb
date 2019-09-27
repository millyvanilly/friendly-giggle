class Bottles
  def verse(number)
    bottle_number = bottle_number_for(number)
    # next_bottle_number =  bottle_number.successor
    next_bottle_number = BottleNumber.new(bottle_number.successor)
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{next_bottle_number} of beer on the wall.\n"
  end

  def verses(start_of_verse, end_of_verse)
    start_of_verse.downto(end_of_verse).collect {|i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def bottle_number_for(number)
    if number == 0
      BottleNumber0.new(number)
    else
      BottleNumber.new(number)
    end
  end

end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    number - 1
  end
end

class BottleNumber0 < BottleNumber
  def successor
    99
  end

  def action
    "Go to the store and buy some more"
  end

  def quantity
    "no more"
  end
end
