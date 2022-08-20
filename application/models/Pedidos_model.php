<?php

defined('BASEPATH') OR exit('Ação não permitida');

class Pedidos_model extends CI_Model {

    //Recupera todos os pedidos da área restrita
    public function get_all() {


        $this->db->select([
            'pedidos.pedido_data_cadastro',
            'pedidos.pedido_codigo',
            'pedidos.pedido_valor_final',
            'clientes.cliente_id',
            'CONCAT(clientes.cliente_nome, " ", clientes.cliente_sobrenome) as pedido_cliente_nome',
            'transacoes.transacao_status as pedido_status',
        ]);


        $this->db->join('clientes', 'clientes.cliente_id = pedidos.pedido_cliente_id', 'LEFT');
        $this->db->join('transacoes', 'transacoes.transacao_pedido_id = pedidos.pedido_id', 'LEFT');

        $this->db->order_by('pedidos.pedido_data_cadastro', 'DESC');


        return $this->db->get('pedidos')->result();
    }

    //Para detalhar o pedido na área restrita
    public function get_by_codigo($pedido_codigo = NULL) {

        $this->db->select([
            'pedidos.*',
            'clientes.cliente_id',
            'CONCAT(clientes.cliente_nome, " ", clientes.cliente_sobrenome) as pedido_cliente_nome',
            'clientes.*',
            'transacoes.transacao_status as pedido_status',
        ]);


        $this->db->where('pedidos.pedido_codigo', $pedido_codigo);

        $this->db->join('clientes', 'clientes.cliente_id = pedidos.pedido_cliente_id', 'LEFT');
        $this->db->join('transacoes', 'transacoes.transacao_pedido_id = pedidos.pedido_id', 'LEFT');

        return $this->db->get('pedidos')->row();
    }

    //Recupera todos os pedidos do cliente logado na loja virtual
    public function get_all_pedidos_by_cliente($cliente_user_id = NULL) {


        $this->db->select([
            'pedidos.pedido_data_cadastro',
            'pedidos.pedido_codigo',
            'pedidos.pedido_valor_final',
            'clientes.cliente_id',
            'CONCAT(clientes.cliente_nome, " ", clientes.cliente_sobrenome) as pedido_cliente_nome',
            'transacoes.transacao_status as pedido_status',
            'pedidos_produtos.pedido_id',
            'pedidos_produtos.produto_id',
            'pedidos_produtos.produto_nome',
            'produtos_fotos.foto_caminho'
        ]);

        $this->db->where('pedidos.pedido_cliente_id', $cliente_user_id);

        $this->db->join('clientes', 'clientes.cliente_id = pedidos.pedido_cliente_id');
        $this->db->join('transacoes', 'transacoes.transacao_pedido_id = pedidos.pedido_id');
        $this->db->join('pedidos_produtos', 'pedidos_produtos.pedido_id = pedidos.pedido_id');
        $this->db->join('produtos_fotos', 'produtos_fotos.foto_produto_id = pedidos_produtos.produto_id');

        $this->db->group_by('pedidos.pedido_data_cadastro');
        $this->db->order_by('pedidos.pedido_data_cadastro', 'DESC');


        return $this->db->get('pedidos')->result();
    }

    //Recupera as vendas diárias
    public function get_vendas_hoje() {

        $this->db->select([
            'pedidos.*',
            'clientes.cliente_id',
            'CONCAT(clientes.cliente_nome, " ", clientes.cliente_sobrenome) as pedido_cliente_nome',
            'transacoes.transacao_status as pedido_status',
        ]);

        $this->db->join('clientes', 'clientes.cliente_id = pedidos.pedido_cliente_id', 'LEFT');
        $this->db->join('transacoes', 'transacoes.transacao_pedido_id = pedidos.pedido_id', 'LEFT');

        $this->db->where("SUBSTR(pedido_data_cadastro, 1, 10) = ", date('Y-m-d'));

        return $this->db->get('pedidos')->result();
    }

    //Área restrita
    public function get_produtos_mais_vendidos() {

        $this->db->select([
            'pedidos_produtos.*',
            'COUNT(*) as vendidos',
        ]);

        $this->db->group_by('pedidos_produtos.produto_id');
        $this->db->order_by('vendidos', 'DESC');

        return $this->db->get('pedidos_produtos')->result();
    }

}
