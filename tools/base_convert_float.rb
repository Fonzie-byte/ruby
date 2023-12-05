class Float
  def base_convert(base = 10)
    int_part = self.to_i
    dec_part = self - self.to_i
    dec_part = (dec_part*1000).to_i

    new_int = int_part.to_s(base)

    new_dec = (dec_part * base**3 / 10**3).to_s(base)

    return new_int + '.' + new_dec
  end
end
