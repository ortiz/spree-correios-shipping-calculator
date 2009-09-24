spree-correios-shipping-calculator
============================
* Extension para integração do Spree com o cálculo de frete para Sedex (WebService dos Correios)

DESCRIÇÃO
=========

Adiciona um calculator que utiliza o Webservice dos Correios e retorna o cálculo de frete para Sedex.

INSTALAÇÃO
==========

Depois de baixar o Spree, execute o comando:

  rake db:bootstrap

Em seguida, instale a extension usando o comando:

  script/extension install git://github.com/ortiz/spree-correios-shipping-calculator.git

CONFIGURAÇÃO
============

- Configurando Zonas:

No painel administrativo do Spree vá na aba "Configuration", em seguida no item "Zones". Clique no botão "New Zone", selecione o tipo "Country Based" e configure uma nova zona para o Brasil.

- Configurando método de envio:

No painel administrativo do Spree vá na aba "Configuration", em seguida no item "Shipping Method". Clique no botão "New Shipping Method", selecione a zona Brasil e o calculator Sedex. Assim que clicar em "create" será solicitado o CEP de origem, configure o CEP de sua loja e clique em "Update".

- Configurando Peso para o produto:

No painel administrativo do Spree vá na aba "Products", em seguida clique em "edit", no produto desejado. Para configurar o peso do produto é necessário que o mesmo tenha "Option Types" e "Variants" configurada.

Na variant do produto que foi exibida, clique em "edit", em seguida configure o "Weight" e clique em "Update".