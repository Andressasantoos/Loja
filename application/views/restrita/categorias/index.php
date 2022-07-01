
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
                    <a class="btn btn-primary float-right" href="<?php echo base_url('restrita/categorias/core'); ?>">Cadastrar</a>
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
                            <th class="text-center"> # </th>
                            <th class="text-center">Categoria</th>
                            <th class="text-center">Meta Link da Categoria</th>
                            <th class="text-center">Data de criação</th>
                            <th class="text-center">Ativa</th>
                            <th class="nosort text-center">Ação</th>
                          </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($categorias as $categoria): ?>
                          <tr> 
                                <td class="text-center"><?php echo $categoria->categoria_id; ?></td>
                                <td class="text-center"><?php echo $categoria->categoria_nome; ?></td>
                                <td class="text-center"><i data-feather="link-2" class="text-info"></i>&nbsp;<?php echo $categoria->categoria_meta_link; ?></td>
                                <td class="text-center"><?php echo formata_data_banco_com_hora($categoria->categoria_data_criacao); ?></td>
                                <td class="text-center"><?php echo ($categoria->categoria_ativa == 1 ? ' <span class="badge badge-success">Ativa</span>' : '<span class="badge badge-danger">Inativa</span>' ) ?></td>
                            
                            <td class="text-center">
                                <a href="<?php echo base_url('restrita/categorias/core/'.$categoria->categoria_id); ?>" class="btn btn-icon btn-primary"><i class="far fa-edit"></i></a>
                                <a href="<?php echo base_url('restrita/categorias/delete/'.$categoria->categoria_id); ?>" class="btn btn-icon btn-danger delete"><i class="fas fa-trash-alt"></i></a>
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

     