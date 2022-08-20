<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct () {
		parent:: __construct();
		//$this->load->library('ion_auth');
		$this->load->library('ion_auth', '', 'common');
	}
	

	public function index()
	{
		$sistema = info_header_footer();

		//$query = $this->loja_model->get_categorias_pai();
		

		$data = array(
			'titulo' => 'Seja Bem Vindo(a) '.$sistema->sistema_nome_fantasia,
			'produtos_destaques' => $this->loja_model->get_produtos_destaques($sistema->sistema_produtos_destaques),
		);

		//echo'<pre>';
		//print_r($data['produtos_destaques']);
		//exit();
		$this->load->view('web/layout/header', $data);
		$this->load->view('web/home');
		$this->load->view('web/layout/footer');
	}

}
