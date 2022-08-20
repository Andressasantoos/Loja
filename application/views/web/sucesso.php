
    <!-- Chamando NavBar -->
    <?php $this->load->view('web/layout/navbar'); ?>


       <!-- Begin Li's Breadcrumb Area -->
      
       <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="<?php echo base_url('/'); ?>">Home</a></li>
                            <li><?php echo $titulo; ?></li>
                       </ul>
                    </div>
                </div>
            </div>

         
            
            <!--Shopping Cart Area Strat-->
            <div class="Shopping-cart-area pt-60 pb-60">
                <div class="container">
                    <div class="row">
 
                     <div class="container text-center pt-20 text-success">

                     
                       <?php foreach($pedido_realizado as $pedido): ?>

                            <h5 class="mb-20"><?php echo $pedido->cliente_nome_completo; ?></h5>
                            <h6 class="mb-20"><?php echo $pedido->mensagem; ?></h6>

                            <div class="bg-primary badge text-white" style="padding: 1rem; font-size: 16px;">
                            
                            <?php echo $pedido->pedido_gerado; ?>

                            </div>
                           
                            <?php if($pedido->forma_pagamento != 1): ?>

                                <div class="mt-20">

                                <a href="<?php echo $pedido->transacao_link_pagamento; ?>" target="_blank">

                                <?php echo ($pedido->forma_pagamento == 2 ? '<i class="fa fa-barcode fa-5x"></i>' : '<i class="fa fa-university fa-5x"></i>') ?>

                                    <p class="text-success mt-3"><?php echo ($pedido->forma_pagamento == 2 ? 'Imprimir Boleto' : 'Concluir pagamento no ambiente seguro do seu banco'); ?></p>
                                </a> 

                                </div>

                            <?php endif; ?>    

                        <?php endforeach; ?>    
                     </div>

                    </div>
                </div>
            </div>
            <!--Shopping Cart Area End-->
           
