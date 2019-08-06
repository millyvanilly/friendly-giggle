class Bottles
  def verse(number)
    case number
    when 0
        "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
        "#{quantity(number)} #{container(number)} of beer.\n" +
        "#{action(number)}, " +
        "#{quantity(successor)} #{container(number-1)} of beer on the wall.\n"
    else
        "#{quantity(number)} #{container(number)} of beer on the wall, " +
        "#{quantity(number)} #{container(number)} of beer.\n" +
        "#{action(number)}, " +
        "#{quantity(number-1)} #{container(number-1)} of beer on the wall.\n"
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
    if number == 0
      "no more"
    else
      number
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def successor
    99
  end

end
