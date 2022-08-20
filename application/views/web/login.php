
    <!-- Chamando NavBar -->
    <?php $this->load->view('web/layout/navbar'); ?>


       <!-- Begin Li's Breadcrumb Area -->
      
       <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="<?php echo base_url('/'); ?>">Home</a></li>
                            <li><?php echo $titulo; ?></li>
                       </ul>
                    </div>
                </div>
            </div>

         
             <!-- Begin Login Content Area -->
             <div class="page-section mb-60">
                <div class="container">
                    <div class="row">

                        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30">
     
                  <?php if($message = $this->session->flashdata('erro')): ?>

                        <div class="alert alert-danger alert-has-icon alert-dismissible show fade">
                        <div class="alert-icon"><i class="fa fa-exclamation-circle fa-lg"></i> Atenção</div><!--<i class="far fa-lightbulb"></i> -->
                        <div class="alert-body">
                        <button class="close" data-dismiss="alert">
                            <span>&times;</span>
                            </button>
                        <?php echo $message; ?>
                        </div>
                        </div>

                        <?php endif; ?>  
                        
                            <!-- Login Form s-->
                            <?php echo form_open('login/auth'); ?>
                                <div class="login-form">
                                    <h4 class="login-title">Login</h4>
                                    <div class="row">
                                        <div class="col-md-12 col-12 mb-20">
                                            <label>E-mail *</label>
                                            <input class="mb-0" name="email" type="email" placeholder="Email" required="">
                                        </div>
                                        <div class="col-12 mb-20">
                                            <label>Senha</label>
                                            <input class="mb-0" name="password" type="password" placeholder="Senha" required="">
                                        <div class="col-md-8 mt-10 mb-20">
                                            <a href="#">Esqueceu a Senha ?</a>
                                        </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
                                                <input type="checkbox" id="remember_me">
                                                <label for="remember_me">Manter Conectado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-8 mt-10 mb-20 text-left text-md-right">
                                            <a href="#"> Ainda não tem conta? Cadastre-se</a>
                                        </div>
                                        <input type="hidden" name="login" value="login">
                                        <div class="col-md-12">
                                            <button type="submit" class="register-button mt-0">Entrar</button>
                                        </div>
                                    </div>
                                </div>
                            <?php echo form_close();  ?>
                        </div>
                    </div>
                </div>
            </div>