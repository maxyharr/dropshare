def hw(m, _C, _B, _E)
  _S = _C/(_B*_E)
  b = Math.log(_B, 2)
  s = Math.log(_S, 2)
  t = m - (s + b)
  p "S: #{_S.to_s}"
  p "t: #{t.to_s}"
  p "s: #{s.to_s}"
  p "b: #{b.to_s}"
end

m = ARGV[0].to_i
_C = ARGV[1].to_i
_B = ARGV[2].to_i
_E = ARGV[3].to_i

hw(m, _C, _B, _E)

