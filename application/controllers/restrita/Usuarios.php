<?php

 defined('BASEPATH') OR exit ('Ação não permitida');

 class Usuarios extends CI_Controller{
     
     public function __construct(){
        parent::__construct();

        //sessão válida?
     }

     public function index(){

         $data = array(
             'titulo' => 'Usuários Cadastrados',
              
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

             'usuarios' =>  $this->ion_auth->users()->result(),// get all users
         );

      //   echo '<pre>';
      //   print_r($data['usuarios']);
      //   exit();

         $this->load->view('restrita/layout/header', $data);
         $this->load->view('restrita/usuarios/index');
         $this->load->view('restrita/layout/footer');
     }

     public function core($usuario_id = NULL){
        
        //Cadastrar Usuario
        $usuario_id = (int) $usuario_id;

        if(!$usuario_id){

            $this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[45]'); 
            $this->form_validation->set_rules('last_name', 'Sobrenome', 'trim|required|min_length[4]|max_length[45]');
            $this->form_validation->set_rules('email', 'E-mail', 'trim|required|min_length[4]|max_length[100]|valid_email|callback_valida_email');                                           
            $this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[4]|max_length[50]|callback_valida_usuario');                                           
            $this->form_validation->set_rules('password', 'Senha', 'trim|required|min_length[4]|max_length[100]');
            $this->form_validation->set_rules('confirma', 'Confirma Senha', 'trim|required|matches[password]');  
             
            if($this->form_validation->run()){     

               // echo '<pre>';
               // print_r($this->input->post());
                //exit();

                $username = $this->input->post('username');
                $password = $this->input->post('password');
                $email = $this->input->post('email');
                $additional_data = array(
                            'first_name' => $this->input->post('first_name'),
                            'last_name' => $this->input->post('last_name'),
                            'active' => $this->input->post('active'),
                            );
                $group = array($this->input->post('perfil')); // Sets user to admin or customer

                if($this->ion_auth->register($username, $password, $email, $additional_data, $group)){                    
                    $this->session->set_flashdata('sucesso', 'Dados salvos com sucesso');
                }else {
                    $this->session->set_flashdata('erro', $this->ion_auth->errors());
                }
                redirect('restrita/usuarios');
            }else{
               
              //Erro de validação
                $data = array(
                    'titulo' => 'Cadastrar Usuário',
                    'grupos' => $this->ion_auth->groups()->result(),
                );

                $this->load->view('restrita/layout/header', $data);
                $this->load->view('restrita/usuarios/core');
                $this->load->view('restrita/layout/footer');

            }

        }else{

            //Editar Usuário
            if(!$usuario = $this->ion_auth->user($usuario_id)->row()){

                $this->session->set_flashdata('erro', 'Usuário não foi encontrado');
                redirect('restrita/usuarios');

            } else{

                //Edita o usuario
                $this->form_validation->set_rules('first_name', 'Nome', 'trim|required|min_length[4]|max_length[45]'); 
                $this->form_validation->set_rules('last_name', 'Sobrenome', 'trim|required|min_length[4]|max_length[45]');
                $this->form_validation->set_rules('email', 'E-mail', 'trim|required|min_length[4]|max_length[100]|valid_email|callback_valida_email');                                           
                $this->form_validation->set_rules('username', 'Usuário', 'trim|required|min_length[4]|max_length[50]|callback_valida_usuario');                                           
                $this->form_validation->set_rules('password', 'Senha', 'trim|min_length[4]|max_length[100]');
                $this->form_validation->set_rules('confirma', 'Confirma Senha', 'trim|matches[password]');  
                
                if($this->form_validation->run()){                                    
      
                  $data = elements(
                    array(
                        'first_name',
                        'last_name',
                        'email',
                        'username',
                        'password',
                        'active',
                    ), $this->input->post()
                  );
                  
                $password = $this->input->post('password');  

                //Não atualiza no banco de dados se a senha se não foi alterada
                if (!$password){

                    unset($data['password']);
                }

                //Sanitizando o $data (etapa de segurança)
                $data = html_escape($data);

                if($this->ion_auth->update($usuario_id, $data)){

                    $perfil = (int) $this->input->post('perfil');

                    if($perfil){

                        $this->ion_auth->remove_from_group(NULL, $usuario_id);
                        $this->ion_auth->add_to_group($perfil, $usuario_id);
                    }

                     $this->session->set_flashdata('sucesso', 'Dados salvos com sucesso');


                }else {
                    $this->session->set_flashdata('erro', $this->ion_auth->errors());
                }

                redirect('restrita/usuarios');

                }else{

                    //Erro de validação
                    $data = array(
                        'titulo' => 'Editar Usuário',
                        'usuario' => $usuario,

                        'perfil' => $this->ion_auth->get_users_groups($usuario_id)->row(),
                        'grupos' => $this->ion_auth->groups()->result(),
                    );

                    $this->load->view('restrita/layout/header', $data);
                    $this->load->view('restrita/usuarios/core');
                    $this->load->view('restrita/layout/footer');

                }
                
            }
        }
     }

     
     //valida o email em cadastro e editar cadastro
     public function valida_email($email){

        $usuario_id = $this->input->post('usuario_id'); 

        if(!$usuario_id) {

             //Cadastrando

            if ($this->core_model->get_by_id('users', array('email' => $email))){
                $this->form_validation->set_message('valida_email', 'Esse e-mail já existe');
                return false;
            }else{
                return true;
            }

        } else {
            
            //Editando
            if ($this->core_model->get_by_id('users', array('email' => $email, 'id !=' => $usuario_id))){
                $this->form_validation->set_message('valida_email', 'Esse e-mail já existe');
                return false;
            }else{
                return true;
            }
           
        }
    
     }


      //valida o usuario em cadastro e editar cadastro
      public function valida_usuario($username){

        $usuario_id = $this->input->post('usuario_id'); 

        if(!$usuario_id) {

             //Cadastrando
           
             if ($this->core_model->get_by_id('users', array('username' => $username))){
                $this->form_validation->set_message('valida_usuario', 'Esse usuário já existe');
                return false;
            }else{
                return true;
            }

        } else {
            
            //Editando
            if ($this->core_model->get_by_id('users', array('username' => $username, 'id !=' => $usuario_id))){
                $this->form_validation->set_message('valida_usuario', 'Esse usuário já existe');
                return false;
            }else{
                return true;
            }
           
           
        }
    
     }

     public function delete($usuario_id=NULL){

        $usuario_id = (int) $usuario_id;

         if(!$usuario_id || !$this->ion_auth->user($usuario_id)->row()){   
            $this->session->set_flashdata('erro', 'Usuário não foi encontrado');
            redirect('restrita/usuarios');
         }else{
             //Excluir Usuario

             if ($this->ion_auth->is_admin($usuario_id))
             {
                $this->session->set_flashdata('erro', 'Não é permitido excluir um usuário com perfil Administrador');
                redirect('restrita/usuarios');
             }

             if($this->ion_auth->delete_user($usuario_id)){
                $this->session->set_flashdata('sucesso', 'Usuário excluido com sucesso');
            }else{
                $this->session->set_flashdata('erro', $this->ion_auth->errors());
            }
            redirect('restrita/usuarios');
         }

     }

 }