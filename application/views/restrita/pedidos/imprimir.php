

<!-- Main Content -->
<div class="container" style="margin-top: 3rem">
    <section class="section">
        <div class="section-body">
            <!-- add content here -->

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-block">
                            <h4><?php echo $titulo; ?></h4>
                        </div>
                        <div class="card-body">

                            <span>Dados cliente</span>

                            <p class="mt-2"><strong>Nome cliente:</strong> <?php echo $pedido->pedido_cliente_nome; ?></p>
                            <p><strong>CPF cliente:</strong> <?php echo $pedido->cliente_cpf; ?></p>
                            <p><strong>Telefone cliente:</strong> <?php echo $pedido->cliente_telefone_movel; ?></p>
                            <p><strong>E-mail cliente:</strong> <?php echo $pedido->cliente_email; ?></p>

                            <hr>

                            <span>Dados pedido</span>

                            <p class="mt-2"><strong>Situação do pedido: <?php
                                    switch ($pedido->pedido_status) {

                                        case 1:
                                            echo '<div class="badge badge-secondary badge-shadow">Aguardando pagamento</div>';
                                            break;

                                        case 2:
                                            echo '<div class="badge badge-info badge-shadow">Em análise</div>';
                                            break;

                                        case 3:
                                            echo '<div class="badge badge-success badge-shadow">Paga</div>';
                                            break;

                                        case 4:
                                            echo '<div class="badge badge-light badge-shadow">Em análise</div>';
                                            break;

                                        case 5:
                                            echo '<div class="badge badge-warning badge-shadow">Disputa</div>';
                                            break;

                                        case 6:
                                            echo '<div class="badge badge-dark badge-shadow">Devolvida</div>';
                                            break;

                                        case 7:
                                            echo '<div class="badge badge-danger badge-shadow">Cancelada</div>';
                                            break;


                                        case 8:
                                            echo '<div class="badge badge-info badge-shadow">Debitado</div>';
                                            break;

                                        case 9:
                                            echo '<div class="badge badge-primary badge-shadow">Retenção temporária</div>';
                                            break;
                                    }
                                    ?></strong></p>

                            <hr>

                            <span>Endereço de entrega</span>

                            <p class="mt-2"><strong>Endereço:</strong> <?php echo $pedido->cliente_endereco; ?> - <?php echo $pedido->cliente_numero_endereco; ?>, <?php echo $pedido->cliente_bairro; ?>, <?php echo $pedido->cliente_cidade; ?> - <?php echo $pedido->cliente_estado; ?> - CEP:&nbsp;<?php echo $pedido->cliente_cep; ?></p>
                            <p><strong>Forma de envio: <i class="fas fa-shipping-fast fa-lg"></i></strong>&nbsp;<?php echo ($pedido->pedido_forma_envio == 1 ? 'Sedex' : 'PAC'); ?></p>

                            <hr>

                            <span>Produtos do pedido</span>

                            <div class="table-responsive">
                                <table class="table table-striped data-table">
                                    <thead>
                                        <tr>
                                            <th>Produto</th>
                                            <th>Quantidade</th>
                                            <th>Valor unitário</th>
                                            <th>Valor total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($pedido_produtos as $produto): ?>
                                            <tr class="badge-">                             
                                                <td><?php echo word_limiter($produto->produto_nome, 8); ?></td>
                                                <td><?php echo $produto->produto_quantidade; ?></td>
                                                <td><?php echo 'R$&nbsp;' . number_format($produto->produto_valor_unitario, 2); ?></td>
                                                <td><?php echo 'R$&nbsp;' . number_format($produto->produto_valor_total, 2); ?></td>
                                            </tr>
                                        <?php endforeach; ?>

                                        <tr>
                                            <th colspan="3" class="text-right">Valor do frete:</th>
                                            <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_frete, 2); ?></td>
                                        </tr>
                                        <tr>
                                            <th colspan="3" class="text-right">Valor total:</th>
                                            <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_final, 2); ?></td>
                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>  
</div>

