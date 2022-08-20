<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Perfil extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {


        $cliente_id = (int) $this->session->userdata('cliente_user_id');

        /*
         * Se não há nenhum valor na variável $cliente_id ou o $cliente_id não existe no banco de dados,
         * Então estamos criando um novo cliente
         */
        if (!$cliente_id || !$cliente = $this->core_model->get_by_id('clientes', array('cliente_id' => $cliente_id))) {

            ///Cadastrar

            $this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
            $this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
            $this->form_validation->set_rules('cliente_data_nascimento', 'Data nascimento', 'trim|required');
            $this->form_validation->set_rules('cliente_cpf', 'CPF', 'trim|required|exact_length[14]|callback_valida_cpf');
            $this->form_validation->set_rules('cliente_email', 'E-mail', 'trim|required|valid_email|min_length[10]|max_length[100]|callback_valida_email');

            $cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');

            if ($cliente_telefone_fixo) {
                $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone fixo', 'trim|exact_length[14]|callback_valida_telefone_fixo');
            }

            $this->form_validation->set_rules('cliente_telefone_movel', 'Celular', 'trim|required|min_length[14]|max_length[15]|callback_valida_telefone_movel');


            $this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required|exact_length[9]');
            $this->form_validation->set_rules('cliente_endereco', 'Endereço', 'trim|required|min_length[4]|max_length[140]');
            $this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|max_length[15]');
            $this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|min_length[3]|max_length[40]');
            $this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|min_length[4]|max_length[100]');
            $this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required|exact_length[2]');
            $this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim|max_length[130]');

            $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
            $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');


            if ($this->form_validation->run()) {

                $data = elements(
                        array(
                            'cliente_nome',
                            'cliente_sobrenome',
                            'cliente_data_nascimento',
                            'cliente_cpf',
                            'cliente_email',
                            'cliente_telefone_movel',
                            'cliente_telefone_fixo',
                            'cliente_cep',
                            'cliente_endereco',
                            'cliente_numero_endereco',
                            'cliente_bairro',
                            'cliente_cidade',
                            'cliente_estado',
                            'cliente_complemento',
                        ), $this->input->post()
                );


                $data = html_escape($data);

                $this->core_model->insert('clientes', $data, TRUE);

                //Recuperando o último ID inserido
                $cliente_user_id = $this->session->userdata('last_id');


                ///Início da criação do usuário

                $username = $this->input->post('cliente_nome');
                $password = $this->input->post('password');
                $email = $this->input->post('cliente_email');

                $dados_usuario = array(
                    'cliente_user_id' => $cliente_user_id,
                    'first_name' => $this->input->post('cliente_nome'),
                    'last_name' => $this->input->post('cliente_sobrenome'),
                    'phone' => $this->input->post('cliente_telefone_movel'),
                    'active' => 1,
                );

                $group = array('2'); // Grupo de clientes

                $this->ion_auth->register($username, $password, $email, $dados_usuario, $group);

                redirect('login');
            } else {

                ///Erro de validação

                $data = array(
                    'titulo' => 'Cadastrar cliente',
                    'scripts' => array(
                        'mask/jquery.mask.min.js',
                        'mask/custom.js',
                    ),
                );

                $this->load->view('web/layout/header', $data);
                $this->load->view('web/perfil');
                $this->load->view('web/layout/footer');
            }
        } else {

            /*
             * Se chegou aqui nesse ELSE, significa que já tem cadastro na nossa loja virtual.
             * Mas para poder editar o seu perfil, temos que garantir que o cliente esteja logado
             */

            if (!$this->ion_auth->logged_in()) {
                redirect('login');
            } else {

                ///Sucesso... Início da edição dos dados


                $this->form_validation->set_rules('cliente_nome', 'Nome', 'trim|required|min_length[4]|max_length[40]');
                $this->form_validation->set_rules('cliente_sobrenome', 'Sobrenome', 'trim|required|min_length[4]|max_length[140]');
                $this->form_validation->set_rules('cliente_data_nascimento', 'Data nascimento', 'trim|required');
                $this->form_validation->set_rules('cliente_cpf', 'CPF', 'trim|required|exact_length[14]|callback_valida_cpf');
                $this->form_validation->set_rules('cliente_email', 'E-mail', 'trim|required|valid_email|min_length[10]|max_length[100]|callback_valida_email');

                $cliente_telefone_fixo = $this->input->post('cliente_telefone_fixo');

                if ($cliente_telefone_fixo) {
                    $this->form_validation->set_rules('cliente_telefone_fixo', 'Telefone fixo', 'trim|exact_length[14]|callback_valida_telefone_fixo');
                }

                $this->form_validation->set_rules('cliente_telefone_movel', 'Celular', 'trim|required|min_length[14]|max_length[15]|callback_valida_telefone_movel');


                $this->form_validation->set_rules('cliente_cep', 'CEP', 'trim|required|exact_length[9]');
                $this->form_validation->set_rules('cliente_endereco', 'Endereço', 'trim|required|min_length[4]|max_length[140]');
                $this->form_validation->set_rules('cliente_numero_endereco', 'Número', 'trim|max_length[15]');
                $this->form_validation->set_rules('cliente_bairro', 'Bairro', 'trim|min_length[3]|max_length[40]');
                $this->form_validation->set_rules('cliente_cidade', 'Cidade', 'trim|min_length[4]|max_length[100]');
                $this->form_validation->set_rules('cliente_estado', 'Estado', 'trim|required|exact_length[2]');
                $this->form_validation->set_rules('cliente_complemento', 'Complemento', 'trim|max_length[130]');

                $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[6]|max_length[200]');
                $this->form_validation->set_rules('confirma', 'Confirma', 'trim|matches[password]');


                if ($this->form_validation->run()) {


                    $data = elements(
                            array(
                                'cliente_nome',
                                'cliente_sobrenome',
                                'cliente_data_nascimento',
                                'cliente_cpf',
                                'cliente_email',
                                'cliente_telefone_movel',
                                'cliente_telefone_fixo',
                                'cliente_cep',
                                'cliente_endereco',
                                'cliente_numero_endereco',
                                'cliente_bairro',
                                'cliente_cidade',
                                'cliente_estado',
                                'cliente_complemento',
                            ), $this->input->post()
                    );


                    $data = html_escape($data);

                    $this->core_model->update('clientes', $data, array('cliente_id' => $cliente_id));


                    ///Início da atualização da tabela de usuários

                    $dados_usuario = array(
                        'first_name' => $this->input->post('cliente_nome'),
                        'last_name' => $this->input->post('cliente_sobrenome'),
                        'email' => $this->input->post('cliente_email'),
                    );


                    $password = $this->input->post('password');

                    //Atualiza a senha apenas se a mesma vier no POST
                    if ($password) {
                        $dados_usuario['password'] = $password;
                    }

                    $usuario = $this->core_model->get_by_id('users', array('cliente_user_id' => $cliente_id));

                    $dados_usuario = html_escape($dados_usuario);

                    $user_id = $usuario->id;

                    $this->ion_auth->update($user_id, $dados_usuario);

                    redirect('perfil');
                } else {

                    ///Erro de validação

                    $data = array(
                        'titulo' => 'Atualizar perfil',
                        'scripts' => array(
                            'mask/jquery.mask.min.js',
                            'mask/custom.js',
                        ),
                        'cliente' => $cliente,
                    );

//                    echo '<pre>';
//                    print_r($data['cliente']);
//                    exit();


                    $this->load->view('web/layout/header', $data);
                    $this->load->view('web/perfil');
                    $this->load->view('web/layout/footer');
                }
            }
        }
    }

    public function valida_cpf($cpf) {

        if ($this->input->post('cliente_id')) {

            //Editando...

            $cliente_id = $this->input->post('cliente_id');

            if ($this->core_model->get_by_id('clientes', array('cliente_id !=' => $cliente_id, 'cliente_cpf' => $cpf))) {
                $this->form_validation->set_message('valida_cpf', 'O campo {field} já existe, ele deve ser único');
                return FALSE;
            }
        } else {

            ///Cadastrando...

            if ($this->core_model->get_by_id('clientes', array('cliente_cpf' => $cpf))) {
                $this->form_validation->set_message('valida_cpf', 'O campo {field} já existe, ele deve ser único');
                return FALSE;
            }
        }

        $cpf = str_pad(preg_replace('/[^0-9]/', '', $cpf), 11, '0', STR_PAD_LEFT);
        // Verifica se nenhuma das sequências abaixo foi digitada, caso seja, retorna falso
        if (strlen($cpf) != 11 || $cpf == '00000000000' || $cpf == '11111111111' || $cpf == '22222222222' || $cpf == '33333333333' || $cpf == '44444444444' || $cpf == '55555555555' || $cpf == '66666666666' || $cpf == '77777777777' || $cpf == '88888888888' || $cpf == '99999999999') {

            $this->form_validation->set_message('valida_cpf', 'Por favor digite um CPF válido');
            return FALSE;
        } else {
            // Calcula os números para verificar se o CPF é verdadeiro
            for ($t = 9; $t < 11; $t++) {
                for ($d = 0, $c = 0; $c < $t; $c++) {
                    $d += $cpf[$c] * (($t + 1) - $c); //Se PHP version < 7.4, $cpf{$c}
                }
                $d = ((10 * $d) % 11) % 10;
                if ($cpf[$c] != $d) { //Se PHP version < 7.4, $cpf{$c}
                    $this->form_validation->set_message('valida_cpf', 'Por favor digite um CPF válido');
                    return FALSE;
                }
            }
            return TRUE;
        }
    }

    public function valida_telefone_fixo($cliente_telefone_fixo) {


        $cliente_id = $this->input->post('cliente_id');


        if (!$cliente_id) {

            //Cadastro

            if ($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo))) {

                $this->form_validation->set_message('valida_telefone_fixo', 'Esse telefone já existe');
                return FALSE;
            } else {

                return true;
            }
        } else {

            //Edição

            if ($this->core_model->get_by_id('clientes', array('cliente_telefone_fixo' => $cliente_telefone_fixo, 'cliente_id !=' => $cliente_id))) {

                $this->form_validation->set_message('valida_telefone_fixo', 'Esse telefone já existe');
                return FALSE;
            } else {

                return true;
            }
        }
    }

    public function valida_telefone_movel($cliente_telefone_movel) {


        $cliente_id = $this->input->post('cliente_id');


        if (!$cliente_id) {

            //Cadastro

            if ($this->core_model->get_by_id('clientes', array('cliente_telefone_movel' => $cliente_telefone_movel))) {

                $this->form_validation->set_message('valida_telefone_movel', 'Esse telefone já existe');
                return FALSE;
            } else {

                return true;
            }
        } else {

            //Edição

            if ($this->core_model->get_by_id('clientes', array('cliente_telefone_movel' => $cliente_telefone_movel, 'cliente_id !=' => $cliente_id))) {

                $this->form_validation->set_message('valida_telefone_movel', 'Esse telefone já existe');
                return FALSE;
            } else {

                return true;
            }
        }
    }

    public function valida_email($cliente_email) {


        $cliente_id = $this->input->post('cliente_id');


        if (!$cliente_id) {

            //Cadastro

            if ($this->core_model->get_by_id('clientes', array('cliente_email' => $cliente_email))) {

                $this->form_validation->set_message('valida_email', 'Esse E-mail já existe');
                return FALSE;
            } else {

                return true;
            }
        } else {

            //Edição

            if ($this->core_model->get_by_id('clientes', array('cliente_email' => $cliente_email, 'cliente_id !=' => $cliente_id))) {

                $this->form_validation->set_message('valida_email', 'Esse E-mail já existe');
                return FALSE;
            } else {

                return true;
            }
        }
    }

}
