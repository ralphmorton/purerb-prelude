def self.eqImpl
  lambda do |a|
    lambda do |b|
      a == b
    end
  end
end

def self.eqArrayImpl
  lambda do |f|
    lambda do |a|
      lambda do |b|
        a.zip(b).all? { |p| f.call(p[0]).call(p[1]) }
      end
    end
  end
end
