# Installation

### 1. Install ruby version manager (one of these list) or ruby

* [rvm](https://rvm.io)
* [rbenv](https://github.com/rbenv/rbenv)
* [asdf](https://asdf-vm.com)

### 2. If you use RVM

```
rvm install 3.2.0
```


### 3.Install Dependencies
```
gem install bundler
bundle install
```
___

### 4.Run

```
ruby processor.rb 
```

## Notes

**Formato do arquivo de Pedidos**
   
```
Nome do Cliente
Quantidade Código Produto
Quantidade Código Produto
Quantidade Código Produto

Nome do Cliente
Quantidade Código Produto
Quantidade Código Produto
Quantidade Código Produto
```

**Exemplo:**

```
Joaquina Paiva
1 95 Abacate
1 3 alecrim
2 44 Ponkan
1 91 tofu orgânico 500

Calado Mayara
1 120 Pão integral
1 104 Palmito em conserva
1 31 Limão Rosa

João Roberto
1 101 Molho de tomate
2 102 Molho de tomate orgânico com manjericão

Julia Almeida
1 4 Alface Americana
2 6 Alface


```

**Obervações**: 

1.Foi acrescentado o código de produto, devido aos problemas que usar nomes pode gerar;
    1.Acentos e semelhantes; 
    2. Problema com padrão e formato; 
    3. Dificuldade de Pesquisa;

Embora seja possível trabalhar com strings, a quantidade de entropia que isso pode adicionar ao processo 
não é interessante.

2.Se o produto não estiver na lista de preços ou não for encontrado o valor do produto vai estar como 0;

3.É obrigatório pular a linha entre um pedido e outro;

4.A planilha pode ser atualizada com novos dados de pedidos, mas se quiser que o processador delete algum
dado, o ideal é deletar a planilha e gerar uma nova;

  
