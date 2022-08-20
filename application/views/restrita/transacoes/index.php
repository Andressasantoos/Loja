
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
                            <a id="btn-atualizar-massa" class="btn btn-danger float-right" data-confirm="Esta ação atualizará todas as transações e leverá um tempo para ser conluída de acordo com a resposta do sandbox do pagseguro. Tem certeza que quer prosseguir?" href="<?php echo base_url('restrita/transacoes/atualizar'); ?>"><i class="fas fa-exclamation-triangle"></i>&nbsp;Atualizar em massa</a>
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
                                            <th>Transação</th>
                                            <th>Data</th>
                                            <th>Método de pagamento</th>
                                            <th>Situação</th>
                                            <th class="nosort">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($transacoes as $transacao): ?>
                                            <tr class="badge-">                             
                                                <td><?php echo $transacao->transacao_codigo_hash; ?></td>
                                                <td><?php echo formata_data_banco_com_hora($transacao->transacao_data); ?></td>
                                                <td>

                                                    <?php
                                                    switch ($transacao->transacao_tipo_metodo_pagamento) {

                                                        case 1:
                                                            echo '<div class="badge badge-success badge-shadow"><i class="fas fa-credit-card"></i>&nbsp;Cartão de crédito</div>';
                                                            break;

                                                        case 2:
                                                            echo '<div class="badge badge-dark badge-shadow"><i class="fas fa-barcode"></i>&nbsp;Boleto bancário</div>';
                                                            break;

                                                        default :
                                                            echo '<div class="badge badge-primary badge-shadow"><i class="fas fa-exchange-alt"></i>&nbsp;Transferência bancária</div>';
                                                            break;
                                                    }
                                                    ?>

                                                </td>

                                                <td>

                                                    <?php
                                                    switch ($transacao->transacao_status) {

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

                                                        default :
                                                            echo '<div class="badge bg-secondary badge-shadow">Status desconhecido</div>';
                                                            break;
                                                    }
                                                    ?>

                                                </td>

                                                <td>
                                                    <a data-toggle="tooltip" data-title="Detalhar a transação" href="<?php echo base_url('restrita/transacoes/view/' . $transacao->transacao_id); ?>" class="btn btn-icon btn-primary mr-2"><i class="fas fa-eye fa-lg"></i></a>
                                                    <a data-toggle="tooltip" data-title="Atualizar o status da transação" href="<?php echo base_url('restrita/transacoes/atualizar/' . $transacao->transacao_codigo_hash); ?>" class="btn btn-icon btn-success mr-2"><i class="fas fa-edit"></i></a>
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

