
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

                  <?php echo form_open('restrita/sistema/'); ?>

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

                      <div class="form-group col-md-3">
                        <label for="inputEmail4">Razão Social</label>
                        <input type="text" class="form-control" name="sistema_razao_social" placeholder="Razão Social" value="<?php echo (isset($sistema) ? $sistema->sistema_razao_social : set_value('sistema_razao_social') ) ?>">                                                     
                        <?php echo form_error('sistema_razao_social', '<div class="text-danger">', '</div>'); ?>
                      </div>

                     <div class="form-group col-md-3">
                        <label for="inputEmail4">Nome Fantasia</label>
                        <input type="text" class="form-control" name="sistema_nome_fantasia" placeholder="Nome Fantasia" value="<?php echo (isset($sistema) ? $sistema->sistema_nome_fantasia : set_value('sistema_nome_fantasia') ) ?>">                                                     
                        <?php echo form_error('sistema_nome_fantasia', '<div class="text-danger">', '</div>'); ?>
                      </div>

                      <div class="form-group col-md-3">
                        <label for="inputEmail4">CNPJ</label>
                        <input type="text" class="form-control cnpj" name="sistema_cnpj" placeholder="CNPJ" value="<?php echo (isset($sistema) ? $sistema->sistema_cnpj : set_value('sistema_cnpj') ) ?>">                                                     
                        <?php echo form_error('sistema_cnpj', '<div class="text-danger">', '</div>'); ?>
                      </div>

                     <div class="form-group col-md-3">
                        <label for="inputEmail4">Inscrição Estadual</label>
                        <input type="text" class="form-control" name="sistema_ie" placeholder="Inscrição Estadual" value="<?php echo (isset($sistema) ? $sistema->sistema_ie : set_value('sistema_ie') ) ?>">                                                     
                        <?php echo form_error('sistema_ie', '<div class="text-danger">', '</div>'); ?>
                      </div>
                  
                    </div>

                    
                  <div class="form-row">

                    <div class="form-group col-md-3">
                      <label for="inputEmail4">Telefone Fixo</label>
                      <input type="text" class="form-control phone_with_ddd" name="sistema_telefone_fixo" placeholder="Telefone Fixo" value="<?php echo (isset($sistema) ? $sistema->sistema_telefone_fixo : set_value('sistema_telefone_fixo') ) ?>">                                                     
                      <?php echo form_error('sistema_telefone_fixo', '<div class="text-danger">', '</div>'); ?>
                    </div>

                    <div class="form-group col-md-3">
                      <label for="inputEmail4">Celular</label>
                      <input type="text" class="form-control sp_celphones" name="sistema_telefone_movel" placeholder="Celular" value="<?php echo (isset($sistema) ? $sistema->sistema_telefone_movel : set_value('sistema_telefone_movel') ) ?>">                                                     
                      <?php echo form_error('sistema_telefone_movel', '<div class="text-danger">', '</div>'); ?>
                    </div>

                    <div class="form-group col-md-3">
                      <label for="inputEmail4">E-mail</label>
                      <input type="email" class="form-control" name="sistema_email" placeholder="E-mail" value="<?php echo (isset($sistema) ? $sistema->sistema_email : set_value('sistema_email') ) ?>">                                                     
                      <?php echo form_error('sistema_email', '<div class="text-danger">', '</div>'); ?>
                    </div>

                    <div class="form-group col-md-3">
                      <label for="inputEmail4">URL do Site</label>
                      <input type="url" class="form-control" name="sistema_site_url" placeholder="Site" value="<?php echo (isset($sistema) ? $sistema->sistema_site_url : set_value('sistema_site_url') ) ?>">                                                     
                      <?php echo form_error('sistema_site_url', '<div class="text-danger">', '</div>'); ?>
                    </div>

                    </div>
 
                    <div class="form-row">

                        <div class="form-group col-md-2">
                          <label for="inputEmail4">CEP</label>
                          <input type="text" class="form-control cep" name="sistema_cep" placeholder="CEP" value="<?php echo (isset($sistema) ? $sistema->sistema_cep : set_value('sistema_cep') ) ?>">                                                     
                          <?php echo form_error('sistema_cep', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-4">
                          <label for="inputEmail4">Endereço</label>
                          <input type="text" class="form-control" name="sistema_endereco" placeholder="Endereço" value="<?php echo (isset($sistema) ? $sistema->sistema_endereco : set_value('sistema_endereco') ) ?>">                                                     
                          <?php echo form_error('sistema_endereco', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-2">
                          <label for="inputEmail4">Numero</label>
                          <input type="text" class="form-control" name="sistema_numero" placeholder="Numero" value="<?php echo (isset($sistema) ? $sistema->sistema_numero : set_value('sistema_numero') ) ?>">                                                     
                          <?php echo form_error('sistema_numero', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-3">
                          <label for="inputEmail4">Cidade</label>
                          <input type="text" class="form-control" name="sistema_cidade" placeholder="Cidade" value="<?php echo (isset($sistema) ? $sistema->sistema_cidade : set_value('sistema_cidade') ) ?>">                                                     
                          <?php echo form_error('sistema_cidade', '<div class="text-danger">', '</div>'); ?>
                        </div>

                        <div class="form-group col-md-1">
                          <label for="inputEmail4">UF</label>
                          <input type="text" class="form-control uf" name="sistema_estado" placeholder="UF" value="<?php echo (isset($sistema) ? $sistema->sistema_estado : set_value('sistema_estado') ) ?>">                                                     
                          <?php echo form_error('sistema_estado', '<div class="text-danger">', '</div>'); ?>
                        </div>

                      </div>

                      <div class="form-row">

                        <div class="form-group col-md-5">
                          <label for="inputEmail4">Quantidade de Produtos em Destaques</label>
                          <input type="number" class="form-control" name="sistema_produtos_destaques" placeholder="Quantidade de Produtos em Destaques" value="<?php echo (isset($sistema) ? $sistema->sistema_produtos_destaques : set_value('sistema_produtos_destaques') ) ?>">                                                     
                          <?php echo form_error('sistema_produtos_destaques', '<div class="text-danger">', '</div>'); ?>
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

     