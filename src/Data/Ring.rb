def self.sub_
  lambda do |a|
    lambda do |b|
      a-b
    end
  end
end
