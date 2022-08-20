
    <!-- Chamando NavBar -->
    <?php $this->load->view('web/layout/navbar'); ?>


       <!-- Begin Li's Breadcrumb Area -->
      
       <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="<?php echo base_url('/'); ?>">Home</a></li>
                            <li><a href="<?php echo base_url('master/'.$produto->categoria_pai_meta_link); ?>"><?php echo $produto->categoria_pai_nome; ?></a></li>
                            <li class="active"><a href="<?php echo base_url('categoria/'.$produto->categoria_meta_link); ?>"><?php echo $produto->categoria_nome; ?></a></li>
                        </ul>
                    </div>
                </div>
            </div>

            
            <!-- Li's Breadcrumb Area End Here -->
            <!-- content-wraper start -->
            <div class="content-wraper">
                <div class="container">
                    <div class="row single-product-area " style="align-self:center">
                        <div class="col-lg-5 col-md-6 align-self-center">
                           <!-- Product Details Left -->
                            <div class="product-details-left">
                                <div class="product-details-images slider-navigation-1">

                                <?php foreach($fotos_produtos as $foto): ?>
                                    <div class="lg-image">
                                        <a class="popup-img venobox vbox-item" href="<?php echo base_url('uploads/produtos/small/' . $foto->foto_caminho); ?>" data-gall="myGallery">
                                            <img src="<?php echo base_url('uploads/produtos/' . $foto->foto_caminho); ?>" alt="<?php echo $produto->produto_nome ?>">
                                        </a>
                                    </div>
                                <?php endforeach; ?>

                                </div>
                                <div class="product-details-thumbs slider-thumbs-1"> 
                                <?php foreach($fotos_produtos as $foto): ?>                                       
                                    <div class="sm-image"><img src="<?php echo base_url('uploads/produtos/small/' . $foto->foto_caminho); ?>" alt="<?php echo $produto->produto_nome ?>"></div>
                                 <?php endforeach; ?>
                                </div>
                            </div>
                            <!--// Product Details Left  #fed700-->
                        </div>

                        <div class="col-lg-7 col-md-6">
                            <div class="product-details-view-content pt-60">
                                <div class="product-info">
                                    <h2><?php echo $produto->produto_nome;  ?></h2>
                                    <span class="product-details-ref">Código: <?php echo $produto->produto_codigo;  ?></span>
                                    <p class="mt-5"><span class="product-details-ref">Marca: <a href="<?php echo base_url('marca/'.$produto->marca_meta_link); ?>"><?php echo $produto->marca_nome ?></a></span></p>
                                    <div class="rating-box pt-20">
                                        <ul class="rating rating-with-review-item">
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="review-item"><a href="#">Avaliações</a></li>
                                            <li class="review-item"><a href="#">Escreva Avaliação</a></li>
                                        </ul>
                                    </div>
                                    <div class="price-box pt-20">
                                        <span class="new-price new-price-2"><?php echo 'R$ ' . number_format($produto->produto_valor, 2);  ?></span>       <!-- class="badge badge-info" -->
                                        <p class="mt-10"><span class="product-details-ref"><?php echo ($produto->produto_quantidade_estoque > 0 ? 'Estoque: <span style="font-size="14px"">'.$produto->produto_quantidade_estoque.'</span>'  : '<span style="color:red"><strong>Produto Indisponivel</strong></span>' ) ?> </span></p>
                                  
                                    </div>

                                    <div class="single-add-to-cart">

                                     <?php
                                      
                                       $atributos = array(
                                         'class' => 'cart-quantity',
                                       );  

                                     ?>

                                        <?php echo form_open('ajax', $atributos); ?>

                                            <div class="quantity">
                                                <label>Calcular Frete</label>
                                                <div class="" style="min-width: 140px; float: left; margin-right: 10px; position: relative; text-align: left">
                                                    <input type="text" id="cep" name="cep" class="cart-plus-minus-box cep" placeholder="Informe seu CEP">
                                                </div>
                                            </div>

                                            <button type="button" id="btn-calcula-frete" name="produto_id" data-id="<?php echo $produto->produto_id; ?>" class="add-to-cart bg-info" style="padding: 12px 20px;">Calcular</button>
                                       
                                            <div class="pt-10 text-info" id="retorno-frete">
                                              
                                            </div>

                                            <?php echo form_close(); ?>

                                    </div>

                                    

                                    <div class="single-add-to-cart">

                                  <?php if($produto->produto_quantidade_estoque > 0): ?>
                                    
                                    <?php
                                      
                                      $atributos = array(
                                        'class' => 'cart-quantity',
                                      );  

                                    ?>

                                       <?php echo form_open('carrinho', $atributos); ?>
                                       
                                            <div class="quantity">
                                                <label>Quantidade</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box mask-produto-qty" name="produto_quantidade" id="produto_quantidade" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                </div>
                                            </div>
                                            <button class="add-to-cart btn-add-produto" data-id="<?php echo $produto->produto_id; ?>" type="button">Adicionar ao Carrinho</button>
                                            <div id="mensagem" style="max-width: 330px">

                                            </div> 

                                       <?php echo form_close(); ?>

                                       <?php else: ?>

                                        <div class="cart-quantity">
                                          <button class="add-to-cart bg-danger" style="color:white;" type="button">Indisponivel</button>
                                       </div>

                                        <?php endif; ?>

                                    </div>


                                    <div class="product-additional-info pt-25">
                                        <a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Add aos Favoritos</a>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
            <!-- content-wraper end -->
            <!-- Begin Product Area -->
            <div class="product-area pt-35">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="li-product-tab">
                                <ul class="nav li-product-menu">
                                   <li><a class="active" data-toggle="tab" href="#description"><span>Descrição</span></a></li>
                                   <li><a data-toggle="tab" href="#reviews"><span>Avaliações</span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="description" class="tab-pane active show" role="tabpanel">
                            <div class="product-description">
                                <span><?php echo $produto->produto_descricao; ?></span>
                            </div>
                        </div>
                        <div id="reviews" class="tab-pane" role="tabpanel">
                            <div class="product-reviews">
                                <div class="product-details-comment-block">
                                    <div class="comment-review">
                                        <span>Grade</span>
                                        <ul class="rating">
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                    </div>
                                    <div class="comment-author-infos pt-25">
                                        <span>HTML 5</span>
                                        <em>01-12-18</em>
                                    </div>
                                    <div class="comment-details">
                                        <h4 class="title-block">Demo</h4>
                                        <p>Plaza</p>
                                    </div>
                                    <div class="review-btn">
                                        <a class="review-links" href="#" data-toggle="modal" data-target="#mymodal">Write Your Review!</a>
                                    </div>
                                    <!-- Begin Quick View | Modal Area -->
                                    <div class="modal fade modal-wrapper" id="mymodal" >
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <h3 class="review-page-title">Escreva sua Avaliação</h3>
                                                    <div class="modal-inner-area row">
                                                        <div class="col-lg-6">
                                                           <div class="li-review-product">
                                                               <img src="images/product/large-size/3.jpg" alt="Li's Product">
                                                               <div class="li-review-product-desc">
                                                                   <p class="li-product-name">Today is a good day Framed poster</p>
                                                                   <p>
                                                                       <span>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant 360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With Exquisite Sound via Ring Radiator Technology. Stream And Control R3 Speakers Wirelessly With Your Smartphone. Sophisticated, Modern Design </span>
                                                                   </p>
                                                               </div>
                                                           </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="li-review-content">
                                                                <!-- Begin Feedback Area -->
                                                                <div class="feedback-area">
                                                                    <div class="feedback">
                                                                        <h3 class="feedback-title">Our Feedback</h3>
                                                                        <form action="#">
                                                                            <p class="your-opinion">
                                                                                <label>Your Rating</label>
                                                                                <span>
                                                                                    <select class="star-rating">
                                                                                      <option value="1">1</option>
                                                                                      <option value="2">2</option>
                                                                                      <option value="3">3</option>
                                                                                      <option value="4">4</option>
                                                                                      <option value="5">5</option>
                                                                                    </select>
                                                                                </span>
                                                                            </p>
                                                                            <p class="feedback-form">
                                                                                <label for="feedback">Your Review</label>
                                                                                <textarea id="feedback" name="comment" cols="45" rows="8" aria-required="true"></textarea>
                                                                            </p>
                                                                            <div class="feedback-input">
                                                                                <p class="feedback-form-author">
                                                                                    <label for="author">Name<span class="required">*</span>
                                                                                    </label>
                                                                                    <input id="author" name="author" value="" size="30" aria-required="true" type="text">
                                                                                </p>
                                                                                <p class="feedback-form-author feedback-form-email">
                                                                                    <label for="email">Email<span class="required">*</span>
                                                                                    </label>
                                                                                    <input id="email" name="email" value="" size="30" aria-required="true" type="text">
                                                                                    <span class="required"><sub>*</sub> Required fields</span>
                                                                                </p>
                                                                                <div class="feedback-btn pb-15">
                                                                                    <a href="#" class="close" data-dismiss="modal" aria-label="Close">Close</a>
                                                                                    <a href="#">Submit</a>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <!-- Feedback Area End Here -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   
                                    <!-- Quick View | Modal Area End Here -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Area End Here -->

           
