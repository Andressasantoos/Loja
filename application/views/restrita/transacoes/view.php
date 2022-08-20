
<?php $this->load->view('restrita/layout/navbar'); ?>

<?php $this->load->view('restrita/layout/sidebar'); ?>


<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-body">
            <!-- add content here -->

            <div class="row">

                <div class="col-12 col-md-4 col-lg-4">
                    <div class="pricing pricing-highlight">
                        <div class="pricing-title p-3" style="font-size: 18px">
                            <a target="_blank" class="text-white" href="<?php echo base_url('restrita/pedidos/imprimir/' . $transacao->pedido_codigo); ?>">Pedido&nbsp;<?php echo $transacao->pedido_codigo; ?></a>
                        </div>
                        <div class="pricing-padding text-left">
                            <div class="pricing-price">
                                <div>

                                    <?php
                                    switch ($transacao->transacao_status) {

                                        case 1:
                                            echo '<div class="badge badge-secondary badge-shadow" style="font-size: 12px">Aguardando pagamento</div>';
                                            break;

                                        case 2:
                                            echo '<div class="badge badge-info badge-shadow" style="font-size: 12px">Em análise</div>';
                                            break;

                                        case 3:
                                            echo '<div class="badge badge-success badge-shadow" style="font-size: 12px">Paga</div>';
                                            break;

                                        case 4:
                                            echo '<div class="badge badge-light badge-shadow" style="font-size: 12px">Em análise</div>';
                                            break;

                                        case 5:
                                            echo '<div class="badge badge-warning badge-shadow" style="font-size: 12px">Disputa</div>';
                                            break;

                                        case 6:
                                            echo '<div class="badge badge-dark badge-shadow" style="font-size: 12px">Devolvida</div>';
                                            break;

                                        case 7:
                                            echo '<div class="badge badge-danger badge-shadow" style="font-size: 12px">Cancelada</div>';
                                            break;


                                        case 8:
                                            echo '<div class="badge badge-info badge-shadow" style="font-size: 12px">Debitado</div>';
                                            break;

                                        case 9:
                                            echo '<div class="badge badge-primary badge-shadow" style="font-size: 12px">Retenção temporária</div>';
                                            break;
                                    }
                                    ?>


                                </div>
                                <div><?php echo $transacao->pedido_cliente_nome; ?></div>
                            </div>



                            <div class="pricing-details">

                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-red" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-clock text-white"></i></div>
                                    <div class="pricing-item-label pt-1">Data da transação:&nbsp;<?php echo formata_data_banco_com_hora($transacao->transacao_data); ?></div>                                   
                                </div>


                                <?php if ($transacao->transacao_tipo_metodo_pagamento == 2 || $transacao->transacao_tipo_metodo_pagamento == 3): ?>


                                    <div class="pricing-item">
                                        <div class="pricing-item-icon bg-info" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-link"></i></div>
                                        <div class="pricing-item-label pt-1"><a target="_blank" title="Link de pagamento" href="<?php echo $transacao->transacao_link_pagamento; ?>">Clique aqui para visualizar o link de pagamento</a></div>                                   
                                    </div>


                                <?php endif; ?>



                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-success" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-dollar-sign"></i></div>
                                    <div class="pricing-item-label pt-1">Forma de pagamento: &nbsp;

                                        <?php
                                        switch ($transacao->transacao_tipo_metodo_pagamento) {

                                            case 1:
                                                echo 'Cartão de crédito';
                                                break;

                                            case 2:
                                                echo 'Boleto bancário';
                                                break;

                                            default :
                                                echo 'Transferência bancária';
                                                break;
                                        }
                                        ?>


                                    </div>                                   
                                </div>



                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-primary" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-hand-holding-usd"></i></div>
                                    <div class="pricing-item-label pt-1">Valor bruto da transação:&nbsp;R$&nbsp;<?php echo number_format($transacao->transacao_valor_bruto, 2); ?></div>                                   
                                </div>

                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-warning" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-comment-dollar"></i></div>
                                    <div class="pricing-item-label pt-1">Valor taxa intermediador:&nbsp;R$&nbsp;<?php echo number_format($transacao->transacao_valor_taxa_pagseguro, 2); ?></div>                                   
                                </div>

                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-teal" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-funnel-dollar"></i></div>
                                    <div class="pricing-item-label pt-1">Valor líquido da transação:&nbsp;R$&nbsp;<?php echo number_format($transacao->transacao_valor_liquido, 2); ?></div>                                   
                                </div>

                                <div class="pricing-item">
                                    <div class="pricing-item-icon bg-secondary" style="width: 30px; height: 30px; line-height: 30px"><i class="fas fa-chart-bar text-dark"></i></div>
                                    <div class="pricing-item-label pt-1">Número de parcelas:&nbsp;<?php echo $transacao->transacao_numero_parcelas; ?></div>                                   
                                </div>

                            </div>

                        </div>
                        <div class="pricing-cta">
                            <a href="<?php echo base_url('restrita/transacoes'); ?>"><i class="fas fa-arrow-left"></i>&nbsp;Voltar</a>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </section>

    <?php $this->load->view('restrita/layout/sidebar_settings'); ?>       
</div>

