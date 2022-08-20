

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

                            <?php if (isset($pedidos)): ?>

                                <div class="table-responsive">
                                    <table class="table table-striped data-table">
                                        <thead>
                                            <tr>
                                                <th>Pedido</th>
                                                <th>Data</th>
                                                <th>Cliente</th>
                                                <th>Frete</th>
                                                <th>Situção</th>
                                                <th>Valor dos produtos</th>
                                                <th>Valor do frete</th>
                                                <th>Valor final</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            $grand_total_fretes = 0;
                                            $grand_total_pedidos = 0;
                                            ?>
                                            <?php foreach ($pedidos as $pedido): ?>


                                                <?php
                                                $grand_total_fretes += $pedido->pedido_valor_frete;
                                                $grand_total_pedidos += $pedido->pedido_valor_final;
                                                ?>

                                                <tr class="badge-">                             
                                                    <td><?php echo $pedido->pedido_codigo; ?></td>
                                                    <td><?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro); ?></td>
                                                    <td><?php echo $pedido->pedido_cliente_nome; ?></td>
                                                    <td><?php echo ($pedido->pedido_forma_envio == 1 ? 'Sedex' : 'PAC'); ?></td>
                                                    <td><?php
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
                                                        ?></td>


                                                    <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_produtos, 2); ?></td>
                                                    <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_frete, 2); ?></td>
                                                    <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_final, 2); ?></td>
                                                </tr>
                                            <?php endforeach; ?>

                                            <tr>
                                                <th colspan="6" class="text-right">Grand totais:</th>
                                                <td><?php echo 'R$&nbsp;' . number_format($grand_total_fretes, 2); ?></td>
                                                <td><?php echo 'R$&nbsp;' . number_format($grand_total_pedidos, 2); ?></td>
                                            </tr>



                                        </tbody>
                                    </table>
                                </div>

                            <?php else: ?>

                                <p class="text-center">NÃO FORAM REALIZADOS PEDIDOS NO DIA DE HOJE</p>


                            <?php endif; ?>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>  
</div>

