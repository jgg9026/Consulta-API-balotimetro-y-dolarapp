require 'httparty'
class Dolar
  include HTTParty
  base_uri 'http://api.dolarapp.com/currency'
  def last
    self.class.get("/last")
  end
  def last_exchange(param)
    rests1=self.class.get("/last_exchange")[0]['rates']
    #rest2=JSON.parse(rests1.body, symbolize_names: true)
    #puts("------")
    puts(rests1)
    puts(rests1.include?(param))
    if (rests1.include?(param))
      puts("-----")
      puts("Un dolar equivale a:")
      puts("#{rests1[param]} #{param} ")
    else
      puts('Moneda no encontrada')
    end
  end
end
dolar=Dolar.new
puts(dolar.last)
dolar.last_exchange("COP")
