

<?php $this->load->view('web/layout/navbar'); ?>


<!-- Begin Li's Breadcrumb Area -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="breadcrumb-content">
            <ul>
                <li><a href="<?php echo base_url('/'); ?>">Home</a></li>
                <li class="active"><?php echo $titulo; ?></li>
            </ul>
        </div>
    </div>
</div>


<!-- Begin Frequently Area -->
<div class="frequently-area pt-60 pb-50">
    <div class="container">
        <div class="row">


            <?php if (isset($pedidos) && !empty($pedidos)): ?>

                <div class="col-md-12">
                    <div class="frequently-content">
                        <div class="frequently-desc">
                            <h3>Olá, <?php echo $this->session->userdata('cliente_nome_completo'); ?></h3>
                            <p>Listando os seus pedidos</p>
                        </div>
                    </div>
                    <!-- Begin Frequently Accordin -->

                    <?php $i = 1; //contador ?>

                    <?php foreach ($pedidos as $pedido): ?>

                        <div class="frequently-accordion">


                            <div id="accordion-<?php echo $i; ?>">
                                <div class="card actives">
                                    <div class="card-header" id="heading-<?php echo $i; ?>">
                                        <h5 class="mb-0">
                                            <a class="" data-toggle="collapse" data-target="#collapse-<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne">
                                                <i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Pedido&nbsp;<?php echo $pedido->pedido_codigo; ?>&nbsp;&nbsp;<?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro); ?>
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapse-<?php echo $i; ?>" class="collapse" aria-labelledby="headingOne" data-parent="#accordion-<?php echo $i; ?>">
                                        <div class="card-body">

                                            <div class="table-content table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th class="li-product-thumbnail">Imagem</th>
                                                            <th class="cart-product-name">Data do pedido</th>
                                                            <th class="cart-product-name">Produto</th>
                                                            <th class="li-product-quantity">Situação</th>
                                                            <th class="li-product-subtotal">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>



                                                        <tr>
                                                            <td class="li-product-thumbnail"><img width="50" src="<?php echo base_url('uploads/produtos/small/' . $pedido->foto_caminho); ?>"></td>
                                                            <td class="li-product-name px-0" style="font-size: 14px"><?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro); ?></td>
                                                            <td class="li-product-name px-0" style="font-size: 14px"><?php echo word_limiter($pedido->produto_nome, 5); ?></td>
                                                            <td class="li-product-name px-0" style="font-size: 14px">


                                                                <?php
                                                                switch ($pedido->pedido_status) {

                                                                    case 1:
                                                                        echo 'Aguardando pagamento';
                                                                        break;

                                                                    case 2:
                                                                        echo 'Em análise';
                                                                        break;

                                                                    case 3:
                                                                        echo 'Paga';
                                                                        break;

                                                                    case 4:
                                                                        echo 'Disponível';
                                                                        break;

                                                                    case 5:
                                                                        echo 'Em disputa';
                                                                        break;

                                                                    case 6:
                                                                        echo 'Devolvida';
                                                                        break;

                                                                    case 7:
                                                                        echo 'Cancelada';
                                                                        break;


                                                                    case 8:
                                                                        echo 'Debitado';
                                                                        break;

                                                                    case 9:
                                                                        echo 'Retenção temporária';
                                                                        break;
                                                                }
                                                                ?>



                                                            </td>


                                                            <td class="product-subtotal" style="font-size: 14px"><span class="amount">R$&nbsp;<?php echo number_format($pedido->pedido_valor_final, 2); ?></span></td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <?php $i++; //Incremetando o contador      ?>

                    <?php endforeach; ?>
                    <!--Frequently Accordin End Here -->
                </div>


            <?php else: ?>

                <div class="col-12 pt-20">

                    <h6 class="mb-30">Você ainda não realizou nenhuma compra</h6>

                    <div class="coupon-all">
                        <div class="coupon">
                            <a href="<?php echo base_url('/'); ?>" class="button"><input class="button" value="que tal comprar agora?" style="width: 260px"></a>
                        </div>
                    </div>
                    <div class="container text-center">
                        <img width="35%" src="<?php echo base_url('public/web/images/sem_pedidos.svg'); ?>" >
                    </div>

                </div>

            <?php endif; ?>



        </div>
    </div>
</div>
<!--Frequently Area End Here -->


