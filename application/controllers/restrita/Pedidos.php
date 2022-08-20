<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Pedidos extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if (!$this->ion_auth->is_admin()) {
            redirect('/');
        }
    }

    public function index() {


        $data = array(
            'titulo' => 'Pedidos cadastrados',
            'styles' => array(
                'bundles/datatables/datatables.min.css',
                'bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css',
            ),
            'scripts' => array(
                'bundles/datatables/datatables.min.js',
                'bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js',
                'bundles/jquery-ui/jquery-ui.min.js',
                'js/page/datatables.js'
            ),
            'pedidos' => $this->pedidos_model->get_all(),
        );

//        echo '<pre>';
//        print_r($data['pedidos']);
//        exit();


        $this->load->view('restrita/layout/header', $data);
        $this->load->view('restrita/pedidos/index');
        $this->load->view('restrita/layout/footer');
    }

    public function diarias() {

        $data = array(
            'titulo' => 'Relatório de vendas diárias - ' . date('d/m/Y'),
        );

        if ($pedidos = $this->pedidos_model->get_vendas_hoje()) {
            $data['pedidos'] = $pedidos;
        }


//        echo '<pre>';
//        print_r($data);
//        exit();


        $this->load->view('restrita/layout/header', $data);
        $this->load->view('restrita/pedidos/diarias');
        $this->load->view('restrita/layout/footer');
    }

    public function vendidos() {

        $data = array(
            'titulo' => 'Relatório de produtos mais vendidos',
        );

        if ($produtos = $this->pedidos_model->get_produtos_mais_vendidos()) {
            $data['produtos'] = $produtos;
        }


//        echo '<pre>';
//        print_r($data);
//        exit();


        $this->load->view('restrita/layout/header', $data);
        $this->load->view('restrita/pedidos/vendidos');
        $this->load->view('restrita/layout/footer');
    }

    public function imprimir($pedido_codigo = NULL) {


        if (!$pedido_codigo || !$pedido = $this->pedidos_model->get_by_codigo($pedido_codigo)) {

            $this->session->set_flashdata('erro', 'Não encontramos o pedido');
            redirect('restrita/pedidos');
        } else {

            $data = array(
                'titulo' => 'Detalhes do pedido ' . $pedido_codigo,
                'pedido' => $pedido,
            );

            $data['pedido_produtos'] = $this->core_model->get_all('pedidos_produtos', array('pedido_id' => $pedido->pedido_id));


//            echo '<pre>';
//            print_r($data);
//            exit();

            $this->load->view('restrita/layout/header', $data);
            $this->load->view('restrita/pedidos/imprimir');
            $this->load->view('restrita/layout/footer');
        }
    }

}
