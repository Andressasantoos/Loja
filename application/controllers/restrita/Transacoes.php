<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Transacoes extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if (!$this->ion_auth->is_admin()) {
            redirect('/');
        }

        $this->load->model('transacoes_model');
    }

    public function index() {


        $data = array(
            'titulo' => 'Transações realizadas',
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
            'transacoes' => $this->core_model->get_all('transacoes'),
        );

//        echo '<pre>';
//        print_r($data['transacoes']);
//        exit();

        $this->load->view('restrita/layout/header', $data);
        $this->load->view('restrita/transacoes/index');
        $this->load->view('restrita/layout/footer');
    }

    public function view($transacao_id = null) {


        $transacao_id = (int) $transacao_id;


        if (!$transacao_id || !$transacao = $this->transacoes_model->get_by_id($transacao_id)) {

            $this->session->set_flashdata('erro', 'Transação não encontrada');
            redirect('restrita/transacoes');
        } else {

            $data = array(
                'titulo' => 'Detalhando a transacao',
                'transacao' => $transacao
            );

//            echo '<pre>';
//            print_r($data['transacao']);
//            exit();

            $this->load->view('restrita/layout/header', $data);
            $this->load->view('restrita/transacoes/view');
            $this->load->view('restrita/layout/footer');
        }
    }

    public function atualizar($transacao_codigo_hash = null) {

        /*
         * URL para verificarmos se o sandbox está online
         */
        $url_check = "https://ws.sandbox.pagseguro.uol.com.br/";

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_URL, $url_check);

        $xml = curl_exec($curl);

        if ($xml != 'OK') {
            $this->session->set_flashdata('erro', 'A ULR ' . $url_check . ' não está disponível no momento. Por favor tente novamente dentro de alguns minutos');
            redirect('restrita/transacoes');
        } else {

            //Sucesso.... ambiente do sandbox está online



            /*
             * Recuperando as configurações do Pagseguro
             */
            $config_pagseguro = $this->core_model->get_by_id('config_pagseguro', array('config_id' => 1));

            $parametros = array(
                'email' => $config_pagseguro->config_email,
                'token' => $config_pagseguro->config_token,
            );

            $parametros = http_build_query($parametros);


            if ($transacao_codigo_hash) {


                if (!$transacao = $this->core_model->get_by_id('transacoes', array('transacao_codigo_hash' => $transacao_codigo_hash))) {
                    $this->session->set_flashdata('erro', 'Não encontramos a transação');
                    redirect('restrita/transacoes');
                } else {

                    //Atualiza a transação individualmente

                    /*
                     * https://ws.sandox.pagseguro.uol.com.br/v2/transactions/9E884542-81B3-4419-9A75-BCC6FB495EF1?{{credenciais}}
                     */


                    $url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/transactions/' . $transacao->transacao_codigo_hash . '?' . $parametros;

                    $curl = curl_init();
                    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($curl, CURLOPT_URL, $url);
                    $xml = curl_exec($curl);

                    $xml = simplexml_load_string($xml);


                    $transacao_status = $xml->status;


                    /*
                     * Só atualizamos a transação uma vez que seu seu status seja diferente do retornado pelo sandbox
                     * E o status não seja 'Cancelada' ou 'Devolvida'
                     */
                    if ($transacao->transacao_status != $transacao_status) {

                        $data = array(
                            'transacao_status' => $transacao_status
                        );

                        $this->core_model->update('transacoes', $data, array('transacao_codigo_hash' => $transacao_codigo_hash));
                        redirect('restrita/transacoes');
                    } else {

                        $this->session->set_flashdata('sucesso', 'A transação já estava atualizada. Tudo certo.');
                        redirect('restrita/transacoes');
                    }
                }
            } else {

                //Atualiza em massa


                $data_final_banco = $this->transacoes_model->get_last_date();

//                echo '<pre>';
//                print_r($data_final_banco);
//                exit();



                $data_inicial_banco = $this->transacoes_model->get_first_date($data_final_banco->transacao_data);

//                echo '<pre>';
//                print_r($data_inicial_banco);
//                exit();


                $parametros = array(
                    'initialDate' => $data_inicial_banco->transacao_data,
                    'finalDate' => $data_final_banco->transacao_data,
                    'email' => $config_pagseguro->config_email,
                    'token' => $config_pagseguro->config_token,
                );


                $parametros = http_build_query($parametros);


//                echo '<pre>';
//                print_r($parametros);
//                exit();


                /*
                 * Recupero as transações que esteja no intervalo (30 dias) que sejam superior à '$data_inicial_banco->transacao_data'
                 */
                $transacoes = $this->transacoes_model->get_all_transacoes_intervalo_data($data_inicial_banco->transacao_data);

//                echo '<pre>';
//                print_r($transacoes);
//                exit();



                $url = 'https://ws.sandbox.pagseguro.uol.com.br/v2/transactions?' . $parametros;

                $curl = curl_init();
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($curl, CURLOPT_URL, $url);
                $xml = curl_exec($curl);

                $xml = simplexml_load_string($xml);
                $xml = json_encode($xml);

                $consulta = json_decode($xml);


                /*
                 * Importante: quando é feita a requisição por intervalo de datas, a transação cujo status seja 6 (DEVOLVIDA) não é retornada
                 */

                foreach ($consulta->transactions->transaction as $transaction_request) {


                    $data = array(
                        'transacao_status' => $transaction_request->status,
                    );

                    $this->core_model->update('transacoes', $data, array('transacao_codigo_hash' => $transaction_request->code));
                }

                $this->session->set_flashdata('sucesso', 'Atualização em massa realizada com sucesso!');
                redirect('restrita/transacoes');
            }
        }
    }

}
