
<?php $this->load->view('restrita/layout/navbar'); ?>

<?php $this->load->view('restrita/layout/sidebar'); ?>


<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-body">
            <!-- add content here -->

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-block">
                            <h4 class="mb-4"><?php echo $titulo; ?></h4>
                            <div class="dropdown d-inline mr-2">
                                <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Relatórios
                                </button>
                                <div class="dropdown-menu">
                                    <a target="_blank" class="dropdown-item" href="<?php echo base_url('restrita/pedidos/diarias'); ?>">Vendas diárias</a>
                                    <a target="_blank" class="dropdown-item" href="<?php echo base_url('restrita/pedidos/vendidos'); ?>">Produtos mais vendidos</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">

                            <?php if ($message = $this->session->flashdata('sucesso')): ?>

                                <div class="alert alert-success alert-has-icon alert-dismissible show fade">
                                    <div class="alert-icon"><i class="fa fa-check-circle fa-lg"></i></div>
                                    <div class="alert-body">
                                        <div class="alert-title">Perfeito!</div>
                                        <button class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        <?php echo $message; ?>
                                    </div>
                                </div>

                            <?php endif; ?>


                            <?php if ($message = $this->session->flashdata('erro')): ?>

                                <div class="alert alert-danger alert-has-icon alert-dismissible show fade">
                                    <div class="alert-icon"><i class="fa fa-exclamation-circle fa-lg"></i></div>
                                    <div class="alert-body">
                                        <div class="alert-title">Atenção!</div>
                                        <button class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        <?php echo $message; ?>
                                    </div>
                                </div>

                            <?php endif; ?>

                            <div class="table-responsive">
                                <table class="table table-striped data-table">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>Data do pedido</th>
                                            <th>Cliente</th>
                                            <th>Valor do pedido</th>
                                            <th>Situação</th>
                                            <th class="nosort">Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($pedidos as $pedido): ?>
                                            <tr class="badge-">                             
                                                <td><?php echo $pedido->pedido_codigo; ?></td>
                                                <td><?php echo formata_data_banco_com_hora($pedido->pedido_data_cadastro); ?></td>
                                                <td><?php echo $pedido->pedido_cliente_nome; ?></td>
                                                <td><?php echo 'R$&nbsp;' . number_format($pedido->pedido_valor_final, 2); ?></td>
                                                <td>

                                                    <?php
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
                                                    ?>

                                                </td>

                                                <td>
                                                    <a target="_blank" href="<?php echo base_url('restrita/pedidos/imprimir/' . $pedido->pedido_codigo); ?>" class="btn btn-icon btn-primary mr-2"><i class="fas fa-print fa-lg"></i></a>
                                                </td>

                                            </tr>
                                        <?php endforeach; ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <?php $this->load->view('restrita/layout/sidebar_settings'); ?>       
</div>

