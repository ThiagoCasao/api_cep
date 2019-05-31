class GravacaoViacep

  def initialize(retorno)
    @retorno = retorno
  end

  def gravar
    gravar_estado
    gravar_cidade
    gravar_endereco
  end

  private 
  
  def gravar_endereco
    endereco = Endereco.find_or_initialize_by(cep: @retorno["cep"])
    endereco.cidade = @cidade
    endereco.logradouro = @retorno["logradouro"] 
    endereco.bairro = @retorno["bairro"]
    endereco.complemento = @retorno["complemento"]
    endereco.save

    endereco
  end

  def gravar_cidade
    @cidade = Cidade.find_or_initialize_by(nome: @retorno["localidade"], 
                                          estado_id: @estado.id)
    @cidade.save
  end

  def gravar_estado
    @estado = Estado.find_or_initialize_by(uf: @retorno["uf"])
    @estado.save    
  end
end