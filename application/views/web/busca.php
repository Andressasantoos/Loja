
    <!-- Chamando NavBar -->
    <?php $this->load->view('web/layout/navbar'); ?>

     <!-- Begin Li's Breadcrumb Area -->
     <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="<?php echo base_url('/') ?>">Home</a></li>
                            <li class="active"><?php echo $termo_digitado; ?></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- shop-top-bar start -->
                         <!--   <div class="shop-top-bar mt-30">
                                <div class="shop-bar-inner">
                                    <div class="product-view-mode">
                                       
                                        <ul class="nav shop-item-filter-list" role="tablist">
                                            <li class="active" role="presentation"><a aria-selected="true" class="active show" data-toggle="tab" role="tab" aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a></li>
                                            <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="list-view" href="#list-view"><i class="fa fa-th-list"></i></a></li>
                                        </ul>
                                      
                                    </div>
                                    <div class="toolbar-amount">
                                        <span>Mostrar 1 a 9 de 15</span>
                                    </div>
                                </div>
                              
                                <div class="product-select-box">
                                    <div class="product-short">
                                        <p>Sort By:</p>
                                        <select class="nice-select">
                                            <option value="trending">Relevantes</option>
                                            <option value="sales">Nome (A - Z)</option>
                                            <option value="sales">Nome (Z - A)</option>
                                            <option value="rating">Preço (Baixo &gt; Alto)</option>
                                            <option value="date">Rating (Lowest)</option>
                                            <option value="price-asc">Modelo (A - Z)</option>
                                            <option value="price-asc">Modelo (Z - A)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>-->
                            <!-- shop-top-bar end -->
                            <!-- shop-products-wrapper start -->
                            <div class="shop-products-wrapper">
                                <div class="tab-content">
                                    <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                        <div class="product-area shop-product-area">
                                            <div class="row">

                                            <?php if(isset($produtos)): ?>

                                                   
                                            <?php foreach ($produtos as $produto): ?>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 mt-40 mb-50">
                                                            <!-- single-product-wrap start -->
                                                            <div class="single-product-wrap">
                                                                <div class="product-image">
                                                                    <a href="<?php echo base_url('produto/'.$produto->produto_meta_link) ?>">
                                                                        <img src="<?php echo base_url('uploads/produtos/'.$produto->foto_caminho) ?>" alt="<?php echo $produto->produto_nome  ?>">
                                                                    </a>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                                <div class="product_desc">
                                                                    <div class="product_desc_info">
                                                                        <div class="product-review">
                                                                            <h5 class="manufacturer">
                                                                                <a href="product-details.html">Avaliações</a>
                                                                            </h5>
                                                                            <div class="rating-box">
                                                                                <ul class="rating">
                                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <h4><a class="product_name" href="single-product.html"><?php echo word_limiter($produto->produto_nome, 4) ?></a></h4>
                                                                        <div class="price-box">
                                                                            <span class="new-price"><?php echo 'R$ '. number_format($produto->produto_valor, 2) ?></span> 
                                                                        </div>
                                                                    </div>
                                                                    <div class="add-actions">
                                                                        <ul class="add-actions-link">
                                                                            <li class="add-cart active"><a href="<?php echo base_url('produto/'.$produto->produto_meta_link) ?>">Visualizar</a></li>
                                                                            <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- single-product-wrap end -->
                                                        </div>

                                                        <?php endforeach; ?>  

                                            <?php else: ?>    

                                               <div class="col-lg-12 text-center">
                                                <h5 class="mb-40">Infelizmente não encontramos o produto que você está procurando</h5>
                                                   <img  width="40%" src="<?php echo base_url('public/web/images/not_found.svg') ?>" alt="Produto não encontrado">
                                               </div>

                                            <?php endif; ?> 

                                            </div>
                                        </div>
                                    </div>
                                 

                                  <!--  <div class="paginatoin-area">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <p>Mostrar 1-12 of 13 item(s)</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <ul class="pagination-box">
                                                    <li><a href="#" class="Previous"><i class="fa fa-chevron-left"></i> Previous</a>
                                                    </li>
                                                    <li class="active"><a href="#">1</a></li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li>
                                                      <a href="#" class="Next"> Next <i class="fa fa-chevron-right"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                            <!-- shop-products-wrapper end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Wraper Area End Here -->
