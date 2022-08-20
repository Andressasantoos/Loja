-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Ago-2022 às 01:30
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.34

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
(2, 2, 'Placas de Video 8GB', 1, 'placas-de-video-8gb', '2022-06-24 14:49:58', '2022-06-25 22:10:37'),
(4, 5, 'Processador I7', 1, 'processador-i7', '2022-06-25 19:42:48', '2022-07-04 16:26:41'),
(5, 7, 'SSD 250GB', 1, 'ssd-250gb', '2022-06-25 19:43:31', '2022-06-25 19:43:31'),
(6, 3, 'Placa Mãe Gamer', 1, 'placa-mae-gamer', '2022-06-30 22:39:36', '2022-06-30 22:39:36'),
(7, 8, 'Fonte 850w', 1, 'fonte-850w', '2022-06-30 22:40:04', '2022-06-30 22:40:04'),
(8, 9, 'Mouse de Led', 1, 'mouse-de-led', '2022-06-30 22:40:41', '2022-06-30 22:40:41'),
(9, 10, 'Notebook I5', 1, 'notebook-i5', '2022-06-30 22:42:56', '2022-06-30 22:42:56'),
(10, 10, 'Notebook i7', 1, 'notebook-i7', '2022-06-30 22:43:23', '2022-06-30 22:43:23'),
(11, 12, 'Phone de Led', 1, 'phone-de-led', '2022-06-30 22:45:32', '2022-06-30 22:45:32'),
(12, 11, 'Teclado Led Gamer', 1, 'teclado-led-gamer', '2022-06-30 22:46:01', '2022-06-30 22:46:26'),
(13, 13, 'Tela Full HD 48', 1, 'tela-full-hd-48', '2022-06-30 22:53:38', '2022-06-30 22:53:38'),
(14, 5, 'Processador I5', 1, 'processador-i5', '2022-06-30 23:11:26', '2022-06-30 23:11:26');

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
(2, 'Placa de Video', 1, 'placa-de-video', '2022-06-24 02:35:04', '2022-06-24 02:35:04'),
(3, 'Placa Mãe', 1, 'placa-mae', '2022-06-24 02:35:34', '2022-06-24 02:35:34'),
(5, 'Processador', 1, 'processador', '2022-06-24 16:43:54', '2022-06-24 16:43:54'),
(6, 'Jogos', 1, 'jogos', '2022-06-24 16:44:27', '2022-06-24 16:44:27'),
(7, 'SSD', 1, 'ssd', '2022-06-24 16:45:01', '2022-06-24 16:45:01'),
(8, 'Fontes', 1, 'fontes', '2022-06-30 22:37:58', '2022-06-30 22:37:58'),
(9, 'Mouse', 1, 'mouse', '2022-06-30 22:38:25', '2022-06-30 22:38:25'),
(10, 'Notebook', 1, 'notebook', '2022-06-30 22:38:51', '2022-06-30 22:38:51'),
(11, 'Teclado', 1, 'teclado', '2022-06-30 22:44:05', '2022-06-30 22:44:05'),
(12, 'Phones', 1, 'phones', '2022-06-30 22:44:45', '2022-06-30 22:44:45'),
(13, 'Tela', 1, 'tela', '2022-06-30 22:52:49', '2022-06-30 22:52:49');

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
  `cliente_numero_endereco` varchar(20) NOT NULL,
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
(1, '2022-07-15 00:22:31', 'Karol', 'Alvares dos Santos', '1194-06-16', '228.984.960-06', 'admin@admin.com', '', '(11) 96445-1732', '02929-050', 'Travessa Guiné Bissal', '45', 'Vila Moinho Velho', 'Curitiba', 'SC', '', '2022-07-15 00:22:31'),
(2, '0000-00-00 00:00:00', 'Matt', 'Gomes Alvares', '1194-06-03', '511.099.960-04', 'mat@hotmail.com', '', '(11) 94848-4774', '06420-460', 'Rua Vinte e Cinco de Janeiro', '205', 'Vila Moinho Velho', 'Barueri', 'SP', '', '0000-00-00 00:00:00'),
(4, '2022-07-20 16:00:38', 'Rhianna', 'Gomes Honorato', '2000-02-05', '133.891.820-63', 'rhianna@outlook.com', '', '(11) 99954-8888', '29795-982', 'Estrada Ebenezer', '1250', 'Ebenezer', 'Águia Branca', 'ES', '', '2022-07-20 16:00:38'),
(7, '2022-07-20 22:02:55', 'Sandy', 'Alvares Roberts', '2000-12-15', '755.780.070-23', 'sandy@hotmail.com', '', '(11) 54847-7777', '39338-972', 'Rua Luiz Ruas', '26', 'Centro', 'Campo Azul', 'MG', '', '2022-07-20 22:02:55'),
(8, '2022-07-26 23:41:53', 'Avril', 'Lavigne', '1990-06-03', '929.509.190-65', 'avril@gmail.com', NULL, '(11) 95448-8888', '04814-490', 'Rua Lúcio Petit da Silva', '123', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-07-26 23:41:53'),
(9, '2022-07-29 13:52:38', 'Jose', 'Honaroto', '1990-06-03', '404.629.360-82', 'jose@outlook.com', NULL, '(11) 95448-7777', '04814-490', 'Rua Lúcio Petit da Silva', '120', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-07-29 13:52:38'),
(10, '2022-07-29 13:55:36', 'jose', 'honaroto', '1990-06-03', '846.637.210-52', 'jose@hotmail.com', NULL, '(11) 95448-7700', '04814-490', 'Rua Lúcio Petit da Silva', '120', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-07-29 13:55:36'),
(11, '2022-07-29 13:58:29', 'José', 'Honorato', '1995-06-03', '683.330.320-79', 'josehonorato@hotmail.com', NULL, '(11) 95548-8777', '04814-490', 'Rua Lúcio Petit da Silva', '125', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-07-29 13:58:29'),
(12, '2022-07-29 23:50:02', 'Maria', 'Marimar', '1990-05-03', '472.473.790-57', 'maria@hotmail.com', '(11) 5664-7777', '(11) 55594-4888', '80540-000', 'Rua Alberto Folloni', '125', 'Ahú', 'Curitiba', 'SC', '', '2022-07-29 23:50:02'),
(13, '2022-08-02 22:54:21', 'Isis', 'Valverde', '1990-01-30', '427.758.480-28', 'isis@hotmail.com', NULL, '(11) 96512-1777', '04814-490', 'Rua Lúcio Petit da Silva', '120', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-02 22:54:21'),
(14, '2022-08-03 00:16:57', 'Ana', 'Julia', '1990-05-03', '894.281.610-04', 'anajulia@hotmail.com', NULL, '(11) 99944-4777', '04814-490', 'Rua Lúcio Petit da Silva', '125', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-03 00:16:57'),
(15, '2022-08-03 23:36:07', 'Manuel', 'Alvares', '1990-05-03', '669.061.580-40', 'manuel@hotmail.com', NULL, '(11) 11144-4555', '04814-490', 'Rua Lúcio Petit da Silva', '250', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-03 23:36:07'),
(22, '2022-08-06 20:02:52', 'Alberto', 'Santos', '1995-04-02', '021.712.250-76', 'alberto@hotmail.com', NULL, '(11) 44777-4444', '04814-490', 'Rua Lúcio Petit da Silva', '1245', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-06 20:02:52'),
(23, '2022-08-06 20:06:20', 'Aline', 'Ferreira', '1990-08-03', '597.663.580-60', 'aline@hotmail.com', NULL, '(11) 44444-4448', '04814-490', 'Rua Lúcio Petit da Silva', '250', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-06 20:06:20'),
(24, '2022-08-06 20:13:20', 'Carmelo', 'Silva Honorato', '1965-06-05', '959.503.940-38', 'carmelo@hotmail.com', NULL, '(11) 47788-8888', '04814-490', 'Rua Lúcio Petit da Silva', '1470', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-06 20:13:20'),
(25, '2022-08-11 03:26:27', 'Rochelle', 'Alves', '1994-05-03', '001.802.650-83', 'rechelle@hotmail.com', NULL, '(11) 94445-5555', '04814-490', 'Rua Lúcio Petit da Silva', '1203', 'Jardim Guanhembu', 'São Paulo', 'SP', NULL, '2022-08-11 03:26:27'),
(26, '2022-08-17 00:19:45', 'Roberto', 'Carlos', '1990-12-15', '110.985.150-21', 'roberto@hotmail.com', '(11) 5544-8877', '(11) 89444-8888', '04814-490', 'Rua Lucio Petit da Silva', '566', 'Jardim Guanhembu 2', 'São Paulo', 'SP', '', '2022-08-17 00:19:45');

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
(1, '04824-010', '04510', '04014', '3.50', '23.50', '2022-07-07 17:02:32');

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
(1, 'andressa.s-s@hotmail.com', '9E4BF05A6E9F490B977BA6C98AFEA41C', 1, '2022-07-13 18:41:12');

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
(2, 'cliente', 'Cliente');

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
(1, 'Samsung', 'samsung', 1, '2022-06-23 17:18:11', '2022-06-30 20:50:44'),
(3, 'Dell', 'dell', 1, '2022-06-23 20:02:11', '2022-06-30 21:42:56'),
(4, 'Vaio', 'vaio', 1, '2022-06-23 20:49:35', '2022-06-25 19:40:13'),
(5, 'Apple', 'apple', 1, '2022-06-23 23:38:53', NULL),
(7, 'Xiaomi', 'xiaomi', 1, '2022-06-30 20:51:11', NULL),
(8, 'Aourus', 'aourus', 1, '2022-06-30 20:51:41', NULL),
(9, 'Zotac', 'zotac', 1, '2022-06-30 20:52:02', NULL),
(10, 'NVIDIA', 'nvidia', 1, '2022-06-30 20:52:26', NULL),
(11, 'AMD', 'amd', 1, '2022-06-30 20:52:47', '2022-06-30 21:44:54'),
(12, 'Sony', 'sony', 1, '2022-06-30 20:53:14', NULL),
(13, 'Razer', 'razer', 1, '2022-06-30 20:53:35', NULL),
(14, 'Kingston', 'kingston', 1, '2022-06-30 20:54:04', NULL),
(15, 'Assus', 'assus', 1, '2022-06-30 22:47:47', NULL);

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
(1, '83107462', 12, '2500.00', '36.10', '2536.10', 1, '2022-07-29 23:50:09', NULL),
(2, '71024698', 13, '250.00', '26.00', '276.00', 2, '2022-08-02 22:54:29', NULL),
(3, '94715863', 12, '1199.90', '24.50', '1224.40', 1, '2022-08-03 00:07:18', NULL),
(4, '48129530', 14, '150.00', '24.50', '174.50', 1, '2022-08-03 00:17:03', NULL),
(5, '93162485', 15, '250.00', '26.00', '276.00', 2, '2022-08-03 23:36:14', NULL),
(6, '78069251', 15, '250.00', '41.70', '291.70', 2, '2022-08-03 23:58:27', NULL),
(7, '19046382', 23, '100.00', '24.50', '124.50', 1, '2022-08-06 20:06:24', NULL),
(8, '63879501', 24, '7800.00', '28.40', '7828.40', 2, '2022-08-06 20:13:25', NULL),
(9, '12630574', 15, '4999.99', '41.70', '5041.69', 2, '2022-08-06 20:52:53', NULL),
(10, '75968213', 25, '3500.00', '24.50', '3524.50', 1, '2022-08-11 03:26:38', NULL);

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
(1, 8, 'Tela 48 Full HD', 1, '2500.00', '2500.00'),
(2, 7, 'SSD 250g', 1, '250.00', '250.00'),
(3, 14, 'MONITOR GAMER MANCER VALAK, 23.6 POL VA, CURVO, FHD, 1MS, 180HZ, FREESYNC E G-SYNC, HDMI/DP, MCR-VLK24-BL01', 1, '1199.90', '1199.90'),
(4, 11, 'Phone de Led Gamer', 1, '150.00', '150.00'),
(5, 7, 'SSD 250g', 1, '250.00', '250.00'),
(6, 7, 'SSD 250g', 1, '250.00', '250.00'),
(7, 10, 'Mouse de Led', 1, '100.00', '100.00'),
(8, 8, 'Tela 48 Full HD', 1, '2500.00', '2500.00'),
(8, 13, 'PLACA DE VIDEO ASROCK RADEON RX 6700 XT CHALLENGER D 12GB GDDR6 OC 192-BIT, 90-GA31ZZ-00UANF', 1, '5300.00', '5300.00'),
(9, 1, 'Placa de Vídeo Zotac NVIDIA GeForce RTX 3070  8GB GDDR6, DLSS, LHR, Ray Tracing, Preto - 37NSL6MD2KCH', 1, '4999.99', '4999.99'),
(10, 6, 'Notebook I7 assus', 1, '3500.00', '3500.00');

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
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT 0,
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext DEFAULT NULL,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(1, '1010345', '2022-06-24 19:21:35', 2, 9, 'Placa de Vídeo Zotac NVIDIA GeForce RTX 3070  8GB GDDR6, DLSS, LHR, Ray Tracing, Preto - 37NSL6MD2KCH', 'placa-de-video-zotac-nvidia-geforce-rtx-3070-8gb-gddr6-dlss-lhr-ray-tracing-preto-37nsl6md2kch', 1, 15, 15, 15, '4999.99', 1, 1, 100, 1, 'Características:\r\n\r\n- Marca: Galax\r\n\r\n- Modelo: RTX 3070 1-Click\r\n\r\n\r\n\r\nEspecificações:\r\n\r\n\r\n\r\nGPU:\r\n\r\n- CUDA Cores 5888\r\n\r\n- Boost Clock (MHz) 1725\r\n\r\n- 1-Click OC Clock (MHz) 1740 (instalando o software Xtreme Tuner Plus e usando 1-Click OC)\r\n\r\n\r\n\r\nMemória:\r\n\r\n- Velocidade da Memória 14 Gbps\r\n\r\n- Configuração de Memória Padrão de 8GB\r\n\r\n- Largura da interface de Memória GDDR6 de 256bits\r\n\r\n- Largura de banda da Memória (GB/s) 448\r\n\r\n- Memória Gráfica GDDR6\r\n\r\n\r\n\r\nSuporte de Recursos:\r\n\r\n- PCI-E 4.0\r\n\r\n- Windows 10 de 64 bits, Linux de 64 bits\r\n\r\n\r\n\r\nRecurso de Fans:\r\n\r\n- 2 x 102mm\r\n\r\n- Parada do ventilador Ocioso (todos os ventiladores)\r\n\r\n\r\n\r\nSuporte de Exibição:\r\n\r\n- DisplayPort 1.4\r\n\r\n- 3x HDMI 2.1\r\n\r\n\r\n\r\nCor:\r\n\r\n- Preto\r\n\r\n\r\n\r\nRecursos Especiais:\r\n\r\n- LHR (Taxa de Hash Leve) Oferece taxa de hash ETH de 43MH/s (est.).\r\n\r\n- Núcleos de Rastreamento de Raios de 2ª Geração\r\n\r\n- Núcleos de Tensor de 3ª Geração\r\n\r\n- Microsoft DirectX Ultimate\r\n\r\n- NVIDIA DLSS\r\n\r\n- NVIDIA GeForce Experience\r\n\r\n- NVIDIA G-SYNC\r\n\r\n- NVIDIA GPU Boost\r\n\r\n- Drivers Prontos para Jogos\r\n\r\n- Vulkan RT API, OpenGL 4.6\r\n\r\n- DisplayPort 1.4a, HDMI 2.1\r\n\r\n- HDCP 2.3\r\n\r\n- VR Pronto\r\n\r\n\r\n\r\nRequerimento/Compatibilidade:\r\n\r\n- Placa-mãe Compatível com PCI Express com um Slot Gráfico de Largura Dupla x 16\r\n\r\n- Espaço do Sistema para Cartão de 3 Slots Necessário\r\n\r\n- 2 x Conectores de Alimentação Suplementares PCIe de 8 Pinos\r\n\r\n- Fonte de Alimentação do Sistema Mínima de 650W ou superior\r\n\r\n- Memória de Sistema de 32GB Recomendada)\r\n\r\n- Microsoft Windows 10 de 64 bits (Build 2004 ou Posterior Recomendado) ou Linux de 64 bits\r\n\r\n\r\n\r\nBios:\r\n\r\n- Atualização do BAR BIOS Redimensionável para GeForce RTX 30 series: Link\r\n\r\n\r\n\r\nConteúdo da Embalagem:\r\n\r\n- Placa de Vídeo Galax NVIDIA GeForce RTX 3070 1-Click\r\n\r\n\r\nGarantia:\r\n1 ano de garantia (9 meses de garantia contratual junto ao fabricante + 3 meses referentes à garantia legal, nos termos do artigo 26, II, do Código de Defesa do Consumidor)\r\n\r\nPeso:\r\n1666 gramas (bruto com embalagem)', NULL),
(3, '73408591', '2022-06-30 22:33:26', 9, 3, 'Notebook Del I5', 'notebook-del-i5', 1, 15, 15, 15, '1900.00', 1, 1, 5, 1, 'Notebook dell com processador I5', NULL),
(4, '87569120', '2022-06-30 22:34:54', 6, 13, 'Placa Mãe Gamer', 'placa-mae-gamer', 1, 15, 15, 15, '190.00', 1, 1, 2, 1, 'Placa mãe com processador gamer', NULL),
(5, '12796483', '2022-06-30 22:36:20', 7, 12, 'Fonte 800w Plus Gold', 'fonte-800w-plus-gold', 1, 15, 15, 15, '700.00', 1, 1, 0, 1, 'Fonte Quazar', NULL),
(6, '50672319', '2022-06-30 22:50:39', 10, 15, 'Notebook I7 assus', 'notebook-i7-assus', 1, 15, 15, 15, '3500.00', 1, 1, 2, 1, 'Notebook I7 da Assus', NULL),
(7, '09264731', '2022-06-30 22:52:07', 5, 14, 'SSD 250g', 'ssd-250g', 1, 15, 15, 15, '250.00', 1, 1, 100, 1, 'SSD 250g nvme', NULL),
(8, '56138029', '2022-06-30 22:55:19', 13, 1, 'Tela 48 Full HD', 'tela-48-full-hd', 1, 15, 15, 15, '2500.00', 1, 1, 2, 1, 'Tela Full Hd 48 Polegadas', NULL),
(9, '20413685', '2022-06-30 23:03:19', 12, 7, 'Teclado Multilaser', 'teclado-multilaser', 1, 15, 15, 15, '59.00', 1, 1, 10, 1, 'Teclado de Led Multilaser para game e trabalho', NULL),
(10, '61437890', '2022-06-30 23:05:32', 8, 4, 'Mouse de Led', 'mouse-de-led', 1, 15, 15, 15, '100.00', 1, 1, 20, 1, 'Mouse de Led com fio', NULL),
(11, '92038746', '2022-06-30 23:07:36', 11, 8, 'Phone de Led Gamer', 'phone-de-led-gamer', 1, 15, 15, 15, '150.00', 1, 1, 100, 1, 'Phone de led de gamer', NULL),
(12, '60982517', '2022-06-30 23:14:21', 14, 11, 'Processador I5', 'processador-i5', 1, 15, 15, 15, '1200.00', 1, 1, 0, 1, 'Processador I5 AMD', NULL),
(13, '06157349', '2022-07-04 16:16:37', 2, 8, 'PLACA DE VIDEO ASROCK RADEON RX 6700 XT CHALLENGER D 12GB GDDR6 OC 192-BIT, 90-GA31ZZ-00UANF', 'placa-de-video-asrock-radeon-rx-6700-xt-challenger-d-12gb-gddr6-oc-192-bit-90-ga31zz-00uanf', 1, 15, 15, 15, '5300.00', 1, 1, 45, 1, 'Marca: ASRock\r\nModelo: 90-GA31ZZ-00UANF\r\nGPU: AMD Radeon™ RX 6700 XT\r\nMemória: 12GB GDDR6\r\nClock do processador: Boost: Até 2615 MHz\r\nGame: Até 2433 MHz\r\nBase: 2330 MHz\r\nProcessadores de fluxo: 2560\r\nClock de memória: 16 Gbps\r\nInterface de memória: 192-bit\r\nResolução Digital Máxima: 7680 x 4320\r\nEntradas: 1 x HDMI™ 2.1 VRR\r\n3 x DisplayPort™ 1.4 with DSC\r\nHDCP: Sim\r\nMulti-view: 4\r\nTipo de barramento: PCI® Express 4.0 x16\r\nDirectX: 12 Ultimate\r\nOpenGL: 4.6\r\nPSU recomendado: 650W\r\nConectores: 2 x 8-pinos\r\nDimensões: 269 x 134 x 41 mm', NULL),
(14, '53169402', '2022-07-04 16:21:17', 13, 3, 'MONITOR GAMER MANCER VALAK, 23.6 POL VA, CURVO, FHD, 1MS, 180HZ, FREESYNC E G-SYNC, HDMI/DP, MCR-VLK24-BL01', 'monitor-gamer-mancer-valak-236-pol-va-curvo-fhd-1ms-180hz-freesync-e-g-sync-hdmidp-mcr-vlk24-bl01', 1, 15, 15, 15, '1199.90', 1, 1, 25, 1, '', NULL),
(15, '76348519', '2022-07-04 16:30:23', 4, 15, 'Processador Intel Core i7-10700F, Cache 16MB, 2.9GHz (4.8GHz Max Turbo), LGA 1200 - BX8070110700F', 'processador-intel-core-i7-10700f-cache-16mb-29ghz-48ghz-max-turbo-lga-1200-bx8070110700f', 1, 15, 15, 15, '1779.90', 1, 1, 45, 1, 'Processador Intel Core i7-10700F Os novos processadores Intel Core da 10ª Geração oferecem atualizações de desempenho incríveis para melhorar a produtividade e proporcionar entretenimento surpreendente, incluindo até 5,3 GHz, Intel® Wi-Fi 6 (Gig) tecnologia Thunderbolt™ 3, HDR 4K, otimização de sistema inteligentes e muito mais. Produtividade acelerada Recursos de desempenho inteligente integrados aprendem e se adaptam ao que você faz, direcionando potência dinamicamente para onde ela é mais necessária. Os processadores Intel® Core™ da 10ª Geração com memória Intel® Optane™ fornecem a responsividade para fazer mais. A melhor conectividade da categoria1 Com Intel® Wi-Fi 6 (Gig+), conexão Ethernet Intel® I225 e tecnologia Thunderbolt™ 3 integrados, os processadores Intel® Core™ da 10ª Geração oferecem conectividade cabeada e sem fio rápida, garantida e versátil. Entretenimento premium Uma nova arquitetura de gráficos oferece suporte a experiências visuais ultravívidas, como vídeo em HDR 4K e jogos a 1080p. Os processadores Intel® Core™ da 10 ª Geração com gráficos Intel® Iris® Plus permitem experiências de entretenimento nunca vistas. Jogos sérios (serious gaming) Aproveite jogos incríveis com alto FPS, até mesmo enquanto realiza streaming e gravação com até 5,3 GHz. Turbo e aceleração da memória Intel® Optane™. Em casa ou em qualquer lugar, processadores Intel® Core™ da 10ª Geração capazes de overclocking rodam as plataformas definitivas de jogos em notebooks e desktops. Garanta já o seu processador Intel Core i7-10700F no KaBuM!', NULL);

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
(88, 9, 'ee303c1188436192c30d1ee1ee1424d9.jpg'),
(89, 9, '2b7a9024433a46d8fdb6a84747723329.jpg'),
(90, 9, '779fd415f9ae446cd02829565ef0f0d2.jpg'),
(91, 9, '970c107cf92c4057bf5f5c95b0d386c6.jpg'),
(92, 6, 'b151d77542fd81538afefd8334bbf714.jpg'),
(93, 6, '16f39b99ea32e5ca4cf7e390d93e309d.jpg'),
(94, 6, 'f266e94e6bd9c1af7de08492b65367a9.jpg'),
(98, 10, '0ab76b68aee56b3912d222e2287ede4c.jpg'),
(99, 10, '4a6651f13687521a7afe618abf2d0beb.jpg'),
(100, 10, '26ba3f517e9a589f739d0154d39b96b2.jpg'),
(101, 10, 'e7420aab9005c6b1cd950712ccf77d50.jpg'),
(102, 3, '4de9761a0e41f077436d5e0b32d82f39.jpg'),
(103, 3, 'e95740f72078f6c08dba6b7c0f2c318e.jpg'),
(104, 3, 'f7320ba51b63756603b00eaa250362bc.jpg'),
(108, 8, 'd9f9bc3472e7a0f8765632c731ed07be.jpg'),
(109, 8, 'f1765561d99962a0a44d7a28eade6adb.jpg'),
(110, 8, '15d1484e6b44f2f323cba254e200b48e.jpg'),
(111, 8, '27dc18a4cc6cce91fc2d5223938a3abc.jpg'),
(112, 11, 'ed602c46836b01c26b7866f3d1474dd4.jpg'),
(128, 5, 'ff6df2acb0c8433ccfb2842e7c33367b.jpg'),
(129, 5, 'd6383d5612fc4ce8cb33ed9cdfae668b.jpg'),
(130, 5, '3118076f544a781bfa6427d1945a0403.jpg'),
(131, 5, 'c32f7087ed78aff213c4db31efa877d4.jpg'),
(137, 14, 'e9857101534cd93c95ca092c6adf6466.jpg'),
(138, 14, '271d5a1417882876ada58b44a11541e8.jpg'),
(139, 14, 'd5ba2e547f15f5c32afac97ead08d052.jpg'),
(140, 14, 'b325454679ee02f4ba490e2e04e1ca68.jpg'),
(141, 14, '28271b3556103e9d72eb849b607f42ff.jpg'),
(142, 12, 'c24ca717d26313e96f0f8e9384b31abf.jpg'),
(143, 12, 'abb9e4556b1aa31e82327e358a65aef6.jpg'),
(144, 12, '2fe740a7b477ed2ec8c4f8f0ec0f62e1.jpg'),
(145, 15, 'b454129c129c0bcee5b86ed0816b8fe3.jpg'),
(146, 15, '3b6ffdaa5f43895f1d7ad9d619ee2c4d.jpg'),
(147, 15, '50d88cf77186b84e136e0ca8827bbb52.jpg'),
(148, 15, '3c39c026b70f275a42bf746769d4ae1e.jpg'),
(149, 15, 'ca71988de2f465b6e06737398e04821c.jpg'),
(155, 13, '38b5fdc6bc355085282f19312437e114.jpg'),
(156, 13, '56dafa01a9af007f4fd7ec7f8a6c499f.jpg'),
(157, 13, '8ab2e2c31fca2d445b803a1dd3ffe40d.jpg'),
(158, 13, '981292b08c14fd06b8cfe6aa86bbf3bf.jpg'),
(159, 13, 'bbdf63695b35d8ae3e32f2adef021523.jpg'),
(167, 1, '711aea56fe876ff21b1f37f51a3ffdc7.jpg'),
(168, 1, '66f864c228d7782b5871f75d9abe1da5.jpg'),
(169, 1, '2eab3b6992c2ec6d8ee491b9d585a817.jpg'),
(170, 1, 'b581f62b6a3dec591eaab98d155c3a2a.jpg'),
(171, 1, '8684147884d4bfe82e8bbc500f459463.jpg'),
(172, 4, 'ef476798831b946b2035d82ba9d493a7.jpg'),
(173, 4, '6bb4a396e885962c695b0bbe3bb98a6a.jpg'),
(174, 4, '55366fe96bd617e0eb4a10fdb605fdf0.jpg'),
(175, 7, '9b14ce25ef27e73498f55608065c5a68.jpg'),
(176, 7, '59671abb8c93ca614a24147183acb0dc.jpg');

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
(1, 'Loja virtual Vende Tudo LTDA', 'Vende Tudo', '80.838.809/0001-26', '683.90228-49', '(11) 2222-2222', '(11) 9999-9999', 'vendetudo@contato.com.br', 'http://vendetudo.com.br', '80510-000', 'Rua da Programação', '54', 'São Paulo', 'SP', 6, 'Preço e qualidade!', '2022-06-30 20:47:39');

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
(1, 1, 12, '2022-07-29 23:50:10', '66802CAC-99EE-42BF-B0AA-DA2C262A61AC', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=d0ae49c8e05f647091b2bf73d9a7391ab248e006f16a000a82265cbb6c7502c6d62ae7c203a0c563', NULL, '2536.10', '126.95', '2409.15', 1, '2536.10', 1, NULL),
(2, 2, 13, '2022-08-02 22:54:30', 'A894F8E3-9245-4868-A8EA-8C99B80C57C4', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=82c70081a60b59e414f90a8ec090a3cf9d88832cf836b25907a09f7554e8d13e815461a6f2ee9fa9', NULL, '276.00', '14.17', '261.83', 1, '276.00', 1, NULL),
(3, 3, 12, '2022-08-03 00:07:18', 'E1004061-7EBD-449E-B060-4D703C2B4E5E', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=6605ec7e9107ec81fa3615ad80e4db70f8770e8bf19fa1db39a55c33915863fcb9b72f3e22620a93', NULL, '1224.40', '61.50', '1162.90', 1, '1224.40', 1, NULL),
(4, 4, 14, '2022-08-03 00:17:03', 'DE46818C-15A6-44E8-847D-5BE8909392CF', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=e5ae19ddff1f78aa6474ce0c3cb862921ee6b99ad7a1acd58d8657ef0e57d9f9caf6b82dabc7f288', NULL, '174.50', '9.11', '165.39', 1, '174.50', 1, NULL),
(5, 5, 15, '2022-08-03 23:36:15', 'BB95BAF0-A647-47D9-A9FB-017F8A3D1F5C', 3, '301', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=e44a4bd6c190b9ff1cdd616c68b0ee725b90d3fb9c2201acf6c54936c629c8c5501b6e0a16585d8a', NULL, '276.00', '14.17', '261.83', 1, '276.00', 1, NULL),
(6, 6, 15, '2022-08-03 23:58:28', '86FC9895-7BE9-4AED-88A8-5B96F4F0085C', 3, '304', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=71ec757190d156ff01e93433c3a83626fb05ddbdea89aada6d042b70379ad8edb1500bfc47fd2ab0', NULL, '291.70', '14.96', '276.74', 1, '291.70', 3, '2022-08-20 22:16:55'),
(7, 7, 23, '2022-08-06 20:06:25', '444AB258-C107-466E-AC1A-7C44BF46A07A', 1, '101', NULL, NULL, '124.50', '6.61', '117.89', 1, '124.50', 1, NULL),
(8, 8, 24, '2022-08-06 20:13:25', '05848C51-50A2-409F-BDE5-8C69147BE408', 1, '101', NULL, NULL, '7828.40', '391.04', '7437.36', 1, '7828.40', 1, NULL),
(9, 9, 15, '2022-08-06 20:52:53', '7D18A417-AB14-449C-8CE6-74BED22B9D84', 1, '101', NULL, NULL, '5041.69', '251.98', '4789.71', 1, '5041.69', 2, '2022-08-20 22:11:48'),
(10, 10, 25, '2022-08-11 03:26:38', 'F79F6736-503F-4766-A551-5E31EE4B7C0D', 1, '101', NULL, NULL, '3524.50', '176.27', '3348.23', 1, '3524.50', 1, NULL);

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
(1, '127.0.0.1', NULL, 'administrator', '$2y$12$Q2A1wHQjYV0vad.36fkBX.AylR24Ce1ZAmhCviBumyivUMVbT/YBi', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1661035604, 1, 'Andie', 'Administradora', 'ADMIN', '0'),
(6, '', 1, 'karolzinha', '$2y$10$QUifaQLghsGPVYiX06ItXOPVBdcCM8NEiUWwBhX50..QZLI5uGQb6', 'karol@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1268889823, NULL, 1, 'karolg', 'Alvares', NULL, NULL),
(8, '::1', 4, 'Rhianna', '$2y$10$MkSYPwCAxDcye5Xyirp9puaFI9dLK7Cf6QrsuafjyIGooNkQmgP2e', 'rhianna@outlook.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1658332839, 1658856190, 1, 'Rhianna', 'Gomes Honorato', NULL, '(11) 99954-8888'),
(11, '::1', 7, 'Sandy', '$2y$10$bhR2aYBtDfgUTOk87LhzIuK9E3Tw0bO9mOk/rAj49hG/ayyc461CG', 'sandy@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1658354575, 1658364074, 1, 'Sandy', 'Alvares Roberts', NULL, '(11) 54847-7777'),
(12, '::1', 8, 'Avril', '$2y$10$MP2PCFuuMOhYLtrxRg2jROZgMn9wSmKl4WfYmfs.Hc.Otw1qNmdby', 'avril@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1658878914, NULL, 1, 'Avril', 'Lavigne', NULL, '(11) 95448-8888'),
(13, '::1', 9, 'Jose', '$2y$10$AgOTS2jJ7/2l715h5KJqQexZMBpqkkqmn4jl72bbZXRbx6O5qqLi.', 'jose@outlook.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659102761, NULL, 1, 'Jose', 'Honaroto', NULL, '(11) 95448-7777'),
(14, '::1', 10, 'jose', '$2y$10$lQ2vQ.iqXjobBXPPC7pMzOjDtgK6zubczrDXvTW47IsURvqy96sFe', 'jose@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659102937, NULL, 1, 'jose', 'honaroto', NULL, '(11) 95448-7700'),
(15, '::1', 11, 'José', '$2y$10$FQc2a0inOBxKEDc2yOvxu.NPQSZPXEpp1Setq8qG6lF8N1wZeCWIG', 'josehonorato@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659103109, NULL, 1, 'José', 'Honorato', NULL, '(11) 95548-8777'),
(16, '::1', 12, 'Maria', '$2y$10$YEz/jjCILiDTS5yi9th.4u6e8i0QAWU5/Sm7idgyScCLIjkIdWrW.', 'maria@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659138603, 1660693157, 1, 'Maria', 'Marimar', NULL, '(11) 55594-4888'),
(17, '::1', 13, 'Isis', '$2y$10$zzImr.BTGwzcoaScGWA56OFeFyotT4oKT5CuyUe./Bv7qOm.xMjXS', 'isis@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659480863, NULL, 1, 'Isis', 'Valverde', NULL, '(11) 96512-1777'),
(18, '::1', 14, 'Ana', '$2y$10$xzAYGP8VudlNoD5uuzngPOHgHg5Nz2YHS/aZdsZXsgaPddN6vK43G', 'anajulia@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659485817, NULL, 1, 'Ana', 'Julia', NULL, '(11) 99944-4777'),
(19, '::1', 15, 'Manuel', '$2y$10$sprbW5.o84UglxMBWnjEweGCdD2pZmryQj9Zz8ldgsZgBIPQltkZK', 'manuel@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659569769, 0, 1, 'Manuel', 'Alvares', NULL, '(11) 11144-4555'),
(26, '::1', 22, 'Alberto', '$2y$10$cMNbZfJaW.EdPRUNvsqAge3OqGJL686MSX9TeZGB9hJ4ladVT7Cq.', 'alberto@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659816172, NULL, 1, 'Alberto', 'Santos', NULL, '(11) 44777-4444'),
(27, '::1', 23, 'Aline', '$2y$10$Xxu1ed3mi.u03C0RUXpPV.atnTouuHgb0pUxF8f5E9EqUpDHLTLKO', 'aline@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659816380, NULL, 1, 'Aline', 'Ferreira', NULL, '(11) 44444-4448'),
(28, '::1', 24, 'Carmelo', '$2y$10$wSHiS9xo8CHRsflsoKK1Y.MoNPfrz3DJWbWK4akUldiF566lkg6PW', 'carmelo@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1659816800, 0, 1, 'Carmelo', 'Silva Honorato', NULL, '(11) 47788-8888'),
(29, '::1', 25, 'Rochelle', '$2y$10$3mEUgKVj2p8uZelJkPt4ouiLd/sPlS87ZMdGgwmXED.8ubLNdMx8K', 'rechelle@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1660188391, NULL, 1, 'Rochelle', 'Alves', NULL, '(11) 94445-5555'),
(30, '::1', 26, 'Roberto', '$2y$10$lgFXyEn6M9sjdSk1KbIrO.YwPCLWaGdzxJYI26uTScq4PMOyRCJD.', 'roberto@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1660695586, 1660695674, 1, 'Roberto', 'Carlos', NULL, '(11) 89444-8888');

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
(7, 1, 1),
(28, 6, 2),
(29, 8, 2),
(30, 11, 2),
(31, 12, 2),
(32, 13, 2),
(33, 14, 2),
(34, 15, 2),
(35, 16, 2),
(36, 17, 2),
(37, 18, 2),
(38, 19, 2),
(45, 26, 2),
(46, 27, 2),
(47, 28, 2),
(48, 29, 2),
(49, 30, 2);

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
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  MODIFY `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `transacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
