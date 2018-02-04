module PagesHelper
  def add_commas(number)
    number_with_delimiter(number, :delimiter => ',')
  end
end
