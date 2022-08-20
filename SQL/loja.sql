-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Ago-2020 às 09:22
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_pai_id` int(11) DEFAULT NULL,
  `categoria_nome` varchar(45) NOT NULL,
  `categoria_ativa` tinyint(1) DEFAULT NULL,
  `categoria_meta_link` varchar(100) DEFAULT NULL,
  `categoria_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_pai_id`, `categoria_nome`, `categoria_ativa`, `categoria_meta_link`, `categoria_data_criacao`, `categoria_data_alteracao`) VALUES
(1, 1, 'Notebook', 1, 'notebook', '2020-07-10 06:28:07', '2020-07-20 02:52:24'),
(3, 3, 'Mouses', 1, 'mouses', '2020-07-13 04:17:31', '2020-07-13 04:17:31'),
(4, 5, 'SSD', 1, 'ssd', '2020-07-17 06:24:49', '2020-07-17 06:24:49'),
(5, 5, 'Memória ram', 1, 'memoria-ram', '2020-07-17 06:31:10', '2020-07-17 06:31:10'),
(6, 1, 'Processadores', 1, 'processadores', '2020-07-17 06:34:17', '2020-07-17 06:34:17'),
(7, 6, 'Smartphones', 1, 'smartphones', '2020-07-17 06:41:54', '2020-07-17 06:41:54'),
(8, 3, 'Controle sem fio', 1, 'controle-sem-fio', '2020-07-17 06:47:33', '2020-07-17 06:47:33'),
(9, 3, 'Teclados', 1, 'teclados', '2020-07-17 06:55:15', '2020-07-17 06:55:15'),
(10, 3, 'Headset', 1, 'headset', '2020-07-17 06:57:38', '2020-07-17 06:57:38'),
(11, 1, 'Placa de vídeo', 1, 'placa-de-video', '2020-07-17 07:03:29', '2020-07-17 07:03:29'),
(12, 3, 'Webcam', 1, 'webcam', '2020-07-17 07:06:33', '2020-07-17 07:06:33'),
(13, 5, 'Pendrive', 1, 'pendrive', '2020-07-17 07:10:50', '2020-07-17 07:10:50'),
(14, 8, 'Roteadores', 1, 'roteadores', '2020-07-17 07:20:11', '2020-07-20 02:14:53'),
(15, 1, 'Cartucho de tinta', 1, 'cartucho-de-tinta', '2020-07-17 07:23:24', '2020-07-17 07:23:24'),
(16, 7, 'Headphones', 1, 'headphones', '2020-07-20 02:09:52', '2020-07-20 02:09:52'),
(17, 7, 'Cabo HDMI', 1, 'cabo-hdmi', '2020-07-20 02:13:10', '2020-07-20 02:13:10'),
(18, 8, 'Switch', 1, 'switch', '2020-07-20 02:17:18', '2020-07-20 02:17:18'),
(19, 9, 'Impressoras térmicas', 1, 'impressoras-termicas', '2020-07-20 02:23:03', '2020-07-20 02:23:03'),
(20, 4, 'Playstation 4', 1, 'playstation-4', '2020-07-20 02:27:41', '2020-07-20 02:27:41'),
(21, 10, 'Câmeras de aventura', 1, 'cameras-de-aventura', '2020-07-20 02:33:46', '2020-07-20 02:33:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_pai`
--

CREATE TABLE `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias_pai`
--

INSERT INTO `categorias_pai` (`categoria_pai_id`, `categoria_pai_nome`, `categoria_pai_ativa`, `categoria_pai_meta_link`, `categoria_pai_data_criacao`, `categoria_pai_data_alteracao`) VALUES
(1, 'Informática', 1, 'informatica', '2020-07-10 05:06:08', '2020-07-10 05:06:08'),
(3, 'Periféricos', 1, 'perifericos', '2020-07-10 07:05:56', '2020-07-10 07:05:56'),
(4, 'Jogos', 1, 'jogos', '2020-07-10 07:06:12', '2020-07-10 07:06:12'),
(5, 'Armazenamento', 1, 'armazenamento', '2020-07-17 06:23:46', '2020-07-17 06:23:46'),
(6, 'Telefonia', 1, 'telefonia', '2020-07-17 06:40:11', '2020-07-17 06:40:11'),
(7, 'Eletrônicos', 1, 'eletronicos', '2020-07-20 02:08:32', '2020-07-20 02:08:32'),
(8, 'Rede', 1, 'rede', '2020-07-20 02:13:46', '2020-07-20 02:13:46'),
(9, 'Automação comercial', 1, 'automacao-comercial', '2020-07-20 02:21:01', '2020-07-20 02:21:01'),
(10, 'Câmeras digitais', 1, 'cameras-digitais', '2020-07-20 02:32:57', '2020-07-20 02:32:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `cliente_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `cliente_nome` varchar(45) NOT NULL,
  `cliente_sobrenome` varchar(150) NOT NULL,
  `cliente_data_nascimento` date DEFAULT NULL,
  `cliente_cpf` varchar(20) NOT NULL,
  `cliente_email` varchar(150) NOT NULL,
  `cliente_telefone_fixo` varchar(20) DEFAULT NULL,
  `cliente_telefone_movel` varchar(20) NOT NULL,
  `cliente_cep` varchar(10) NOT NULL,
  `cliente_endereco` varchar(155) NOT NULL,
  `cliente_numero_endereco` varchar(20) DEFAULT NULL,
  `cliente_bairro` varchar(45) NOT NULL,
  `cliente_cidade` varchar(105) NOT NULL,
  `cliente_estado` varchar(2) NOT NULL,
  `cliente_complemento` varchar(145) DEFAULT NULL,
  `cliente_data_alteracao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_data_cadastro`, `cliente_nome`, `cliente_sobrenome`, `cliente_data_nascimento`, `cliente_cpf`, `cliente_email`, `cliente_telefone_fixo`, `cliente_telefone_movel`, `cliente_cep`, `cliente_endereco`, `cliente_numero_endereco`, `cliente_bairro`, `cliente_cidade`, `cliente_estado`, `cliente_complemento`, `cliente_data_alteracao`) VALUES
