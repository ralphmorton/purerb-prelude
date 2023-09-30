def self.add_
  lambda do |a|
    lambda do |b|
      a + b
    end
  end
end

def self.mul_
  lambda do |a|
    lambda do |b|
      a * b
    end
  end
end
