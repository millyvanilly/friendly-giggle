class Bottles
  def verse(number)
    bottle_number = BottleNumber.for(number)
    # next_bottle_number =  bottle_number.successor
    next_bottle_number = BottleNumber.for(bottle_number.successor)
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
end

class BottleNumber

  def self.for(number)
    return number if number.is_a?(BottleNumber)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def quantity
    number.to_s
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

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
