require 'httparty'

class Baloto
  include HTTParty
  base_uri 'http://api.balotimetro.com'
  def sorteo(page=1)
    self.class.get("/sorteo", :query => { :page => page })
  end
  def sorteo_no(param)
    self.class.get("/sorteo/"+param)
  end
  def generate
    r = Random.new
    tests=self.sorteo(1)['sorteos'][0..9]
    bts=[1,2,3,4,5,6]
    temps=[1,2,3,4,5,6,7,8,9]
    re=[0,0,0,0,0,0]
    tests.each_with_index{ |test,index| bts[index]=test['sorteo']['baloto'] }
    #puts(bts[0][0])
    for i in 0..5
      for j in 0..9
        temps[j]=bts[j][i]
      end
      #puts('Numeros:'+ i.to_s)
      #puts(temps)
      #puts("-------")
      #puts(temps.max)
      #puts(temps.min)
      temp3=r.rand(temps.min..temps.max)
      while(re.include?(temp3)==true)
        temp3=r.rand(temps.min..temps.max)
      end
      re[i]=temp3
    end
    puts("prediccion:")
    puts(re.sort)
  end
end

baloto = Baloto.new
puts("-----------")
puts(baloto.sorteo(2))
puts(baloto.sorteo_no("1481"))
#puts(resul=baloto.generate)
baloto.generate

a=[1,0,0,0,0,]
puts(a.include?(6))