

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

                            <?php if (isset($produtos)): ?>

                                <div class="table-responsive">
                                    <table class="table table-striped data-table">
                                        <thead>
                                            <tr>
                                                <th>Nome do produto</th>
                                                <th>Valor unitário</th>
                                                <th class="text-center">Quantidade vendidos</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php foreach ($produtos as $produto): ?>
                                                <tr>                             
                                                    <td><?php echo word_limiter($produto->produto_nome, 8); ?></td>
                                                    <td><?php echo 'R$&nbsp;' . number_format($produto->produto_valor_unitario, 2); ?></td>
                                                    <td class="text-center"><div class="badge badge-primary badge-shadow"><?php echo $produto->vendidos; ?></div></td>
                                                </tr>
                                            <?php endforeach; ?>

                                        </tbody>
                                    </table>
                                </div>

                            <?php else: ?>

                                <p class="text-center">NÃO FORAM ENCONTRADOS DADOS DE PRODUTOS MAIS VENDIDOS</p>


                            <?php endif; ?>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>  
</div>

