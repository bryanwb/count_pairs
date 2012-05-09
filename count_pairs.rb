
#!/usr/bin/env ruby


pairs = {}
fifties = []
f = open('Artist_lists_small.txt')
f.readlines.each do |line|
  artists = line.split(',')

  artists.each do |a|
    artists.each do |other|
      if a.to_s == other.to_s
        continue
      end
      new_pair = [a, other].sort!
      pair_hash = new_pair.hash
    elsif fifties.include? pair_hash
      continue
    elsif pairs[pair_hash].nil?
      pairs[pair_hash] = { :artists => new_pair, :count => 1}
    else
      pairs[pair_hash][:count] += 1
    end
  end
end


