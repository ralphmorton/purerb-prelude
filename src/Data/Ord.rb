def self.ordImpl
  lambda do |lt|
    lambda do |eq|
      lambda do |gt|
        lambda do |x|
          lambda do |y|
            x < y ? lt : x == y ? eq : gt
          end
        end
      end
    end
  end
end

def self.ordArrayImpl
  lambda do |f|
    lambda do |ax|
      lambda do |bx|
        ax.size == bx.size && ax.zip(bx).all? { |p| f.call(p[0]).call(p[1]) }
      end
    end
  end
end