(3, '2020-08-11 04:27:54', 'Ciclano', 'da Silva', '2020-08-10', '639.968.410-27', 'ciclano@gmail.com', NULL, '(41) 55564-4564', '80510-000', 'Rua Inácio Lustosa', '45', 'São Francisco', 'Curitiba', 'PR', NULL, '2020-08-11 04:27:54'),
(9, '2020-08-11 08:11:07', 'Pedro', 'Luiz', '2020-08-26', '953.860.080-05', 'pedro@gmail.com', NULL, '(41) 55151-5151', '80540-000', 'Rua Alberto Folloni', '45', 'Ahú', 'Curitiba', 'PR', NULL, '2020-08-11 08:11:07'),
(10, '2020-08-13 06:47:57', 'Maria', 'Souza', '2020-08-11', '507.373.630-37', 'maria@gmail.com', NULL, '(45) 15151-5151', '80540-000', 'Rua Alberto Folloni', '12', 'Ahú', 'Curitiba', 'PR', NULL, '2020-08-13 06:47:57'),
(11, '2020-08-13 07:24:36', 'Ana', 'Lúcia', '2020-07-28', '084.267.930-88', 'ana@gmail.com', NULL, '(69) 84546-8464', '80520-000', 'Rua Nilo Peçanha', '90', 'São Francisco', 'Curitiba', 'PR', NULL, '2020-08-13 07:24:36'),
(15, '2020-08-16 19:26:15', 'Luana', 'da Paz', '2020-08-11', '917.668.090-81', 'luana@gmail.com', NULL, '(89) 46465-4566', '80540-000', 'Rua Alberto Folloni', '50', 'Ahú', 'Curitiba', 'PR', NULL, '2020-08-16 19:26:15'),
(17, '2020-08-16 20:03:24', 'José', 'de Paula', '2020-08-06', '338.309.420-01', 'jose@gmail.com', NULL, '(89) 46465-4654', '80510-000', 'Rua Inácio Lustosa', '45', 'São Francisco', 'Curitiba', 'PR', NULL, '2020-08-16 20:03:24'),
(20, '2020-08-16 20:35:43', 'Lucia', 'da Luz', '2020-08-07', '014.722.400-49', 'lucia@gmail.com', '', '(45) 48564-6565', '80540-000', 'Rua Alberto Folloni', '12', 'Ahú', 'Curitiba', 'PR', '', '2020-08-16 20:35:43'),
(29, '2020-08-16 21:41:15', 'Manoel', 'Ferreira', '2020-07-28', '307.109.980-07', 'manoel@gmail.com', NULL, '(87) 54654-6515', '80520-000', 'Rua Nilo Peçanha', '12', 'São Francisco', 'Curitiba', 'PR', NULL, '2020-08-16 21:41:15'),
(33, '2020-08-18 03:01:07', 'Miriam', 'Cruz', '2020-08-13', '225.900.630-24', 'miriam@gmail.com', '(33) 4565-6465', '(32) 4646-5155', '80540-000', 'Rua das pedagogas', '1000', 'Centro', 'Curitiba', 'PR', 'Próximo à esquina do saber', '2020-08-18 03:01:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_correios`
--

CREATE TABLE `config_correios` (
  `config_id` int(11) NOT NULL,
  `config_cep_origem` varchar(20) NOT NULL,
  `config_codigo_pac` varchar(10) NOT NULL,
  `config_codigo_sedex` varchar(10) NOT NULL,
  `config_somar_frete` decimal(10,2) NOT NULL,
  `config_valor_declarado` decimal(5,2) NOT NULL,
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_correios`
--

INSERT INTO `config_correios` (`config_id`, `config_cep_origem`, `config_codigo_pac`, `config_codigo_sedex`, `config_somar_frete`, `config_valor_declarado`, `config_data_alteracao`) VALUES
(1, '80530-000', '04510', '04014', '3.50', '21.50', '2020-07-16 05:24:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_pagseguro`
--

CREATE TABLE `config_pagseguro` (
  `config_id` int(11) NOT NULL,
  `config_email` varchar(255) NOT NULL,
  `config_token` varchar(100) NOT NULL,
  `config_ambiente` tinyint(1) NOT NULL COMMENT '0 -> Ambiente real / 1 -> Ambiente sandbox',
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_pagseguro`
--

INSERT INTO `config_pagseguro` (`config_id`, `config_email`, `config_token`, `config_ambiente`, `config_data_alteracao`) VALUES
(1, 'luciomdesouza@hotmail.com', '412D8F2055CE4061A3E7229C1BC2F059', 1, '2020-08-03 21:36:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'clientes', 'Clientes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nome`, `marca_meta_link`, `marca_ativa`, `marca_data_criacao`, `marca_data_alteracao`) VALUES
(1, 'Samsung', 'samsung', 1, '2020-07-09 06:32:05', '2020-07-17 06:22:57'),
(3, 'Dell', 'dell', 1, '2020-07-10 04:47:54', '2020-07-10 04:48:17'),
(4, 'Kingston', 'kingston', 1, '2020-07-17 06:22:45', NULL),
(5, 'HyperX', 'hyperx', 1, '2020-07-17 06:30:31', NULL),
(6, 'AMD', 'amd', 1, '2020-07-17 06:32:56', NULL),
(7, 'Xiaomi', 'xiaomi', 1, '2020-07-17 06:42:06', NULL),
(8, 'Sony', 'sony', 1, '2020-07-17 06:46:05', NULL),
(9, 'Microsoft', 'microsoft', 1, '2020-07-17 06:49:14', NULL),
(10, 'Razer', 'razer', 1, '2020-07-17 06:53:27', NULL),
(11, 'Husky', 'husky', 1, '2020-07-17 06:57:55', NULL),
(12, 'Asus', 'asus', 1, '2020-07-17 07:02:56', NULL),
(13, 'Multilaser', 'multilaser', 1, '2020-07-17 07:06:13', NULL),
(14, 'Sandisk', 'sandisk', 1, '2020-07-17 07:09:52', NULL),
(15, 'Tenda', 'tenda', 1, '2020-07-17 07:19:52', NULL),
(16, 'HP', 'hp', 1, '2020-07-17 07:22:53', NULL),
(17, 'JBL', 'jbl', 1, '2020-07-20 02:08:09', NULL),
(18, 'ELG', 'elg', 1, '2020-07-20 02:12:19', NULL),
(19, 'D-link', 'd-link', 1, '2020-07-20 02:16:31', NULL),
(20, 'Epson', 'epson', 1, '2020-07-20 02:19:46', NULL),
(21, 'GoPro', 'gopro', 1, '2020-07-20 02:32:31', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `pedido_codigo` varchar(8) DEFAULT NULL,
  `pedido_cliente_id` int(11) DEFAULT NULL,
  `pedido_valor_produtos` decimal(15,2) DEFAULT NULL,
  `pedido_valor_frete` decimal(15,2) DEFAULT NULL,
  `pedido_valor_final` decimal(15,2) DEFAULT NULL,
  `pedido_forma_envio` tinyint(1) DEFAULT NULL COMMENT '1 = Correios Sedex---------------------2 - Correios PAC',
  `pedido_data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `pedido_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `pedido_codigo`, `pedido_cliente_id`, `pedido_valor_produtos`, `pedido_valor_frete`, `pedido_valor_final`, `pedido_forma_envio`, `pedido_data_cadastro`, `pedido_data_alteracao`) VALUES
(1, '16409732', 10, '39.00', '24.52', '63.52', 1, '2020-08-13 06:48:04', NULL),
(2, '50724136', 11, '59.00', '26.02', '85.02', 2, '2020-08-13 07:24:40', NULL),
(5, '03741629', 15, '39.00', '24.52', '63.52', 1, '2020-08-16 19:26:19', NULL),
(7, '06982415', 17, '149.00', '26.02', '175.02', 2, '2020-08-16 20:03:28', NULL),
(8, '41976283', 20, '39.00', '24.52', '63.52', 1, '2020-08-16 20:35:47', NULL),
(10, '19862570', 29, '59.00', '24.52', '83.52', 1, '2020-08-16 21:41:17', NULL),
(11, '52731498', 29, '1250.00', '24.52', '1274.52', 1, '2020-08-16 21:54:22', NULL),
(13, '61934270', 20, '1499.99', '24.52', '1524.51', 1, '2020-08-20 02:58:47', NULL),
(14, '03175824', 20, '1499.99', '24.52', '1524.51', 1, '2020-08-19 03:12:33', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(200) NOT NULL,
  `produto_quantidade` int(11) NOT NULL,
  `produto_valor_unitario` decimal(15,2) NOT NULL,
  `produto_valor_total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`pedido_id`, `produto_id`, `produto_nome`, `produto_quantidade`, `produto_valor_unitario`, `produto_valor_total`) VALUES
(1, 17, 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB SDCZ50-016G-B35', 1, '39.00', '39.00'),
(2, 21, 'Switch 8 portas 10/100 Mbps não gerenciável DES-1008C D Link', 1, '59.00', '59.00'),
(5, 17, 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB SDCZ50-016G-B35', 1, '39.00', '39.00'),
(7, 20, 'Headphone on-ear preto T500 Jbl CX 1 UN', 1, '149.00', '149.00'),
(8, 17, 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB SDCZ50-016G-B35', 1, '39.00', '39.00'),
(10, 21, 'Switch 8 portas 10/100 Mbps não gerenciável DES-1008C D Link', 1, '59.00', '59.00'),
(11, 9, 'Smartphone Xiaomi Redmi 8A, 32GB, 12MP, Tela 6.22´, Azul - CX282AZU', 1, '1250.00', '1250.00'),
(13, 15, 'Placa de Vídeo Asus Arez Dual AMD Radeon RX 580 OC Edition, 8GB, GDDR5 - AREZ-DUAL-RX580-O8G', 1, '1499.99', '1499.99'),
(14, 15, 'Placa de Vídeo Asus Arez Dual AMD Radeon RX 580 OC Edition, 8GB, GDDR5 - AREZ-DUAL-RX580-O8G', 1, '1499.99', '1499.99');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `produto_codigo` varchar(45) DEFAULT NULL,
  `produto_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `produto_categoria_id` int(11) DEFAULT NULL,
  `produto_marca_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(255) DEFAULT NULL,
  `produto_meta_link` varchar(255) DEFAULT NULL,
  `produto_peso` int(11) DEFAULT 0,
  `produto_altura` int(11) DEFAULT 0,
  `produto_largura` int(11) DEFAULT 0,
  `produto_comprimento` int(11) DEFAULT 0,
  `produto_valor` varchar(45) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT 0,
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext DEFAULT NULL,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_quantidade_estoque`, `produto_ativo`, `produto_destaque`, `produto_controlar_estoque`, `produto_descricao`, `produto_data_alteracao`) VALUES
(5, '42169783', '2020-07-17 06:27:35', 4, 4, 'SSD Kingston A400, 240GB, SATA, Leitura 500MB/s, Gravação 350MB/s - SA400S37/240G', 'ssd-kingston-a400-240gb-sata-leitura-500mbs-gravacao-350mbs-sa400s37240g', 1, 15, 15, 15, '279.00', 1, 1, 1, 1, 'Conheça o SSD A400 da Kingston. Performance incrível e tecnologia de ponta! Este SSD possui com a tecnologia 3D NAND (também chamada de V-NAND). Performance não será problema com este SSD. Ele possui uma controladora de última geração para velocidades de leitura e gravação de até 500MB/s e 350MB/s, este SSD é 10x mais rápido do que um HD tradicional para melhor desempenho, resposta ultrarrápida em multitarefas e um computador mais rápido de modo geral. O seu desktop merece esse grande upgrade de velocidade! Comparados a discos rígidos mecânicos, o SSD A400 aumenta de forma drástica a resposta do seu PC com tempos maravilhosos de inicialização, carregamento e transferência. Além dessa performance incrível, este SSD também é mais confiável e durável do que um disco rígido comum. Este A400 possui 240GB de capacidade, o tamanho certo para o que você precisa no dia a dia', NULL),
(6, '84702613', '2020-07-17 06:29:13', 1, 1, 'Notebook Samsung Dual Core 4GB 64GB SSD Tela Full HD 13.3” Windows 10 Flash F30 NP530XBB-AD1BR', 'notebook-samsung-dual-core-4gb-64gb-ssd-tela-full-hd-133-windows-10-flash-f30-np530xbb-ad1br', 1, 15, 15, 15, '2399.99', 1, 1, 1, 1, 'Detalhes do produto: Samsung: Notebook Samsung Dual Core 4GB 64GB SSD Tela Full HD 13.3” Windows 10 Flash F30 NP530XBB-AD1BR\r\nO notebook Flash Samsung é a escolha ideal para quem possui uma rotina agitada e passa o dia em movimento. Seu design inovador oferece portabilidade e estilo através de uma estrutura fina, leve e com acabamento diferenciado.\r\n\r\nInspirado no visual retrô, o Samsung Flash se destaca com grafismos estilizados na tampa externa, textura semelhante a um tecido na parte interna e teclado com teclas arredondadas que lembram uma máquina de escrever.\r\n\r\nA tela Full HD de 13.3 polegadas oferece excelente qualidade de imagens para você curtir seus filmes e séries favoritas. Com o amplo ângulo de visão de 178 graus você visualiza o conteúdo da tela sem distorções e com máxima definição.\r\n\r\nO Samsung notebook Flash vem repleto de recursos que facilitam a sua vida. A memória flash inicia o sistema operacional em poucos segundos e oferece acesso rápido aos aplicativos e documentos mais utilizados.', NULL),
(7, '98205417', '2020-07-17 06:32:15', 5, 5, 'Memória HyperX Fury, 8GB, 2666MHz, DDR4, CL16, Preto - HX426C16FB3/8', 'memoria-hyperx-fury-8gb-2666mhz-ddr4-cl16-preto-hx426c16fb38', 1, 15, 15, 15, '341.00', 1, 1, 1, 1, 'A Memória RAM HyperX FURY DDR4 apresenta um visual incrível com um dissipador de calor atualizado. Com um potencial incrível para você performar em alto nível, ela conta com overclock automático Plug &amp; Play para módulos de velocidades até 2666MHz, sendo compatível com as mais recentes CPUs Intel e AMD. A Memória RAM HyperX FURY DDR4 possui garantia vitalícia, sendo uma atualização excelente e com preço acessível para fazer com que você tenha um desempenho incrível no seu jogo preferido. Sinta a verdadeira fúria das Memórias HyperX e tenha uma experiência jamais vivenciada antes.', NULL),
(8, '57984102', '2020-07-17 06:38:11', 6, 6, 'Processador AMD Ryzen 5 1600, Cache 19MB, 3.2GHz (3.6GHz Max Turbo), AM4 - YD1600BBAFBOX', 'processador-amd-ryzen-5-1600-cache-19mb-32ghz-36ghz-max-turbo-am4-yd1600bbafbox', 1, 15, 15, 15, '759.00', 0, 1, 1, 1, 'Com esse processador inovador e incrível você desfruta ao máximo o verdadeiro potencial do seu computador e desfruta da mais pura velocidade. Maximize o seu desempenho seja trabalhando, jogando, navegando ou assistindo o seu filme preferido, com esse processador você pode tudo!', NULL),
(9, '87623409', '2020-07-17 06:43:06', 7, 7, 'Smartphone Xiaomi Redmi 8A, 32GB, 12MP, Tela 6.22´, Azul - CX282AZU', 'smartphone-xiaomi-redmi-8a-32gb-12mp-tela-622-azul-cx282azu', 1, 15, 15, 15, '1250.00', 1, 1, 1, 1, '', NULL),
(10, '41308596', '2020-07-17 06:48:29', 8, 8, 'Controle Sony DualShock 4, Edição Limitada The Last Of Us Part II, PS4, Sem Fio - CUH-ZCT2U', 'controle-sony-dualshock-4-edicao-limitada-the-last-of-us-part-ii-ps4-sem-fio-cuh-zct2u', 1, 15, 15, 15, '332.00', 1, 1, 1, 1, 'O controle sem fio DualShock 4 para o sistema PlayStation 4 define esta geração de jogos, combinando recursos revolucionários e conforto com controles precisos e intuitivos. Compartilhamento em suas mãos, o botão SHARE facilita o compartilhamento dos seus melhores momentos nos jogos, basta pressionar um botão. Faça upload de vídeos de gameplay e capturas de tela diretamente do seu sistema ou transmita seu gameplay ao vivo, tudo isso sem afetar o andamento do jogo. Recursos inovadores, recursos revolucionários, como o touch pad, a barra de luz e o alto-falante integrados proporcionam formas incríveis de jogar e interagir com seus jogos, e seu conector de áudio de 3,5 mm oferece uma prática solução de áudio pessoal para os jogadores que preferirem jogar com mais privacidade. Recarga eficiente, é fácil recarregar o controle sem fio DualShock 4, basta conectá-lo ao seu sistema PlayStation 4 (mesmo em modo de espera), ou qualquer carregador padrão com uma porta micro USB', NULL),
(11, '06173845', '2020-07-17 06:51:48', 8, 9, 'Controle Microsoft Wireless Branco Xbox One TF5-00002', 'controle-microsoft-wireless-branco-xbox-one-tf5-00002', 1, 15, 15, 15, '479.00', 1, 1, 1, 1, 'Controle Microsoft Wireless Branco Xbox One TF5-00002\r\n\r\nCaracterísticas:\r\n\r\n- Marca: Microsoft\r\n\r\n- Modelo: TF5-00002\r\n\r\n \r\n\r\nEspecificações:\r\n\r\n- Plataforma: Xbox One\r\n\r\n- Alimentação: 2x Pilhas AA\r\n\r\n- Cor: Branco\r\n\r\n- Conectividade sem fio\r\n\r\n \r\n\r\nInformações Adicionais:\r\n\r\n- O controle sem fio de Xbox One agora apresenta plug de fone de ouvido estéreo 3,5 milímetros que permite que você conecte seu fone de ouvido diretamente no controle.\r\n\r\n- Pode ser atualizado sem fio sem a necessidade de conectar um cabo USB.\r\n\r\n- Sinta a ação com trickers de impulso.\r\n\r\n- Com motores de vibração nos gatilhos que fornecem feedback imediato dos tiros e ações no jogo, a experiência de jogo chega um novo nível de realismo.\r\n\r\n- O D -pad é sensível a todos os movimentos direcionais. Grips e contornos foram projetados para atender ao contorno das mãos mais confortavelmente.\r\n\r\n- O controle de combate com design em branco e detalhes metálicos.\r\n\r\n- Possui de uma entrada para headset estéreo de 3,5 mm que permite que você conecte seu fone de ouvido diretamente no controle.\r\n\r\n- Com motores de vibração nos gatilhos que fornecem feedback imediato dos tiros e ações no jogo, a experiência de jogo chega um novo nível de realismo.\r\n\r\n- O D-pad é sensível a todos os movimentos direcionais. \r\n\r\n- Grips e contornos foram projetados para atender ao contorno das mãos mais confortavelmente.\r\n\r\n- Controle seu console ou PC com o novo controle bluetooth\r\n\r\n \r\n\r\nConteúdo da Embalagem:\r\n\r\n- Controle Microsoft Xbox One', NULL),
(12, '21473598', '2020-07-17 06:56:03', 9, 10, 'Teclado Mecânico Gamer Razer Blackwidow Tournament V2 Chroma, Switch Razer Orange, US - RZ03-02190700-R3M1', 'teclado-mecanico-gamer-razer-blackwidow-tournament-v2-chroma-switch-razer-orange-us-rz03-02190700-r3m1', 1, 15, 15, 15, '582.00', 1, 1, 1, 1, 'Os gamers vão se surpreender com este teclado gamer para PC, um equipamento feito para garantir a performance mais veloz do universo dos teclados Razer. Nos games, cada milissegundo é importante para vencer o adversário. Este teclado mecânico tem switches que dão mais agilidade para respostas, além de proporcionar mais velocidade aos jogos. Os players vão se sentir muito confortáveis com o descanso de pulso ergonômico deste teclado mecânico Razer que possibilita saliência tátil e clique distinto no Razer Switch Laranja, um dos diferenciais do dispositivo. Prático, o modelo é conectado por USB, e não tem teclado numérico para não ocupar espaço na sua mesa. É compacto e leve, pode ser transportado com facilidade, ideal para viagens nas quais os jogos PC serão a principal atração. O teclado gamer mecânico tem a tecnologia Instant Trigger, que elimina delay para debounce, deixando as respostas realmente rápidas para manter sua vantagem no game. A sua experiência fica mais interessante ainda com as teclas retroiluminadas, que podem ser programadas de forma individual com o Razer Synapse. São mais de 16 milhões de opções de cores que a Razer preparou para você! Confira!', NULL),
(13, '32709165', '2020-07-17 06:59:53', 10, 11, 'Headset Gamer Husky Storm, USB, 7.1 Surround, Driver 50mm, Rainbow - HS-HST-RA', 'headset-gamer-husky-storm-usb-71-surround-driver-50mm-rainbow-hs-hst-ra', 1, 15, 15, 15, '249.00', 1, 1, 1, 1, 'Aproveite sua gameplay com total imersão! O Headset Gamer Storm da Husky foi pensado em cada detalhe para oferecer a você todos os recursos necessários para um áudio perfeito e de alto conforto, acompanhados de um design que une beleza a resistência. A qualidade do som surround 7.1 (virtual) faz com que seus games favoritos ganhem ainda mais vida. Já as almofadas em couro sintético e dimensão dos alto-falantes permitem que você passe horas e horas nas maratonas de gameplay, minimizando os ruídos externos e o desconforto. E, para um headset ser completo, o áudio incrível deve ser acompanhado por uma comunicação clara, sem interferências. Isso também é possível com o microfone de LED omnidirecional. Tenha acesso ainda a um espetáculo de cores em iluminação Rainbow, controle de volume e LED no cabo trançado, software para ajuste de equalização do áudio e muito mais!', NULL),
(14, '43180975', '2020-07-17 07:02:18', 7, 1, 'Smartphone Samsung Galaxy A71, 128GB, 64MP, Tela 6.7´, Preto - SM-A715FZKJZTO', 'smartphone-samsung-galaxy-a71-128gb-64mp-tela-67-preto-sm-a715fzkjzto', 1, 15, 15, 15, '2589.00', 1, 1, 1, 1, 'Smartphone Samsung Galaxy A71, Câmera Quádrupla 64MP(Principal) + 12MP(Ultra Wide) + 5MP(Macro) + 5MP(Profundidade), Frontal de 32MP, Tela Infinita de 6.7&quot; com Leitor de Digital na Tela, Octa Core, 128GB, 6GB RAM, 4500mAh com carregamento super-rápido de 25W, Dual Chip, Android - Preto', NULL),
(15, '43652798', '2020-07-17 07:05:14', 11, 12, 'Placa de Vídeo Asus Arez Dual AMD Radeon RX 580 OC Edition, 8GB, GDDR5 - AREZ-DUAL-RX580-O8G', 'placa-de-video-asus-arez-dual-amd-radeon-rx-580-oc-edition-8gb-gddr5-arez-dual-rx580-o8g', 1, 15, 15, 15, '1499.99', 1, 1, 1, 1, 'Características:\r\n\r\n- Marca: ASUS\r\n\r\n- Modelo: AREZ-DUAL-RX580-O8G\r\n\r\n \r\n\r\nEspecificações:\r\n\r\n \r\n\r\nMecanismo de Gráficos:\r\n\r\n- AMD Radeon RX 580\r\n\r\n- Processadores de fluxo: 2304\r\n\r\n \r\n\r\nClock do Motor:\r\n\r\n- Até 1380 MHz (modo OC)\r\n\r\n- Até 1360 MHz (modo Gaming)\r\n\r\n \r\n\r\nChipset:\r\n\r\n- Polaris 20 XTX\r\n\r\n\r\n\r\nMemória:\r\n\r\n- Tipo: GDDR5\r\n\r\n- Capacidade: 8GB\r\n\r\n- Clock: 8 Gbps\r\n\r\n- Interface: 256 bits\r\n\r\n \r\n\r\nExibição:\r\n\r\n- Suporte máximo de exibição: 4x\r\n\r\n- Resolução Máxima Digital: 7680 x 4320\r\n\r\n \r\n\r\nConexões:\r\n\r\n- 1x DVI-D (nativo)\r\n\r\n- 2x HDMI 2.0b (nativo)\r\n\r\n- 2x DisplayPort 1.4 (nativo)\r\n\r\n- Suporte HDCP 2.2\r\n\r\n \r\n\r\nAlimentação:\r\n\r\n- PSU recomendado: 500W\r\n\r\n- Conectores de Força: 1x 8 pinos\r\n\r\n \r\n\r\nRecursos:\r\n\r\n- Suporte para NVlink / Crossfire\r\n\r\n- OpenGL 4.5', NULL),
(16, '10978543', '2020-07-17 07:08:02', 12, 13, 'WebCam Multilaser Iluminação Night Vision 16.0 Megapixel - WC045', 'webcam-multilaser-iluminacao-night-vision-160-megapixel-wc045', 1, 15, 15, 15, '139.00', 1, 1, 1, 1, 'Características:\r\n- Marca: Multilaser\r\n- Modelo: WC045\r\n\r\n \r\n\r\nEspecificações:\r\n- 16MP de resolução (interpolado)\r\n- Botão Snap Shot para tirar fotos\r\n- LED noturno, ideal para ambientes com pouca iluminação\r\n- Microfone USB (não requer conector para o microfone)\r\n- Plug e play: não precisa instalar driver\r\n- Clipe para monitor de LCD\r\n- Lente de vidro de 2 camadas\r\n- Acabamento com detalhes Black Piano\r\n- Compatível com Windows 2000/XP/Vista/Win 7 ou superior\r\n- Conexão USB 1.1 e 2.0', NULL),
(17, '21087536', '2020-07-17 07:12:13', 13, 14, 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB SDCZ50-016G-B35', 'pen-drive-cruzer-blade-sandisk-usb-20-16gb-sdcz50-016g-b35', 1, 15, 15, 15, '39.00', 1, 1, 1, 1, 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB SDCZ50-016G-B35\r\n\r\nCaracterísticas:\r\n- Pen Drive Cruzer Blade™\r\n- Marca: SanDisk\r\n- Modelo: SDCZ50-016G\r\n\r\nEspecificações: \r\n- Leva teus arquivos a todas partes\r\n- Capacidade: 16Gb\r\n- Guarda fotos, música, vídeos...\r\n- Design elegante\r\n- Pequeno e muito ligeiro', NULL),
(18, '37254610', '2020-07-17 07:22:16', 14, 15, 'Roteador Tenda AC6 1200Mbps 4 Antenas - 4 Portas', 'roteador-tenda-ac6-1200mbps-4-antenas-4-portas', 1, 15, 15, 15, '343.00', 5, 1, 1, 1, 'Roteador Tenda AC6 1200Mbps 4 Antenas - 4 Portas\r\nO roteador AC6 da linha Soho é o líder da nova geração de roteadores. A Tenda pensou e desenvolveu este modelo para ofertar praticidade e acesso rápido no seu dia a dia. O equipamento oferece tudo que há de novo na tecnologia de Wi-Fi inteligente e dual-band, com sinal forte e desempenho estável. São 04 portas e 04 antenas, que combinadas, as frequências trabalham em incríveis 1200Mps. Assim, o aparelho facilita na distribuição do sinal e faz com que a experiência do usuário seja a melhor. O AC6 ainda vem com aplicativo Tenda Wi-Fi e tem requisitos dos sistemas como: Microsoft Windows XP, o Vista, Windows 7/ 8/8.1/10, para o MAC OS, UNIX e para o Linux. Invista em tecnologia para gerar praticidade em sua rotina!', NULL),
(20, '20386417', '2020-07-20 02:10:48', 16, 17, 'Headphone on-ear preto T500 Jbl CX 1 UN', 'headphone-on-ear-preto-t500-jbl-cx-1-un', 1, 15, 15, 15, '149.00', 1, 1, 1, 1, 'Sonoridade padrão com desempenho JBL Pure Bass\r\nControle/Microfone de 1 botão\r\nCabo flat emborrachado livre de nós\r\nDesign leve e dobrável\r\nAcesse a Siri ou Google Now\r\nTamanho do alto falante: 32 mm\r\nResposta de frequência: 20 Hz ? 20 kHz\r\nEntrada de áudio de 3,5 mm', NULL),
(21, '06524873', '2020-07-20 02:18:18', 18, 19, 'Switch 8 portas 10/100 Mbps não gerenciável DES-1008C D Link', 'switch-8-portas-10100-mbps-nao-gerenciavel-des-1008c-d-link', 1, 15, 15, 15, '59.00', 1, 1, 1, 1, 'Características do Prduto\r\n\r\nO DES-1008C 10/100 Mbps Switch é econômico, possui um plug-and-play de rede que é a solução para pequenas e médias empresas que precisam de fáceis pontos de acesso e expansão de rede, além disso fornece uma maneira rápida de conectividade.', NULL),
(22, '65421739', '2020-07-20 02:24:30', 19, 20, 'Impressora térmica não fiscal USB / Serial TM-T20X Epso', 'impressora-termica-nao-fiscal-usb-serial-tm-t20x-epso', 1, 15, 15, 15, '687.00', 1, 1, 1, 1, 'Impressão\r\nTecnologia de impressão: Impressão térmica de linhas\r\nResolução de impressão: 203 dpi x 203 dpi\r\nVelocidade de impressão: Máx. 200 mm/s (textos e gráficos)\r\n\r\nFontes de Impressão\r\nFonte A: 12 pts. x 24 pts. | Fonte B: 9 pts. x 17 pts. (largura x altura)\r\nCapacidade de colunas: Padrão: largura do papel 80 mm: Fonte A: 48 colunas | Fonte B: 64 colunas; Modo de 42 colunas: largura do papel 80 mm: Fonte A: 42 colunas | Fonte B: 60 colunas\r\nTamanho dos caracteres: Fonte A: 1,25 mm x 3 mm | Fonte B: 1,88 mm x 2,13 mm (largura x altura)\r\nConjunto de caracteres: 95 alfanumérico, 18 conjuntos de caracteres internacionais, 128 x 43 grácos estendidos.\r\nCódigo de barras: UPC-A, UPC-E, JAN13 (EAN13), JAN8 (EAN8), CODE39, ITF, CODABAR (NW-7), CODE93, CODE128, GS1-128, GS1 DataBar. Código bidimensional: PDF417, QRCode, MaxiCode, 2D GS1 DataBar, simbologia composta\r\n\r\nConectividade\r\nUsb/Serial\r\n\r\nManuseio da Mídia\r\nEspessura: Máxima 75µm | Mínima 53µm\r\nDimensões da mídia: 80 mm: 79,5 mm ± 0,5 mm x 83 mm diâmetro\r\n\r\nEnergia\r\nVoltagem nominal: 100 V - 230 V AC, 50/60 Hz\r\nConsumo de energia: Standby (modo de espera) aprox. 0,96 W; Impressão aprox. 28,7 W\r\nCorrente nominal: Aprox. 1,0 A\r\nFonte de energia: Interna (cabo de energia incluso)', NULL),
(23, '86741902', '2020-07-20 02:28:44', 20, 8, 'Jogo The Last of Us Playstation 4 / PS4 - Playstation Hits Sony PT', 'jogo-the-last-of-us-playstation-4-ps4-playstation-hits-sony-pt', 1, 15, 15, 15, '69.00', 1, 1, 1, 1, 'Características do Produto\r\n\r\nThe Last of Us, vencedor de mais de 200 prêmios Jogo do Ano, ganha agora uma versão remasterizada para o PlayStation®4 com modelos de personagens em alta resolução, sombras e luzes aprimoradas e outras melhorias no jogo.\r\n\r\nCidades abandonadas, uma população dizimada por uma praga moderna, os sobreviventes matam uns aos outros por comida, armas e qualquer outra coisa em que puderem botar as mãos.\r\nJoel, um sobrevivente brutal, e Ellie, uma adolescente corajosa e madura apesar da pouca idade, unem suas forças para saírem vivos da jornada pelos Estados Unidos', NULL),
(24, '02378591', '2020-07-20 02:34:38', 21, 21, 'Câmera GOPRO Hero 8 Black - CHDHX-801-CM', 'camera-gopro-hero-8-black-chdhx-801-cm', 1, 15, 15, 15, '2399.99', 0, 1, 1, 1, 'Ésta é a HERO8 Black, a mais versátil e mais estável câmera HERO já criada. O design otimizado facilita ainda mais o transporte da câmera e, graças às suas hastes dobráveis integradas, a troca de suportes leva apenas alguns segundos. E com o módulo de mídia opcional, você pode maximizar a capacidade de expansão para adicionar mais iluminação, áudio profissional e até mesmo outra tela. Há também o inovador recurso de estabilização HyperSmooth 2.0, com câmera lenta de cair o queixo.', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_fotos`
--

CREATE TABLE `produtos_fotos` (
  `foto_id` int(11) NOT NULL,
  `foto_produto_id` int(11) DEFAULT NULL,
  `foto_caminho` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(37, 5, '322b750f9f30df2bcab139d8843e9d41.jpg'),
(38, 5, '4f1648da86812b8bd9357a0ce5b2e37a.jpg'),
(39, 5, '2c1f922c79683ac5caa2fceb2c55f0b1.jpg'),
(40, 5, '8044e73788d81ff5ce17ea817feca1d2.jpg'),
(41, 5, 'ba7be617787e41df1481fca203ec61b9.jpg'),
(48, 7, '4b82a645b47dffd1725cc81204728c13.jpg'),
(49, 7, '2dae51c7a4bc08556d885584db367537.jpg'),
(50, 7, 'd9556f0ee37a9af2620c862d952cbfbf.jpg'),
(51, 7, 'fcb3e7bda53e170d959454db80ff4379.jpg'),
(56, 9, '3a8425708ed7497359bbababb6a42f63.jpg'),
(57, 9, 'aa4a8bec433b4241060fbaa65c1ce2fb.jpg'),
(58, 9, 'e593a9196eb735cc43778f61a2c04c36.jpg'),
(59, 9, '28d1fe5869e825355901e299cbae1392.jpg'),
(60, 9, 'f730f8dbb38c2a5425c46b988f0784ad.jpg'),
(61, 9, '174047005d86bb33427c4245d74c7b17.jpg'),
(62, 10, '91df6d0da747f4e1500442c560b1cc7e.jpg'),
(63, 10, 'bf8f2c5c0bd54ffc98bd6628ef858bc6.jpg'),
(64, 10, '4b2165d7f4bd4bc3265001d9862e97a0.jpg'),
(65, 10, '01db58e0e439987a4b7839c5cf09dca7.jpg'),
(66, 11, '352ba2a17f6ff6d34edd360397579a01.jpg'),
(67, 11, '0055b64fabef2c3884f5120b95aceeb0.jpg'),
(68, 11, 'c921b2e4cf02af27b68151d18d6dfc40.jpg'),
(69, 11, 'a5d01ed189ef8d3e8bdc6d056ba81ad3.jpg'),
(70, 12, '4699b460904104da43273bed67ba5c7a.jpg'),
(71, 12, '0dae3c595665b44ff251b66ef60c978d.jpg'),
(72, 12, '7e2226604ed0d498a16a21db33fb1de1.jpg'),
(73, 12, '6ff1c8cb03387adba06ded0efae57976.jpg'),
(74, 12, 'ba923ddadc7b2e189556db18d6c2d676.jpg'),
(75, 13, '889a6c1949131efc01b67a583dc81128.jpg'),
(76, 13, 'd3c7c36eaa11d76435f7153809db3b11.jpg'),
(77, 13, 'cb3e1d21b2824118213cdd32df6433ad.jpg'),
(78, 13, 'fc7ed0e489aef0b0410436929ceb59de.jpg'),
(79, 13, 'cc48bab9481b6f4efe658a3457cfdead.jpg'),
(80, 14, '6019282fe06185b077e6552043f93b46.jpg'),
(81, 14, '7bc6a7118c62b2eb3eb1d939dcf991e2.jpg'),
(82, 14, '6e7d229ce279149be5a36c322187a713.jpg'),
(83, 14, '0b9f49111cde1f6ff4d85c821fedae54.jpg'),
(84, 14, 'e277e946133e31f983982645eec8c5c9.jpg'),
(85, 15, '9059b0babab8bba53a5fc8d6dabe836a.jpg'),
(86, 15, '39b9df9f546b09d4e1842067d4d2a319.jpg'),
(87, 15, '2728ad6d20d30b7cfcaf970d4637693f.jpg'),
(88, 15, '2109c4beef5fa0b659a9a32d6fdefd19.jpg'),
(89, 15, '45c55a1b3cebf7a77459954a0ee7a789.jpg'),
(90, 15, '9a03a303383bc74d3f9780037dc63027.jpg'),
(91, 16, '300a1d89d24383a32915bc018efb80cc.jpg'),
(92, 16, '29455f3ad2a1b6881684012fad2bc558.jpg'),
(93, 16, '38f7e42c31433058dcb4d5232361c245.jpg'),
(94, 16, '8f1d6e4cff257dddda0f9f48d9de7ecc.jpg'),
(95, 17, '0fa938301451182e098585bc238587c7.jpg'),
(96, 17, 'df3a9b3a150041631f4982c0c81834c0.jpg'),
(97, 17, '3ce106fa0b4d4d5efa7eb81c09f2e678.jpg'),
(98, 17, 'f2cc825a43f03bb2b25f827dbacaf15f.jpg'),
(106, 20, 'b288d2c03fe24d97e81a3b39ed387eb9.jpg'),
(107, 20, 'eda259151917339e3a16e527a713f318.jpg'),
(108, 20, 'e9fe94467eaf4ef21e036a629bb5543a.jpg'),
(109, 20, '1aa17101e013dd7bb26f652593470c4d.jpg'),
(110, 20, '2dca22fff14d073aee486f1363b763eb.jpg'),
(111, 21, 'ff1abdd243764994fb4f445163b8cb78.jpg'),
(112, 21, 'c6be2144cf4df4608e69c236716d9033.jpg'),
(113, 21, '1a836f36b07460f1a33bf784115e3c89.jpg'),
(114, 21, '367fdca83139e4f4da3207b8aecde159.jpg'),
(115, 22, '4ee61e7f3d18a759b1841b59fa6a559d.jpg'),
(116, 22, '7c08762b82954b207e33c25803877db9.jpg'),
(117, 22, 'ad3218a8bf41914dc5de111165fe3877.jpg'),
(118, 23, 'a440f9167ae919b95600dfda6a6ba905.jpg'),
(119, 23, '485f9da095d288ffe963208255ad62d6.jpg'),
(120, 23, '3f22241fac87a155cf6ce4429bc3e444.jpg'),
(121, 23, 'f72dfa7ef73e0f0d4a7d384475994fd1.jpg'),
(122, 23, '2d9aa07f6489c139c5f108d12dd8dae7.jpg'),
(128, 8, 'a715357a159e9b92f870dcd23356cf4e.jpg'),
(129, 8, 'aa9ff412ddf218abbe6a75a6502eedf4.jpg'),
(130, 8, '23f8223ef6b4d4be4b572b4689593bcb.jpg'),
(131, 8, 'af49d959b8a9a03c3c678c917657bbcd.jpg'),
(147, 6, '35f02bbec50e2510215fcadb23769eaf.jpg'),
(148, 6, '9ae98e5f02c185ef89ba49da429a7999.jpg'),
(149, 6, '474d74f4be304d88d1d6e69fa91635b3.jpg'),
(150, 6, 'd006211992baa2e8771f1aa64f1f601a.jpg'),
(151, 6, '4dcb0184b521f4af20b2b32498a50763.jpg'),
(152, 6, '19d7dab66262839e780f45020dd2dab2.jpg'),
(153, 24, '198706b44fdee336a88c509c3cf92e0c.jpg'),
(154, 24, '2552154838058ad24d50f48a8424df79.jpg'),
(155, 24, '04ffde6fea2c18fc95ce3363b187e3a5.jpg'),
(156, 24, '4f293579c1672cb389689521c2aea598.jpg'),
(157, 24, '9bdb3397a490ed3ff4386765e9c434bd.jpg'),
(158, 18, '6cba6511235850b23d4087c89c3bb699.jpg'),
(159, 18, 'a0ff4aba4719506b67c02d08dcdb03b5.jpg'),
(160, 18, 'e8f5d7fbe3c7cb827e9af7bf09ee015b.jpg'),
(161, 18, '1e8c115e1ff4bc60b055c1c23322afcd.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext DEFAULT NULL,
  `sistema_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_produtos_destaques`, `sistema_texto`, `sistema_data_alteracao`) VALUES
(1, 'Loja virtual Vende tudo!', 'Vende tudo!', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(41) 9999-9999', 'vendetudo@contato.com.br', 'http://vendetudo.com.br', '80510-000', 'Rua da Programação', '54', 'Curitiba', 'PR', 6, 'Preço e qualidade!', '2020-07-18 06:09:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `transacao_id` int(11) NOT NULL,
  `transacao_pedido_id` int(11) DEFAULT NULL,
  `transacao_cliente_id` int(11) DEFAULT NULL,
  `transacao_data` timestamp NULL DEFAULT current_timestamp(),
  `transacao_codigo_hash` varchar(255) DEFAULT NULL,
  `transacao_tipo_metodo_pagamento` tinyint(1) DEFAULT NULL COMMENT '1 = Cartão | 2 = Boleto | 3 = Transferência',
  `transacao_codigo_metodo_pagamento` varchar(10) DEFAULT NULL,
  `transacao_link_pagamento` varchar(255) DEFAULT NULL,
  `transacao_banco_escolhido` varchar(20) DEFAULT NULL,
  `transacao_valor_bruto` decimal(15,2) DEFAULT NULL,
  `transacao_valor_taxa_pagseguro` decimal(15,2) DEFAULT NULL,
  `transacao_valor_liquido` decimal(15,2) DEFAULT NULL,
  `transacao_numero_parcelas` int(11) DEFAULT NULL,
  `transacao_valor_parcela` decimal(15,2) DEFAULT NULL,
  `transacao_status` tinyint(1) DEFAULT NULL COMMENT 'Verificar documentação',
  `transacao_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`transacao_id`, `transacao_pedido_id`, `transacao_cliente_id`, `transacao_data`, `transacao_codigo_hash`, `transacao_tipo_metodo_pagamento`, `transacao_codigo_metodo_pagamento`, `transacao_link_pagamento`, `transacao_banco_escolhido`, `transacao_valor_bruto`, `transacao_valor_taxa_pagseguro`, `transacao_valor_liquido`, `transacao_numero_parcelas`, `transacao_valor_parcela`, `transacao_status`, `transacao_data_alteracao`) VALUES
(1, 1, 10, '2020-08-13 06:48:04', '84D097C0-A8CD-4B47-9708-ED8D35CECB1A', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=70f5a1eb22b6a74aeb2dff9f32047738a79c6234ace2d32c352e699e675ed834d31e8d07d9b4c5b9', NULL, '63.52', '3.57', '59.95', 1, '63.52', 1, '2020-08-23 19:35:27'),
(2, 2, 11, '2020-08-13 07:24:40', 'D182AD15-F4EE-4A23-BC75-23430558209D', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=7ae72203c2befad55d5381f963bedc3073773b299defab7c07cbb60a345671824e016f46250f8859', NULL, '85.02', '4.64', '80.38', 1, '85.02', 1, NULL),
(5, 5, 15, '2020-08-16 19:26:19', 'D8477308-840C-4D9B-8AC7-CFE516EC5854', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b0a79031b49ca4fb0332027777bc7b255f1a14fbf49ad1733c26b1976c8fd8f16d74832ed9be077c', NULL, '63.52', '3.57', '59.95', 1, '63.52', 3, '2020-08-25 05:56:45'),
(7, 7, 17, '2020-08-16 20:03:28', 'F8C7D0A9-08FB-4B7D-A126-0C7401EAB6DF', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=524854cf9305ab673c80933705f1b1e09d2af3691eb2de9004b7fc2f32039b582de4f34d79c63142', NULL, '175.02', '9.13', '165.89', 1, '175.02', 4, '2020-08-23 22:07:23'),
(8, 8, 20, '2020-08-16 20:35:47', 'B7AB01C2-8F24-440A-8A70-E22BA8BD0F4E', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=f772a107d9d576cc1b91b95eaeb3481c46c6c1eccc652bbfa2592d8d542366bf43c0b203a8ee4c9b', NULL, '63.52', '3.57', '59.95', 1, '63.52', 10, '2020-08-23 22:07:23'),
(10, 10, 29, '2020-08-16 21:41:17', '05344955-4A4A-4279-BB6B-5CB24D3BC14C', 3, '302', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=4b8a9bb042e8f44cc152fb954a082cd7a76859702fc29d0008170442403a4143e25a72472739d672', NULL, '83.52', '4.57', '78.95', 1, '83.52', 7, '2020-08-23 19:36:30'),
(11, 11, 29, '2020-08-16 21:54:22', '63DF519D-398C-4913-B402-B7FB5AA3BE82', 3, '301', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=a4ca9fc08f4dc8f594b323395b54e75c61df10badfa15a0f082ddf240e1b9f90ca7527be9872c80d', NULL, '1274.52', '64.00', '1210.52', 1, '1274.52', 5, '2020-08-23 22:07:23'),
(13, 13, 20, '2020-08-17 02:58:47', '18F936F9-92AC-4612-9B9B-53ABE42A452B', 1, '101', NULL, NULL, '1524.51', '76.47', '1448.04', 1, '1524.51', 1, NULL),
(14, 14, 20, '2020-08-17 03:12:33', '11FAFF40-3A1C-4987-8A3F-DA0B9214A0DE', 1, '101', NULL, NULL, '1524.51', '76.47', '1448.04', 1, '1524.51', 6, '2020-08-23 19:40:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `cliente_user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `cliente_user_id`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', NULL, 'administrator', '$2y$12$oj6WOtG5A6FmlutuUtz.f.7yjpYi8eoECQFjfRcuyl3/xD/vJeVGG', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1598330786, 1, 'Lucio', 'Souza', 'ADMIN', '0'),
(2, '::1', NULL, 'lucio', '$2y$10$ORCSs9/42Gr05vUPif6hq.YKXvqJSk2lmjz8GWnJzWMJOSzSFZpEy', 'lucio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1594185130, 1596775424, 1, 'Lucio', 'Antonio', NULL, NULL),
(11, '::1', 3, 'Ciclano', '$2y$10$J/k1BANIpVxiVpnpo0GcI.eEUyOf61P9g7TkJgI6drLBzCxdyVx1e', 'ciclano@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597120074, NULL, 1, 'Ciclano', 'da Silva', NULL, '(41) 55564-4564'),
(17, '::1', 9, 'Pedro', '$2y$10$1Xo/Z6f18fUeaN68w61dfOJX2cb6vt/0q0huvmM2cprKEFMmnLIkG', 'pedro@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597133467, NULL, 1, 'Pedro', 'Luiz', NULL, '(41) 55151-5151'),
(18, '::1', 10, 'Maria', '$2y$10$uKvs8nCPEMpDlUDm3ziT3eZpACkECTriae.ac5/okrU3dkR0wdXvG', 'maria@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597301277, NULL, 1, 'Maria', 'Souza', NULL, '(45) 15151-5151'),
(19, '::1', 11, 'Ana', '$2y$10$do2jfZmDhWTuaOuzOJRCU.Gmn7sY4HvWa8qNvB3eYSWyWx135JjwW', 'ana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597303476, NULL, 1, 'Ana', 'Lúcia', NULL, '(69) 84546-8464'),
(36, '::1', 15, 'Luana', '$2y$10$T8xSKACCkrn.Xti0Q5CT5Oiw3XvU.D0bpOup1VjVurs8PKPPrR.H.', 'luana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597605975, NULL, 1, 'Luana', 'da Paz', NULL, '(89) 46465-4566'),
(38, '::1', 17, 'José', '$2y$10$cS8nZdoX9m1hzOK65zfdfuwFJEEGNzpUKF8O/jF1A4iuWYPj7Sym6', 'jose@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597608204, NULL, 1, 'José', 'de Paula', NULL, '(89) 46465-4654'),
(41, '::1', 20, 'Lucia', '$2y$10$09jsxAm0R/OTvmyPqXOlwOkIn9eRFEgimHhWrqBNPSqAxYLKyfVNu', 'lucia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597610143, 1597718798, 1, 'Lucia', 'da Luz', NULL, '(45) 48564-6565'),
(50, '::1', 29, 'Manoel', '$2y$10$LTBiIL4JkzWBHynmceA.suH2PwjjHup7i7oQgoo16YZYZ/UukNb5K', 'manoel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597614075, 1597614750, 1, 'Manoel', 'Ferreira', NULL, '(87) 54654-6515'),
(54, '::1', 33, 'Miriam', '$2y$10$KXHRUwHi0fnwBrPGTfNyDuslAEW.GxloKR.MW40Sj2zFbCcn9Bxz6', 'miriam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1597719667, 1597719734, 1, 'Miriam', 'Cruz', NULL, '(32) 4646-5155');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(8, 1, 1),
(31, 2, 2),
(32, 11, 2),
(43, 17, 2),
(44, 18, 2),
(45, 19, 2),
(62, 36, 2),
(64, 38, 2),
(67, 41, 2),
(76, 50, 2),
(80, 54, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `categoria_pai_id` (`categoria_pai_id`);

--
-- Índices para tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  ADD PRIMARY KEY (`categoria_pai_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices para tabela `config_correios`
--
ALTER TABLE `config_correios`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `pedido_cliente_id` (`pedido_cliente_id`);

--
-- Índices para tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD KEY `pedido_id` (`pedido_id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `produto_categoria_id` (`produto_categoria_id`),
  ADD KEY `produto_marca_id` (`produto_marca_id`);

--
-- Índices para tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `fk_foto_produto_id` (`foto_produto_id`);

--
-- Índices para tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`transacao_id`),
  ADD KEY `transacao_pedido_id` (`transacao_pedido_id`,`transacao_cliente_id`),
  ADD KEY `fk_transacao_cliente_id` (`transacao_cliente_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD KEY `cliente_user_id` (`cliente_user_id`);

--
-- Índices para tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  MODIFY `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `transacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_cliente_id` FOREIGN KEY (`pedido_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_transacao_cliente_id` FOREIGN KEY (`transacao_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_transacao_pedido_id` FOREIGN KEY (`transacao_pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_cliente_user_id` FOREIGN KEY (`cliente_user_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
