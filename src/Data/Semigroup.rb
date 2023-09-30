def self.concat
  lambda do |a|
    lambda do |b|
      a + b
    end
  end
end
