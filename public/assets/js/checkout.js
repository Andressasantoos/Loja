var App_checkout = function () {

   
 var set_session_payment = function () {

     $.ajax({

        url: BASE_URL + 'pagar/pag_seguro_session',
        dataType: 'json',
        success: function (response) {

           if (response.erro === 0) {
            
              var session_id = response.session_id;

              if (session_id) {
               
                  PagSeguroDirectPayment.setSessionId(session_id);

              }else{

                  window.location.href = BASE_URL + 'checkout';
              }

           }else{
              
               console.log(response.mensagem);
               
           }

        },
        error: function (error) {

             alert('Falha. Contate os administradores do site');
        }
     })
 }

   var calcula_frete = function () {

    $('#btn-busca-cep').on('click', function () {

         var cliente_cep = $("#cliente_cep").val();

        
            $.ajax({

              type: 'post',
                url: BASE_URL + 'checkout/calcula_frete',
              dataType: 'json',
              data:{
                cliente_cep: cliente_cep,
              },              
              beforeSend: function () {
                $('#erro_frete').html(''); 
                $('.endereco').addClass('d-none');
                $('#btn-busca-cep').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Calculando...</span>');
              },
              }).then(function (response) {
            
              if (response.erro === 0) {
                
                //Sucesso

                //Exibe os campos escondidos
                $('.endereco').removeClass('d-none');

                $('#btn-busca-cep').html('Calcular');
                $('#retorno-frete').html(response.retorno_endereco);

                //Preenchendo os inputs com os valores adequados
                $('[name="cliente_endereco"]').val(response.endereco);
                $('[name="cliente_bairro"]').val(response.bairro);
                $('[name="cliente_cidade"]').val(response.localidade);
                

                get_opcao_frete_carrinho(); //chamo a função aqui no response para criar o name opcao_frete_carrinho

              }else{

                  //Erro de formatação ou validação
                  $('#btn-busca-cep').html('Calcular');
                  $('#erro_frete').html(response.retorno_endereco); 
              }
                  console.log(response);

              });

            });
 }

   var get_opcao_frete_carrinho =  function () {
     
       $('[name="opcao_frete_carrinho"]').on('click', function () {

           var opcao_frete_escolhido = $(this).attr('data-valor_frete');
           var total_final_carrinho = $(this).attr('data-valor_final_carrinho');


           $('#opcao_frete_escolhido').html('R$&nbsp;' + opcao_frete_escolhido);
           $('#total_final_carrinho').html('R$&nbsp;' + total_final_carrinho);
       })
      
   }
   
     
    var pagar_boleto = function () {

      $('#btn-pagar-boleto').on('click', function () {

           $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

           var form = $('.do-payment');

           
              $.ajax({
                type: "post",
                url: BASE_URL + 'pagar/boleto',
                dataType: 'json',
                data: form.serialize(),
                beforeSend: function(){
                   //Apagar erros quando houver
                  // $('#btn-pagar-boleto').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
                $('#opcao_boleto').html('<span class="text-info"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
            
                 
                    $("#cliente_nome").html('');
                    $("#cliente_sobrenome").html('');
                    $("#cliente_data_nascimento").html('');
                    $("#cliente_cpf").html('');
                    $("#cliente_email").html('');
                    $("#cliente_telefone_movel").html('');
                    $("#cliente_cidade").html('');
                    $("#cliente_estado").html('');
                    $("#erro_frete").html(''); //erro frete, pois já existe o id 'cliente_cep'
                    $("#cliente_endereco").html('');
                    $("#cliente_numero_endereco").html('');
                    $("#cliente_bairro").html('');
                    $("#cliente_senha").html('');
                    $("#confirmacao").html('');
                    $("#opcao_frete_carrinho").html('');

               },

                success: function (response) {

                    if (response.erro === 0) {
                       
                        window.location = BASE_URL + 'sucesso';
                        $("#opcao_boleto").html('');

                    }else{ 
                      
                        console.log(response.mensagem);       
                        
                        $("#opcao_boleto").html('');

                        $("#cliente_nome").html(response.cliente_nome);
                        $("#cliente_sobrenome").html(response.cliente_sobrenome);
                        $("#cliente_data_nascimento").html(response.cliente_data_nascimento);
                        $("#cliente_cpf").html(response.cliente_cpf);
                        $("#cliente_email").html(response.cliente_email);
                        $("#cliente_telefone_movel").html(response.cliente_telefone_movel);
                        $("#cliente_cidade").html(response.cliente_cidade);
                        $("#cliente_estado").html(response.cliente_estado);
                        $("#erro_frete").html(response.cliente_cep); //erro frete, pois já existe o id 'cliente_cep'
                        $("#cliente_endereco").html(response.cliente_endereco);
                        $("#cliente_numero_endereco").html(response.cliente_numero_endereco);
                        $("#cliente_bairro").html(response.cliente_bairro);
                        $("#cliente_senha").html(response.cliente_senha);
                        $("#confirmacao").html(response.confirmacao);
                        $("#opcao_frete_carrinho").html(response.opcao_frete_carrinho);
                        
                    }

                },
                error: function (error) {

                      alert('Falha ao processar o pagamento. Contate o suporte'); 
                }
              })
      });

    }

       
    var pagar_debito_conta = function () {

      $('#btn-debito-conta').on('click', function () {


         $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

          var form = $('.do-payment');

           
             $.ajax({
                type: "post",
                url: BASE_URL + 'pagar/debito_conta',
                dataType: 'json',
                data: form.serialize(),
                beforeSend: function(){
                   //Apagar erros quando houver
                  // $('#btn-pagar-boleto').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
                $('#opcao_btn_debito_conta').html('<span class="text-info"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
            
                 
                    $("#cliente_nome").html('');
                    $("#cliente_sobrenome").html('');
                    $("#cliente_data_nascimento").html('');
                    $("#cliente_cpf").html('');
                    $("#cliente_email").html('');
                    $("#cliente_telefone_movel").html('');
                    $("#cliente_cidade").html('');
                    $("#cliente_estado").html('');
                    $("#erro_frete").html(''); //erro frete, pois já existe o id 'cliente_cep'
                    $("#cliente_endereco").html('');
                    $("#cliente_numero_endereco").html('');
                    $("#cliente_bairro").html('');
                    $("#cliente_senha").html('');
                    $("#confirmacao").html('');
                    $("#opcao_banco").html('');
                    $("#opcao_frete_carrinho").html('');

               },

                success: function (response) {

                    if (response.erro === 0) {
                       
                        window.location = BASE_URL + 'sucesso';
                        $("#opcao_btn_debito_conta").html('');

                    }else{ 
                      
                        console.log(response.mensagem);       
                        
                        $("#opcao_btn_debito_conta").html('');

                        $("#cliente_nome").html(response.cliente_nome);
                        $("#cliente_sobrenome").html(response.cliente_sobrenome);
                        $("#cliente_data_nascimento").html(response.cliente_data_nascimento);
                        $("#cliente_cpf").html(response.cliente_cpf);
                        $("#cliente_email").html(response.cliente_email);
                        $("#cliente_telefone_movel").html(response.cliente_telefone_movel);
                        $("#cliente_cidade").html(response.cliente_cidade);
                        $("#cliente_estado").html(response.cliente_estado);
                        $("#erro_frete").html(response.cliente_cep); //erro frete, pois já existe o id 'cliente_cep'
                        $("#cliente_endereco").html(response.cliente_endereco);
                        $("#cliente_numero_endereco").html(response.cliente_numero_endereco);
                        $("#cliente_bairro").html(response.cliente_bairro);
                        $("#cliente_senha").html(response.cliente_senha);
                        $("#confirmacao").html(response.confirmacao);
                        $("#opcao_banco").html(response.opcao_banco);
                        $("#opcao_frete_carrinho").html(response.opcao_frete_carrinho);
                        
                    }

                },
                error: function (error) {

                      alert('Falha ao processar o pagamento. Contate o suporte'); 
                }
              })
      });

    }

        
    var pagar_cartao_credito = function () { 

      $('#btn-pagar-cartao').on('click', function () {

        gerar_token_pagamento();

      $('[name="hash_pagamento"]').val(PagSeguroDirectPayment.getSenderHash());

          var form = $('.do-payment');

           
            $.ajax({
                type: "post",
                url: BASE_URL + 'pagar/cartao_credito',
                dataType: 'json',
                data: form.serialize(),
                beforeSend: function(){
                   //Apagar erros quando houver
                  // $('#btn-pagar-boleto').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
                $('#opcao_pagar_cartao').html('<span class="text-info"><i class="fa fa-cog fa-spin"></i>&nbsp;Processando Pagamento...</span>');
            
                 
                    $("#cliente_nome").html('');
                    $("#cliente_sobrenome").html('');
                    $("#cliente_data_nascimento").html('');
                    $("#cliente_cpf").html('');
                    $("#cliente_email").html('');
                    $("#cliente_telefone_movel").html('');
                    $("#cliente_cidade").html('');
                    $("#cliente_estado").html('');
                    $("#erro_frete").html(''); //erro frete, pois já existe o id 'cliente_cep'
                    $("#cliente_endereco").html('');
                    $("#cliente_numero_endereco").html('');
                    $("#cliente_bairro").html('');
                    $("#cliente_senha").html('');
                    $("#confirmacao").html('');
                    $("#opcao_banco").html('');
                    $("#opcao_frete_carrinho").html('');

               },

                success: function (response) {

                    if (response.erro === 0) {
                       
                        window.location = BASE_URL + 'sucesso';
                        $("#opcao_pagar_cartao").html('<span class="text-danger">Verifique os dados do cartão de crédito e tente novamente</span>');

                    }else{ 
                          
                        if(response.token_pagamento) {
                           $("#opcao_pagar_cartao").html('');
                           gerar_token_pagamento();
                        }

                        $("#opcao_pagar_cartao").html('');
                        $("#cliente_nome").html(response.cliente_nome);
                        $("#cliente_sobrenome").html(response.cliente_sobrenome);
                        $("#cliente_data_nascimento").html(response.cliente_data_nascimento);
                        $("#cliente_cpf").html(response.cliente_cpf);
                        $("#cliente_email").html(response.cliente_email);
                        $("#cliente_telefone_movel").html(response.cliente_telefone_movel);
                        $("#cliente_cidade").html(response.cliente_cidade);
                        $("#cliente_estado").html(response.cliente_estado);
                        $("#erro_frete").html(response.cliente_cep); //erro frete, pois já existe o id 'cliente_cep'
                        $("#cliente_endereco").html(response.cliente_endereco);
                        $("#cliente_numero_endereco").html(response.cliente_numero_endereco);
                        $("#cliente_bairro").html(response.cliente_bairro);
                        $("#cliente_senha").html(response.cliente_senha);
                        $("#confirmacao").html(response.confirmacao);
                        $("#opcao_frete_carrinho").html(response.opcao_frete_carrinho);
                        
                    }

                },
                error: function (error) {

                       $("#opcao_pagar_cartao").html('');
                      alert('Falha ao processar o pagamento. Contate o suporte'); 
                }
              });
      });

      function gerar_token_pagamento(){

        $("#cliente_nome_titular").html("");
        $("#numero_cartao").html("");
        $("#validade_cartao").html("");
        $("#codigo_seguranca").html("");
        
        var card_titular = $('[name="cliente_nome_titular"]').val();

        if(!card_titular){
           $("#cliente_nome_titular").html("Nome é obrigatório");
           return false;
        }

        var card_number = $('[name="numero_cartao"]').val();

        if(!card_number){
          $("#numero_cartao").html("Numero é obrigatório");
          return false;
        }

        var card_expire = $('[name="validade_cartao"]').val();

        if(!card_expire){
          $("#validade_cartao").html("Validade é obrigatório");
          return false;
        }else{
           
            card_expire = card_expire.split('/');

            var mes_expire = card_expire[0];
            var ano_expire = card_expire[1];
        }

        var card_ccv = $('[name="codigo_seguranca"]').val();

        if(!card_ccv){
          $("#codigo_seguranca").html("CVV é obrigatório");
          return false;
        }

        var bandeira = "";

         PagSeguroDirectPayment.getBrand({
            
             cardBin: card_number.replace(" ", ""), //Fazemos um replace no primeiro espaço para ser geradi 'cardBin'

             success: function (response) {
 
                 bandeira = response.brand['name'];

                 if (bandeira) {
                  
                      //Sucesso bandeira foi gerado, podemos chamar o método ' PagSeguroDirectPayment.createCardToken()
                      //Para gerarmos o token do cartão de crédito

                      PagSeguroDirectPayment.createCardToken({

                        cardNumber: card_number,
                        brand: bandeira,
                        cvv: card_ccv,
                        expirationMonth: mes_expire,
                        expirationYear: ano_expire,
                        
                         success: function (response) {

                           //Sucesso... foi gerado o token do cartão de credito
                           var token_pagamento = response.card.token;

                           if(token_pagamento){

                              $("#token_pagamento").val(token_pagamento);

                           }else{

                              alert('Não foi gerado o token de pagamento para cartão');
                           }

                         },

                         error: function (response) {

                            //Houve um erro ao gerar o token do cartao de crédito
                            alert('Não foi gerado o token de pagamento para cartão' + response.message);
                         },

                      });


                 }else{

                     alert('Não foi possivel gerar a bandeira do cartão' + response.statusMessage);
                 }
                 
             },
             error: function (response) {
                alert(response);
             }

         });

      }

    }

   var forma_pagamento = function () {
      
      $('.forma_pagamento').on('change', function () {

        var opcao = $(this).val();

          switch (opcao) {
            case '1':

                $('.cartao').removeClass('d-none');
                $('.opcao-debito-conta').addClass('d-none');
                $('.opcao-boleto').addClass('d-none');
                $('.cartao input').prop('disabled', false);
                $('.opcao-debito-conta select').prop('disabled', true);              
              break;

            case '2':

              $('.cartao').addClass('d-none');
              $('.opcao-debito-conta').addClass('d-none');
              $('.opcao-boleto').removeClass('d-none');
              $('.cartao input').prop('disabled', true);
              $('.opcao-debito-conta select').prop('disabled', true);            
            break;  

            case '3':

              $('.cartao').addClass('d-none');
              $('.opcao-debito-conta').removeClass('d-none');
              $('.opcao-boleto').addClass('d-none');
              $('.cartao input').prop('disabled', true);
              $('.opcao-debito-conta select').prop('disabled', false);            
            break;  
          
            
          }


      });
   }

    return {

       init: function () {
            
        set_session_payment();
        calcula_frete();
        forma_pagamento();
        pagar_boleto();
        pagar_debito_conta();
        pagar_cartao_credito();
       }
    }

}(); //Inicializa ao carregar


jQuery(document).ready(function () {

    $(window).keydown( function (event) {
    
        if(event.keyCode == 13){

            event.preventDefault();
            return false;
        }

    });

  App_checkout.init();
});