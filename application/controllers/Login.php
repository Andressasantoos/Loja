<?php

  defined('BASEPATH') OR exit('Ação não permitida');

   class Login extends CI_Controller{

      public function index() {

          $data = array(
             'titulo' => 'Login Loja Virtual'
          );
         

        $this->load->view('web/layout/header', $data);
        $this->load->view('web/login');
        $this->load->view('web/layout/footer');
      }

    public function auth() {

         $identity = $this->input->post('email');
         $password = $this->input->post('password');
         $remember = ($this->input->post('remember' ? TRUE : FALSE)); // relembrar o user

         //Para redefinir ol redirect em caso de sucesso, Home ou Checkout
         $login = $this->input->post('login');

         if($this->ion_auth->login($identity, $password, $remember)){
          
            if ($this->ion_auth->is_admin()) {
               redirect('restrita');                
            }else{
                
               //Logou com sucesso...Agora jogamos na sessão o ID do cliente logado
               //Esse ID será usado no controller PAGAR para processar o pagamento de um cliente logado(existente)
               $cliente = $this->core_model->get_by_id('clientes', array('cliente_email' => $identity));

               $this->session->set_userdata('cliente_user_id', $cliente->cliente_id);
               $this->session->set_userdata('cliente_nome_completo', $cliente->cliente_nome . ' ' . $cliente->cliente_sobrenome);

                 if ($login == 'login'){                         
                   redirect('/');
                 }else{
                  redirect('checkout');
                 }         
            }

         }else{
            $this->session->set_flashdata('erro', 'E-mail ou senha está incorreto!');

            
            if ($login == 'login'){                          
               redirect('login');
             }else{
              redirect('checkout');
             }
             
         }
    }

    public function logout(){

        $this->ion_auth->logout();
        redirect('/');
    }


   }