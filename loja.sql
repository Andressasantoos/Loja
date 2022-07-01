-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jul-2022 às 18:27
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
(4, 5, 'Processadores I5', 1, 'processadores-i5', '2022-06-25 19:42:48', '2022-06-26 23:43:21'),
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
(1, '04824-010', '04510', '04014', '3.50', '21.50', '2022-06-29 16:09:57');

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
(1, 'andressa.s-s@hotmail.com', '9E4BF05A6E9F490B977BA6C98AFEA41C', 1, '2022-06-30 01:48:43');

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
(1, '1010345', '2022-06-24 19:21:35', 2, 9, 'RTX 3070', 'RTX 3070', 1, 10, 10, 10, '4999.99', 1, 1, 1, 1, 'RTX 3070 com 8gb melhore o gráfico do seu pc.', NULL),
(3, '73408591', '2022-06-30 22:33:26', 9, 3, 'Notebook Del I5', 'Notebook Del I5', 1, 4, 4, 4, '1900.00', 1, 1, 5, 1, 'Notebook dell com processador I5', NULL),
(4, '87569120', '2022-06-30 22:34:54', 6, 13, 'Placa Mãe Gamer', 'Placa Mãe Gamer', 1, 2, 2, 2, '190.00', 1, 1, 2, 1, 'Placa mãe com processador gamer', NULL),
(5, '12796483', '2022-06-30 22:36:20', 7, 12, 'Fonte 800w Plus Gold', 'Fonte 800w Plus Gold', 1, 1, 1, 1, '700.00', 1, 1, 10, 1, 'Fonte Quazar', NULL),
(6, '50672319', '2022-06-30 22:50:39', 10, 15, 'Notebook I7 assus', 'Notebook I7 assus', 2, 12, 12, 1, '3500.00', 1, 1, 2, 1, 'Notebook I7 da Assus', NULL),
(7, '09264731', '2022-06-30 22:52:07', 5, 14, 'SSD 250g', 'SSD 250g', 1, 5, 2, 12, '250.00', 1, 1, 100, 1, 'SSD 250g nvme', NULL),
(8, '56138029', '2022-06-30 22:55:19', 13, 1, 'Tela 48 Full HD', 'Tela 48 Full HD', 3, 50, 20, 10, '2500.00', 1, 1, 2, 1, 'Tela Full Hd 48 Polegadas', NULL),
(9, '20413685', '2022-06-30 23:03:19', 12, 7, 'Teclado Multilaser', 'Teclado Multilaser', 1, 20, 10, 10, '59.00', 1, 1, 10, 1, 'Teclado de Led Multilaser para game e trabalho', NULL),
(10, '61437890', '2022-06-30 23:05:32', 8, 4, 'Mouse de Led', 'Mouse de Led', 1, 5, 5, 5, '100.00', 1, 1, 20, 1, 'Mouse de Led com fio', NULL),
(11, '92038746', '2022-06-30 23:07:36', 11, 8, 'Phone de Led Gamer', 'Phone de Led Gamer', 1, 10, 10, 10, '150.00', 1, 1, 100, 1, 'Phone de led de gamer', NULL),
(12, '60982517', '2022-06-30 23:14:21', 2, 11, 'Processador I5', 'Processador I5', 1, 10, 10, 10, '1200.00', 1, 1, 120, 1, 'Processador I5 AMD', NULL);

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
(29, 1, '711aea56fe876ff21b1f37f51a3ffdc7.jpg'),
(30, 1, '66f864c228d7782b5871f75d9abe1da5.jpg'),
(42, 5, 'ff6df2acb0c8433ccfb2842e7c33367b.jpg'),
(43, 5, 'd6383d5612fc4ce8cb33ed9cdfae668b.jpg'),
(44, 5, '3118076f544a781bfa6427d1945a0403.jpg'),
(45, 5, 'c32f7087ed78aff213c4db31efa877d4.jpg'),
(53, 6, 'b151d77542fd81538afefd8334bbf714.jpg'),
(54, 6, '16f39b99ea32e5ca4cf7e390d93e309d.jpg'),
(55, 6, 'f266e94e6bd9c1af7de08492b65367a9.jpg'),
(56, 7, '9b14ce25ef27e73498f55608065c5a68.jpg'),
(57, 7, '59671abb8c93ca614a24147183acb0dc.jpg'),
(58, 8, 'd9f9bc3472e7a0f8765632c731ed07be.jpg'),
(59, 8, 'f1765561d99962a0a44d7a28eade6adb.jpg'),
(60, 8, '15d1484e6b44f2f323cba254e200b48e.jpg'),
(61, 8, '27dc18a4cc6cce91fc2d5223938a3abc.jpg'),
(62, 9, 'ee303c1188436192c30d1ee1ee1424d9.jpg'),
(63, 9, '2b7a9024433a46d8fdb6a84747723329.jpg'),
(64, 9, '779fd415f9ae446cd02829565ef0f0d2.jpg'),
(65, 9, '970c107cf92c4057bf5f5c95b0d386c6.jpg'),
(66, 10, '0ab76b68aee56b3912d222e2287ede4c.jpg'),
(67, 10, '4a6651f13687521a7afe618abf2d0beb.jpg'),
(68, 10, '26ba3f517e9a589f739d0154d39b96b2.jpg'),
(69, 10, 'e7420aab9005c6b1cd950712ccf77d50.jpg'),
(70, 11, 'ed602c46836b01c26b7866f3d1474dd4.jpg'),
(71, 12, 'c24ca717d26313e96f0f8e9384b31abf.jpg'),
(72, 12, 'abb9e4556b1aa31e82327e358a65aef6.jpg'),
(73, 12, '2fe740a7b477ed2ec8c4f8f0ec0f62e1.jpg'),
(74, 3, '4de9761a0e41f077436d5e0b32d82f39.jpg'),
(75, 3, 'e95740f72078f6c08dba6b7c0f2c318e.jpg'),
(76, 3, 'f7320ba51b63756603b00eaa250362bc.jpg'),
(77, 4, 'ef476798831b946b2035d82ba9d493a7.jpg'),
(78, 4, '6bb4a396e885962c695b0bbe3bb98a6a.jpg'),
(79, 4, '55366fe96bd617e0eb4a10fdb605fdf0.jpg');

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
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
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

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$10$Ceea1DeRvpxUp.bnH69RdON1AKyDulYHAajDpBh3h7rtvOUX1vvDi', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1656620864, 1, 'Andie', 'Administradora', 'ADMIN', '0');

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
(7, 1, 1);

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
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

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
