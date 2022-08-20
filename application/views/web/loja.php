

<?php $this->load->view('web/layout/navbar'); ?>



<!-- Begin Slider With Banner Area -->
<div class="slider-with-banner mt-20">
    <div class="container">
        <div class="row">
            <!-- Begin Slider Area -->
            <div class="col-lg-8 col-md-8">
                <div class="slider-area">
                    <div class="slider-active owl-carousel">

                        <?php foreach ($produtos_destaques as $produto): ?>


                            <!-- Begin Single Slide Area -->
                            <div class="single-slide align-center-left  animation-style-01" 
                                 style="background-image: url('<?php echo base_url('uploads/produtos/' . $produto->foto_caminho); ?>');
                                 background-repeat: no-repeat;
                                 background-position: center center;
                                 background-size: cover;
                                 min-height: 475px;
                                 width: 80%;">
                                <div class="slider-progress"></div>
                                <div class="slider-content" style="color: #ffc107;">
                                    <h5>Oferta imperdível <span>-20% de desconto</span> apenas essa semana</h5>
                                    <h2><?php echo word_limiter($produto->produto_nome, 4); ?></h2>
                                    <h3>A partir de <span>R$&nbsp;<?php echo number_format($produto->produto_valor, 2); ?></span></h3>
                                    <div class="default-btn slide-btn">
                                        <a class="links" href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">Ver mais</a>
                                    </div>
                                </div>
                            </div>

                        <?php endforeach; ?>

                    </div>
                </div>
            </div>
            <!-- Slider Area End Here -->
            <!-- Begin Li Banner Area -->
            <div class="col-lg-4 col-md-4 text-center pt-xs-30">

                <?php foreach ($produtos_lateral_direita as $produto): ?>

                    <div class="li-banner">
                        <a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>" style="width: 75%">
                            <img src="<?php echo base_url('uploads/produtos/' . $produto->foto_caminho); ?>" alt="<?php echo $produto->produto_nome; ?>">
                        </a>
                    </div>

                <?php endforeach; ?>

            </div>
            <!-- Li Banner Area End Here -->
        </div>
    </div>
</div>
<!-- Slider With Banner Area End Here -->


<!-- Begin Product Area -->
<div class="product-area pt-60 pb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="li-product-tab">
                    <ul class="nav li-product-menu">
                        <li><a class="active" data-toggle="tab" href="#li-new-product"><span>Produtos mais buscados</span></a></li>
                    </ul>               
                </div>
                <!-- Begin Li's Tab Menu Content Area -->
            </div>
        </div>
        <div class="tab-content">
            <div id="li-new-product" class="tab-pane active show" role="tabpanel">
                <div class="row">
                    <div class="product-active owl-carousel">


                        <?php foreach ($produtos_destaques as $produto): ?>


                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">
                                            <img src="<?php echo base_url('uploads/produtos/' . $produto->foto_caminho); ?>" alt="<?php echo word_limiter($produto->produto_nome, 4); ?>">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="shop-left-sidebar.html">Avaliações</a>
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
                                            <h4><a class="product_name" href="single-product.html"><?php echo word_limiter($produto->produto_nome, 4); ?></a></h4>
                                            <div class="price-box">
                                                <span class="new-price"><?php echo 'R$&nbsp;' . number_format($produto->produto_valor, 2); ?></span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">Visualizar</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>

                        <?php endforeach; ?>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product Area End Here -->

<!-- Begin Li's Laptop Product Area -->
<section class="product-area li-laptop-product pt-60 pb-45">
    <div class="container">
        <div class="row">
            <!-- Begin Li's Section Area -->
            <div class="col-lg-12">
                <div class="li-section-title">
                    <h2>
                        <span>Produtos mais vendidos</span>
                    </h2>
                </div>
                <div class="row">
                    <div class="product-active owl-carousel">

                        <?php foreach ($produtos_mais_vendidos as $produto): ?>


                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">
                                            <img src="<?php echo base_url('uploads/produtos/' . $produto->foto_caminho); ?>" alt="<?php echo word_limiter($produto->produto_nome, 4); ?>">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="shop-left-sidebar.html">Avaliações</a>
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
                                            <h4><a class="product_name" href="single-product.html"><?php echo word_limiter($produto->produto_nome, 4); ?></a></h4>
                                            <div class="price-box">
                                                <span class="new-price"><?php echo 'R$&nbsp;' . number_format($produto->produto_valor, 2); ?></span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">Visualizar</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>

                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
            <!-- Li's Section Area End Here -->
        </div>
    </div>
</section>
<!-- Li's Laptop Product Area End Here -->
<!-- Begin Li's TV & Audio Product Area -->
<section class="product-area li-laptop-product li-tv-audio-product pb-100">
    <div class="container">
        <div class="row">
            <!-- Begin Li's Section Area -->
            <div class="col-lg-12">
                <div class="li-section-title">
                    <h2>
                        <span>Periféricos</span>
                    </h2>

                </div>
                <div class="row">
                    <div class="product-active owl-carousel">

                        <?php foreach ($produtos_mais_categoria_periferico as $produto): ?>


                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">
                                            <img src="<?php echo base_url('uploads/produtos/' . $produto->foto_caminho); ?>" alt="<?php echo word_limiter($produto->produto_nome, 4); ?>">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="shop-left-sidebar.html">Avaliações</a>
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
                                            <h4><a class="product_name" href="single-product.html"><?php echo word_limiter($produto->produto_nome, 4); ?></a></h4>
                                            <div class="price-box">
                                                <span class="new-price"><?php echo 'R$&nbsp;' . number_format($produto->produto_valor, 2); ?></span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="<?php echo base_url('produto/' . $produto->produto_meta_link); ?>">Visualizar</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>

                        <?php endforeach; ?>


                    </div>
                </div>
            </div>
            <!-- Li's Section Area End Here -->
        </div>
    </div>
</section>
<!-- Li's TV & Audio Product Area End Here -->




