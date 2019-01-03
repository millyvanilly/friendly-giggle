class Bottles
  def verse(number)
    case number
    when 0
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    when 1
      <<~VERSE
        #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{number} bottles of beer on the wall, #{number} bottles of beer.
        Take one down and pass it around, #{number-1} #{container(number-1)} of beer on the wall.
      VERSE
    end
  end

  def verses(start_of_verse, end_of_verse)
    start_of_verse.downto(end_of_verse).collect {|i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end
