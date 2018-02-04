module PagesHelper
  def add_commas(number)
    n = number_with_delimiter(number, :delimiter => ',')
    number_with_precision(n, precision: 2)                           # => 111.23
  end
end
