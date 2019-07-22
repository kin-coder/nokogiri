require 'rubygems'
require 'nokogiri'
require 'open-uri'

#appel de la page à scrapper
$page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


#price = page.xpath('//*[@class="price"]').text
#symbol = page.xpath('//*[@class="text-left col-symbol"]').text

def symbol
  tab = [] # creation tableau
  symbol = $page.xpath('//*[@class="text-left col-symbol"]')

   symbol.each do |nom| # boucle
    tab << nom.text # insertion des symboles
  end
  return tab # tab = ["ABC", "EFG"]
end


def price
  tab = [] # creation tableau
  price = $page.xpath('//*[@class="price"]')

   price.each do |nom| # boucle
    tab << nom.text # insertion des prices
  end
  return tab # tab = [1.5, 5]
end


def ensemble
  tab = Hash.new # creation hash
  sym = symbol
  pri = price
  puts "DEBUT PUTS"

  #sym.each do |key| # boucle
    #tab << {key:(pri)[value]}# insertion des prices
  #end
  i = 0
  for x in sym do
    tab[sym[i]] = pri[i]
    i += 1
  end
  puts tab
end

# [ { a => 'valeur' }, { b => 'valeur2'}]

ensemble

