
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
                  <div class="card-header">
                    <h4><?php echo $titulo; ?></h4>
                  </div>

                  <?php echo form_open('restrita/sistema/correios/'); ?>

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
 
                    <div class="form-row">

                        <div class="form-group col-md-2">
                          <label for="inputEmail4">CEP de Origem</label>
                          <input type="text" class="form-control cep" name="config_cep_origem" placeholder="CEP de Origem" value="<?php echo (isset($correio) ? $correio->config_cep_origem : set_value('config_cep_origem') ) ?>">                                                     
                          <?php echo form_error('config_cep_origem', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-2">
                          <label for="inputEmail4">Código de Serviço Pac</label>
                          <input type="text" class="form-control" name="config_codigo_pac" placeholder="COD Serviço Pac" value="<?php echo (isset($correio) ? $correio->config_codigo_pac : set_value('config_codigo_pac') ) ?>">                                                     
                          <?php echo form_error('config_codigo_pac', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-2">
                          <label for="inputEmail4">Código do Serviço Sedex</label>
                          <input type="text" class="form-control codigo_servico_correios" name="config_codigo_sedex" placeholder="COD Serviço Sedex" value="<?php echo (isset($correio) ? $correio->config_codigo_sedex : set_value('config_codigo_sedex') ) ?>">                                                     
                          <?php echo form_error('config_codigo_sedex', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-3">
                          <label for="inputEmail4">Valor adicionado ao frete</label>
                          <input type="text" class="form-control money2" name="config_somar_frete" placeholder="Valor a ser somado ao frete" value="<?php echo (isset($correio) ? $correio->config_somar_frete : set_value('config_somar_frete') ) ?>">                                                     
                          <?php echo form_error('config_somar_frete', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-3">
                          <label for="inputEmail4">Valor Declarado</label>
                          <input type="text" class="form-control money2" name="config_valor_declarado" placeholder="Valor Declarado" value="<?php echo (isset($correio) ? $correio->config_valor_declarado : set_value('config_valor_declarado') ) ?>">                                                     
                          <?php echo form_error('config_valor_declarado', '<div class="text-danger">', '</div>'); ?>
                        </div>

                      </div>


                  <div class="card-footer">
                    <button class="btn btn-primary mr-2">Salvar</button>
                  </div>

                  <?php echo form_close(); ?>

                </div>
              </div>
            </div>

         </div>
       </section>

       <?php $this->load->view('restrita/layout/sidebar-settings'); ?>
      
     </div>

     