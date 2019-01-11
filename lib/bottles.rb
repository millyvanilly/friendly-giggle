# A class that helps with 99 Bottles Song
class Bottles
  def verse(number)
      <<~VERSE
        #{remainder(number+1).capitalize} #{utility_factory(number)} of beer on the wall, #{remainder(number+1)} #{utility_factory(number)} of beer.
        #{action(number)}, #{successor(number)} #{utility_factory(number-1)} of beer on the wall.
      VERSE
  end

  def verses(start_of_verse, end_of_verse)
    start_of_verse.downto(end_of_verse).collect {|i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def remainder(number)
    if number == 1
      "no more".to_s
    else
      (number-1).to_s
    end
  end

  def successor(number)
    if number == 0
      "99"
    else
      remainder(number)
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def utility_factory(number)
      utility = Utility.new
      utility.container(number)
  end
end

class Utility
    def container(number)
      if number == 1
        "bottle"
      else
        "bottles"
      end
    end
end
