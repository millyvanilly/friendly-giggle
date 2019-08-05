class Bottles
  def verse(number)
    case number
    when 0
        "No more bottles of beer on the wall, " +
        "no more bottles of beer.\n" +
        "Go to the store and buy some more, " +
        "99 bottles of beer on the wall.\n"
    when 1
        "#{number} #{container(number)} of beer on the wall, " +
        "#{number} #{container(number)} of beer.\n" +
        "Take it down and pass it around, " +
        "no more bottles of beer on the wall.\n"
    else
        "#{number} bottles of beer on the wall, " +
        "#{number} bottles of beer.\n" +
        "Take one down and pass it around, " +
        "#{number-1} #{container(number-1)} of beer on the wall.\n"
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
