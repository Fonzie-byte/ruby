# Expand Ruby's default String-class with new functions.
class String
  def black;   "\033[30m#{self}\033[0m" end
  def red;     "\033[31m#{self}\033[0m" end
  def green;   "\033[32m#{self}\033[0m" end
  def yellow;  "\033[33m#{self}\033[0m" end
  def brown;   self.yellow              end
  def blue;    "\033[34m#{self}\033[0m" end
  def magenta; "\033[35m#{self}\033[0m" end
  def purple;  self.magenta end
  def cyan;    "\033[36m#{self}\033[0m" end
  def grey;    "\033[37m#{self}\033[0m" end

  def reset;   "\033[0m#{self}\033[0m" end
  def normal;  self.reset end
  def white;   self.reset end
end
