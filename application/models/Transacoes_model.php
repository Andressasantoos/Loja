<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Transacoes_model extends CI_Model {

    //Para detalhar a transação na área restrita
    public function get_by_id($transacao_id = null) {

        $this->db->select([
            'transacoes.*',
            'pedidos.pedido_codigo',
            'CONCAT(clientes.cliente_nome, " ", clientes.cliente_sobrenome) as pedido_cliente_nome',
        ]);

        $this->db->where('transacoes.transacao_id', $transacao_id);

        $this->db->join('clientes', 'clientes.cliente_id = transacoes.transacao_cliente_id', 'LEFT');
        $this->db->join('pedidos', 'pedidos.pedido_id = transacoes.transacao_pedido_id', 'LEFT');

        return $this->db->get('transacoes')->row();
    }

    /*
     * Recupera a primeira transação, cujo o intervalo entre '$data_final_banco->transacao_data' e '$data_inicial_banco' não seja superior a 30 dias
     */

    public function get_first_date($data_final = null) {


        $this->db->select([
            'transacoes.transacao_id',
            'DATE_FORMAT(transacoes.transacao_data, "%Y-%m-%dT%H:%i") as transacao_data', false,
            'transacoes.transacao_codigo_hash',
            'transacoes.transacao_status',
        ]);

        /*
         * Especifica a data final do intervalo de pesquisa. A diferença entre initialDate e finalDate não pode ser superior a 30 dias.
         */
        $this->db->where("DATEDIFF ('" . $data_final . "', transacao_data) <= 30");
        $this->db->where('transacoes.transacao_status !=', 6); //Devolvida
        $this->db->where('transacoes.transacao_status !=', 7); //Cancelada

        return $this->db->get('transacoes')->first_row();
    }

    /*
     * Recupera a data final para compor a consulta por intervalo de datas
     */

    public function get_last_date() {

        $this->db->select([
            'transacoes.transacao_id',
            'transacoes.transacao_data as transacao_data_original',
            'DATE_FORMAT(transacoes.transacao_data, "%Y-%m-%dT%H:%i") as transacao_data', false,
            'transacoes.transacao_codigo_hash',
            'transacoes.transacao_status',
        ]);

        $this->db->where('transacoes.transacao_status !=', 6); //Devolvida
        $this->db->where('transacoes.transacao_status !=', 7); //Cancelada


        return $this->db->get('transacoes')->last_row();
    }
    
    
    //Utilizado na área restrita para recuperar um range de transacões
    public function get_all_transacoes_intervalo_data($data_inicial_banco = null) {


        $this->db->select([
            'transacoes.transacao_id',
            'transacoes.transacao_data',
            'transacoes.transacao_codigo_hash',
            'transacoes.transacao_status',
        ]);


        $this->db->where('transacoes.transacao_data > ', $data_inicial_banco);
        $this->db->where('transacoes.transacao_status !=', 6); //Devolvida
        $this->db->where('transacoes.transacao_status !=', 7); //Cancelada

        return $this->db->get('transacoes')->result();
    }

}
