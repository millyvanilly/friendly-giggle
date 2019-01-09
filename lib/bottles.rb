# A class that helps with Bottles
class Bottles
  def verse(number)
    case number
    when 0
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
        Take #{pronoun(number)} down and pass it around, #{remainder(number)} #{container(number-1)} of beer on the wall.
      VERSE
    end
  end

  def verses(start_of_verse, end_of_verse)
    start_of_verse.downto(end_of_verse).collect {|i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def remainder(number)
    if number == 1
      "no more"
    else
      number-1
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end
