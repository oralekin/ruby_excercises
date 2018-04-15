def diffs

  diffs = {
    # :diffid => ["diffname", max_num, tries]
    :easy => ["Easy", 10, 5],
    :med => ["Medium", 50, 15],
    :hard => ["Hard", 100, 30],
    :ins => ["Insane", 200, 30],
    :expert => ["Extra", 200, 20],
    :inf => ["Long play", 1000, 0],
    :difflist => []
  }

  diffs.each_key {|sym|
    if sym != :difflist
      diffs[:difflist].push(sym)
    end
  }

  diffs

end
