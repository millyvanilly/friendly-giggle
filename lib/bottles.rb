class Bottles
  def verse(number)
    case number
    when 0
        "No more #{container(number)} of beer on the wall, " +
        "no more #{container(number)} of beer.\n" +
        "#{action}, " +
        "99 #{container(number-1)} of beer on the wall.\n"
    else
        "#{number} #{container(number)} of beer on the wall, " +
        "#{number} #{container(number)} of beer.\n" +
        "Take #{pronoun(number)} down and pass it around, " +
        "#{quantity(number)} #{container(number-1)} of beer on the wall.\n"
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

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def quantity(number)
    if number == 1
      "no more"
    else
      number - 1
    end
  end

  def action
    "Go to the store and buy some more"
  end

end
