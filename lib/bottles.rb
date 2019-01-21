# A class that helps with 99 Bottles Song
class Bottles
  def verse(number)
      <<~VERSE
        #{Utility.new(number+1).remainder.capitalize} #{Utility.new(number).container} of beer on the wall, #{Utility.new(number+1).remainder} #{utility_factory(number)} of beer.
        #{Utility.new(number).action}, #{Utility.new(number).successor} #{utility_factory(number-1)} of beer on the wall.
      VERSE
  end

  def verses(start_of_verse, end_of_verse)
    start_of_verse.downto(end_of_verse).collect {|i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def utility_factory(number)
      utility = Utility.new(number)
      utility.container
  end
end

class Utility
  def initialize(number)
    @number = number
  end

  def container
    if @number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def remainder
    if @number == 1
      "no more".to_s
    else
      (@number-1).to_s
    end
  end

  def successor
    if @number == 0
      "99"
    else
      self.remainder
    end
  end

  def pronoun
    if @number == 1
      "it"
    else
      "one"
    end
  end

  def action
    if @number == 0
      "Go to the store and buy some more"
    else
      "Take #{self.pronoun} down and pass it around"
    end
  end
end
