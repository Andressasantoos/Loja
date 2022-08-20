
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
                    <h4><?php echo $titulo; ?></h4>
                    <a class="btn btn-primary float-right" href="<?php echo base_url('restrita/clientes/core'); ?>">Cadastrar</a>
                  </div>

                  <div class="card-body">

                  <?php if($message = $this->session->flashdata('sucesso')): ?>

                    <div class="alert alert-success alert-has-icon alert-dismissible show fade">
                      <div class="alert-icon"><i class="fa fa-check-circle fa-lg"></i></div>
                      <div class="alert-body">
                      <button class="close" data-dismiss="alert">
                          <span>&times;</span>
                        </button>
                        <div class="alert-title">Sucesso!</div>
                      <?php echo $message; ?>
                      </div>
                    </div>

                    <?php endif; ?>  

                  <?php if($message = $this->session->flashdata('erro')): ?>

                    <div class="alert alert-danger alert-has-icon alert-dismissible show fade">
                      <div class="alert-icon"><i class="fa fa-exclamation-circle fa-lg"></i></div><!--<i class="far fa-lightbulb"></i> -->
                      <div class="alert-body">
                      <button class="close" data-dismiss="alert">
                          <span>&times;</span>
                        </button>
                        <div class="alert-title">Atenção</div>
                       <?php echo $message; ?>
                      </div>
                    </div>

                  <?php endif; ?>  

                    <div class="table-responsive">
                      <table class="table table-striped data-table">
                        <thead>
                          <tr>
                            <th class="text-center">
                              #
                            </th>
                            <th class="text-center">Nome Completo</th>
                            <th class="text-center">Data de Nascimento</th>
                            <th class="text-center">CPF</th>
                            <th class="text-center">Celular</th>
                          </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($clientes as $cliente): ?>
                          <tr> 
                                <td class="text-center"><?php echo $cliente->cliente_id ?></td>
                                <td class="text-center"><?php echo $cliente->cliente_nome . ' '.$cliente->cliente_sobrenome ?></td>
                                <td class="text-center"><?php echo formata_data_banco_sem_hora($cliente->cliente_data_nascimento) ?></td>
                                <td class="text-center"><?php echo $cliente->cliente_cpf?></td>
                                <td class="text-center"><?php echo $cliente->cliente_telefone_movel ?></td>
                            <td class="text-center">
                                <a href="<?php echo base_url('restrita/clientes/core/'.$cliente->cliente_id); ?>" class="btn btn-icon btn-primary"><i class="far fa-edit"></i></a>
                                <a href="<?php echo base_url('restrita/clientes/delete/'.$cliente->cliente_id); ?>" class="btn btn-icon btn-danger delete"><i class="fas fa-trash-alt"></i></a>
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

       <?php $this->load->view('restrita/layout/sidebar-settings'); ?>
      
     </div>

     