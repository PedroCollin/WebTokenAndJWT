-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2021 às 13:27
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_fiap`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add aluno', 7, 'add_aluno'),
(26, 'Can change aluno', 7, 'change_aluno'),
(27, 'Can delete aluno', 7, 'delete_aluno'),
(28, 'Can view aluno', 7, 'view_aluno'),
(29, 'Can add empresa', 8, 'add_empresa'),
(30, 'Can change empresa', 8, 'change_empresa'),
(31, 'Can delete empresa', 8, 'delete_empresa'),
(32, 'Can view empresa', 8, 'view_empresa'),
(33, 'Can add fiap', 9, 'add_fiap'),
(34, 'Can change fiap', 9, 'change_fiap'),
(35, 'Can delete fiap', 9, 'delete_fiap'),
(36, 'Can view fiap', 9, 'view_fiap'),
(37, 'Can add importancia', 10, 'add_importancia'),
(38, 'Can change importancia', 10, 'change_importancia'),
(39, 'Can delete importancia', 10, 'delete_importancia'),
(40, 'Can view importancia', 10, 'view_importancia'),
(41, 'Can add pergunta', 11, 'add_pergunta'),
(42, 'Can change pergunta', 11, 'change_pergunta'),
(43, 'Can delete pergunta', 11, 'delete_pergunta'),
(44, 'Can view pergunta', 11, 'view_pergunta'),
(45, 'Can add satisfacao', 12, 'add_satisfacao'),
(46, 'Can change satisfacao', 12, 'change_satisfacao'),
(47, 'Can delete satisfacao', 12, 'delete_satisfacao'),
(48, 'Can view satisfacao', 12, 'view_satisfacao'),
(49, 'Can add turma', 13, 'add_turma'),
(50, 'Can change turma', 13, 'change_turma'),
(51, 'Can delete turma', 13, 'delete_turma'),
(52, 'Can view turma', 13, 'view_turma'),
(53, 'Can add upload csv', 14, 'add_uploadcsv'),
(54, 'Can change upload csv', 14, 'change_uploadcsv'),
(55, 'Can delete upload csv', 14, 'delete_uploadcsv'),
(56, 'Can view upload csv', 14, 'view_uploadcsv'),
(57, 'Can add usuario', 15, 'add_usuario'),
(58, 'Can change usuario', 15, 'change_usuario'),
(59, 'Can delete usuario', 15, 'delete_usuario'),
(60, 'Can view usuario', 15, 'view_usuario'),
(61, 'Can add ocorrencia', 16, 'add_ocorrencia'),
(62, 'Can change ocorrencia', 16, 'change_ocorrencia'),
(63, 'Can delete ocorrencia', 16, 'delete_ocorrencia'),
(64, 'Can view ocorrencia', 16, 'view_ocorrencia'),
(65, 'Can add observacao', 17, 'add_observacao'),
(66, 'Can change observacao', 17, 'change_observacao'),
(67, 'Can delete observacao', 17, 'delete_observacao'),
(68, 'Can view observacao', 17, 'view_observacao'),
(69, 'Can add materia', 18, 'add_materia'),
(70, 'Can change materia', 18, 'change_materia'),
(71, 'Can delete materia', 18, 'delete_materia'),
(72, 'Can view materia', 18, 'view_materia'),
(73, 'Can add frequencia', 19, 'add_frequencia'),
(74, 'Can change frequencia', 19, 'change_frequencia'),
(75, 'Can delete frequencia', 19, 'delete_frequencia'),
(76, 'Can view frequencia', 19, 'view_frequencia'),
(77, 'Can add formulario', 20, 'add_formulario'),
(78, 'Can change formulario', 20, 'change_formulario'),
(79, 'Can delete formulario', 20, 'delete_formulario'),
(80, 'Can view formulario', 20, 'view_formulario'),
(81, 'Can add assinatura', 21, 'add_assinatura'),
(82, 'Can change assinatura', 21, 'change_assinatura'),
(83, 'Can delete assinatura', 21, 'delete_assinatura'),
(84, 'Can view assinatura', 21, 'view_assinatura'),
(85, 'Can add aproveitamento', 22, 'add_aproveitamento'),
(86, 'Can change aproveitamento', 22, 'change_aproveitamento'),
(87, 'Can delete aproveitamento', 22, 'delete_aproveitamento'),
(88, 'Can view aproveitamento', 22, 'view_aproveitamento'),
(89, 'Can add aprendizagem', 23, 'add_aprendizagem'),
(90, 'Can change aprendizagem', 23, 'change_aprendizagem'),
(91, 'Can delete aprendizagem', 23, 'delete_aprendizagem'),
(92, 'Can view aprendizagem', 23, 'view_aprendizagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$qlyn9HhIDPtEhMS6Z3ZJLm$MVnuE6I8nuMbFxwxGrMpn5Z2joYbfET7QhLz+Pc1y7Q=', '2021-12-01 11:46:17.302921', 1, 'master', '', '', 'master@master.com', 1, 1, '2021-11-29 11:30:06.162098');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-11-29 11:34:22.341315', '1', 'Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 13, 1),
(2, '2021-11-29 11:34:26.081391', '1', 'Testando da Silva Nobrega', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-11-29 11:35:01.547670', '2', 'Carlos de Pras', 1, '[{\"added\": {}}]', 7, 1),
(4, '2021-11-29 11:35:23.819560', '3', 'Doze alberto silva', 1, '[{\"added\": {}}]', 7, 1),
(5, '2021-11-29 11:35:55.778477', '4', 'Alberto Arthur Junior', 1, '[{\"added\": {}}]', 7, 1),
(6, '2021-11-29 11:37:16.401097', '1', 'André Francisco Batista', 1, '[{\"added\": {}}]', 15, 1),
(7, '2021-11-29 11:37:18.992245', '1', '1', 1, '[{\"added\": {}}]', 9, 1),
(8, '2021-11-29 11:39:28.732519', '1', '1', 1, '[{\"added\": {}}]', 19, 1),
(9, '2021-11-29 11:40:14.594332', '1', '1', 1, '[{\"added\": {}}]', 17, 1),
(10, '2021-11-29 11:40:38.890689', '1', '1', 1, '[{\"added\": {}}]', 16, 1),
(11, '2021-11-29 11:41:21.016561', '1', 'Front-End', 1, '[{\"added\": {}}]', 18, 1),
(12, '2021-11-29 11:41:41.981691', '1', '1', 1, '[{\"added\": {}}]', 22, 1),
(13, '2021-11-29 11:42:18.396823', '1', '1', 1, '[{\"added\": {}}]', 23, 1),
(14, '2021-11-29 12:06:25.244992', '2', '2', 3, '', 19, 1),
(15, '2021-11-29 12:07:12.726175', '2', 'Desenvolvimento de Sistemas', 1, '[{\"added\": {}}]', 13, 1),
(16, '2021-11-29 12:07:51.544071', '2', 'Francisco Savedra Lima', 1, '[{\"added\": {}}]', 15, 1),
(17, '2021-11-29 12:07:54.041819', '3', '3', 1, '[{\"added\": {}}]', 9, 1),
(18, '2021-11-29 12:10:11.670731', '3', 'Lindomar Bastistao', 1, '[{\"added\": {}}]', 15, 1),
(19, '2021-11-29 12:10:22.334067', '4', '4', 1, '[{\"added\": {}}]', 9, 1),
(20, '2021-11-29 12:11:00.279974', '4', '4', 1, '[{\"added\": {}}]', 19, 1),
(21, '2021-11-29 12:11:08.834849', '5', '5', 1, '[{\"added\": {}}]', 19, 1),
(22, '2021-11-29 12:11:20.587983', '6', '6', 1, '[{\"added\": {}}]', 19, 1),
(23, '2021-11-29 12:12:04.877558', '3', '3', 3, '', 19, 1),
(24, '2021-11-29 12:13:15.075508', '2', 'Data-Analytics', 1, '[{\"added\": {}}]', 18, 1),
(25, '2021-11-29 12:13:28.902222', '3', 'Back-End', 1, '[{\"added\": {}}]', 18, 1),
(26, '2021-11-29 12:13:47.837734', '4', 'Linguagem de marcação', 1, '[{\"added\": {}}]', 18, 1),
(27, '2021-11-29 12:14:01.629469', '5', 'Desenvolvimento Mibile', 1, '[{\"added\": {}}]', 18, 1),
(28, '2021-11-29 12:14:14.820183', '6', 'Hardware', 1, '[{\"added\": {}}]', 18, 1),
(29, '2021-11-29 12:14:29.357390', '7', 'Programação OO', 1, '[{\"added\": {}}]', 18, 1),
(30, '2021-11-29 12:14:39.490819', '8', 'Back-End', 1, '[{\"added\": {}}]', 18, 1),
(31, '2021-11-29 12:17:35.391881', '2', '2', 1, '[{\"added\": {}}]', 17, 1),
(32, '2021-11-29 12:17:50.829478', '3', '3', 1, '[{\"added\": {}}]', 17, 1),
(33, '2021-11-29 12:18:35.653861', '4', '4', 1, '[{\"added\": {}}]', 17, 1),
(34, '2021-11-29 12:19:54.687822', '2', '2', 1, '[{\"added\": {}}]', 16, 1),
(35, '2021-11-29 12:20:04.109680', '3', '3', 1, '[{\"added\": {}}]', 16, 1),
(36, '2021-11-29 12:20:08.763359', '4', '4', 1, '[{\"added\": {}}]', 16, 1),
(37, '2021-11-29 12:21:21.790908', '4', 'Gabriel Ferreira', 1, '[{\"added\": {}}]', 15, 1),
(38, '2021-11-29 12:21:59.060759', '5', 'Dominique', 1, '[{\"added\": {}}]', 15, 1),
(39, '2021-11-29 12:22:56.594483', '6', 'Alex', 1, '[{\"added\": {}}]', 15, 1),
(40, '2021-12-01 11:46:35.167761', '1', 'back-End', 1, '[{\"added\": {}}]', 18, 1),
(41, '2021-12-01 11:46:39.910148', '2', 'Front-end', 1, '[{\"added\": {}}]', 18, 1),
(42, '2021-12-01 11:46:51.277140', '3', 'Data-Analytics', 1, '[{\"added\": {}}]', 18, 1),
(43, '2021-12-01 11:47:29.068474', '1', 'Aluno 1', 1, '[{\"added\": {}}]', 7, 1),
(44, '2021-12-01 11:47:45.426822', '2', 'Aluno 2', 1, '[{\"added\": {}}]', 7, 1),
(45, '2021-12-01 11:47:59.026944', '3', 'Aluno 3', 1, '[{\"added\": {}}]', 7, 1),
(46, '2021-12-01 11:48:26.511367', '3', '3DESM', 1, '[{\"added\": {}}]', 13, 1),
(47, '2021-12-01 11:53:55.427160', '1', '1', 1, '[{\"added\": {}}]', 9, 1),
(48, '2021-12-01 11:54:03.519607', '2', '2', 1, '[{\"added\": {}}]', 9, 1),
(49, '2021-12-01 11:54:14.886357', '3', '3', 1, '[{\"added\": {}}]', 9, 1),
(50, '2021-12-01 11:54:27.312359', '4', '4', 1, '[{\"added\": {}}]', 9, 1),
(51, '2021-12-01 11:54:38.720513', '5', '5', 1, '[{\"added\": {}}]', 9, 1),
(52, '2021-12-01 11:54:47.754012', '6', '6', 1, '[{\"added\": {}}]', 9, 1),
(53, '2021-12-01 11:54:55.970661', '7', '7', 1, '[{\"added\": {}}]', 9, 1),
(54, '2021-12-01 11:55:06.804595', '8', '8', 1, '[{\"added\": {}}]', 9, 1),
(55, '2021-12-01 11:55:15.271254', '9', '9', 1, '[{\"added\": {}}]', 9, 1),
(56, '2021-12-01 11:55:25.609749', '10', '10', 1, '[{\"added\": {}}]', 9, 1),
(57, '2021-12-01 12:11:54.244076', '11', '11', 1, '[{\"added\": {}}]', 9, 1),
(58, '2021-12-01 12:12:09.927783', '12', '12', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'aluno'),
(23, 'main', 'aprendizagem'),
(22, 'main', 'aproveitamento'),
(21, 'main', 'assinatura'),
(8, 'main', 'empresa'),
(9, 'main', 'fiap'),
(20, 'main', 'formulario'),
(19, 'main', 'frequencia'),
(10, 'main', 'importancia'),
(18, 'main', 'materia'),
(17, 'main', 'observacao'),
(16, 'main', 'ocorrencia'),
(11, 'main', 'pergunta'),
(12, 'main', 'satisfacao'),
(13, 'main', 'turma'),
(14, 'main', 'uploadcsv'),
(15, 'main', 'usuario'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-01 11:42:40.025876'),
(2, 'auth', '0001_initial', '2021-12-01 11:42:47.706463'),
(3, 'admin', '0001_initial', '2021-12-01 11:42:49.513869'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-01 11:42:49.547849'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-01 11:42:49.582829'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-01 11:42:50.572718'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-01 11:42:51.385323'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-01 11:42:51.514277'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-01 11:42:51.549257'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-01 11:42:51.997998'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-01 11:42:52.059962'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-01 11:42:52.099939'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-01 11:42:52.205878'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-01 11:42:52.306819'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-01 11:42:52.408761'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-01 11:42:52.443742'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-01 11:42:52.931459'),
(18, 'main', '0001_initial', '2021-12-01 11:43:14.471611'),
(19, 'main', '0002_auto_20211129_0830', '2021-12-01 11:43:14.833402'),
(20, 'main', '0003_auto_20211129_0832', '2021-12-01 11:43:14.894367'),
(21, 'main', '0004_auto_20211129_0908', '2021-12-01 11:43:14.958331'),
(22, 'main', '0005_auto_20211130_1025', '2021-12-01 11:43:17.683520'),
(23, 'main', '0006_auto_20211201_0842', '2021-12-01 11:43:17.768470'),
(24, 'sessions', '0001_initial', '2021-12-01 11:43:18.396107');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b5z8hw6sygzkqbvjitgkumxqd7hvqo1y', '.eJxVjDkOwjAUBe_iGlm2HC9Q0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv37owOrIJnHeMxrNwAA8uRCqlmOHsAtqBhFMw6KxEGyNZCamwQRNB1PsDCA44tg:1msO41:q5YibijylrXE4Z9kMsy_bfCb_p0GNTKOnekWDrKWgdQ', '2021-12-15 11:46:17.402846'),
('fr1f1bxkghwrdqjfh6tl7u9biplrp1b2', '.eJxVjDkOwjAUBe_iGlm2HC9Q0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv37owOrIJnHeMxrNwAA8uRCqlmOHsAtqBhFMw6KxEGyNZCamwQRNB1PsDCA44tg:1mrerc:ZU5cnhin4A5kexnO18TjoK56zcHxi4KIUSocxw9Zc2g', '2021-12-13 11:30:28.812357');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_aluno`
--

CREATE TABLE `main_aluno` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ra` varchar(8) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `turma_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `main_aluno`
--

INSERT INTO `main_aluno` (`id`, `nome`, `ra`, `cpf`, `turma_id`) VALUES
(1, 'Aluno 1', '92896432', '56344852155', 2),
(2, 'Aluno 2', '92896467', '77859546536', 1),
(3, 'Aluno 3', '56465165', '1548974445', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_aprendizagem`
--

CREATE TABLE `main_aprendizagem` (
  `id` bigint(20) NOT NULL,
  `atencao` tinyint(1) DEFAULT NULL,
  `compreensao` tinyint(1) DEFAULT NULL,
  `comprometimento` tinyint(1) DEFAULT NULL,
  `relacionamento` tinyint(1) DEFAULT NULL,
  `Outros` varchar(100) DEFAULT NULL,
  `fiap_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_aproveitamento`
--

CREATE TABLE `main_aproveitamento` (
  `id` bigint(20) NOT NULL,
  `notamedia` int(11) NOT NULL,
  `notaaluno` int(11) NOT NULL,
  `notarec` int(11) DEFAULT NULL,
  `fiap_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_assinatura`
--

CREATE TABLE `main_assinatura` (
  `id` bigint(20) NOT NULL,
  `docente` longtext NOT NULL,
  `coordenador` longtext NOT NULL,
  `social` longtext NOT NULL,
  `aluno` longtext NOT NULL,
  `responsavel` longtext NOT NULL,
  `fiap_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_empresa`
--

CREATE TABLE `main_empresa` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_fiap`
--

CREATE TABLE `main_fiap` (
  `id` bigint(20) NOT NULL,
  `progresso` varchar(20) NOT NULL,
  `dataInicio` datetime(6) NOT NULL,
  `dataFinal` datetime(6) DEFAULT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `turma_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `materia_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `main_fiap`
--

INSERT INTO `main_fiap` (`id`, `progresso`, `dataInicio`, `dataFinal`, `aluno_id`, `turma_id`, `usuario_id`, `materia_id`) VALUES
(1, '1', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 1, 1, 1, 1),
(2, '1', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 2, 1, 1, 2),
(3, '1', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 3, 2, 2, 3),
(4, '1', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 1, 1, 3, 1),
(5, '2', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 2, 3, 3, 1),
(6, '2', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 1, 1, 1, 3),
(7, '2', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 3, 2, 1, 2),
(8, '3', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 2, 1, 2, 1),
(9, '2', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 3, 1, 3, 1),
(10, '3', '2021-12-01 11:53:39.000000', '2021-12-01 11:53:39.000000', 1, 1, 3, 1),
(11, '1', '2021-12-01 11:10:26.000000', '2021-12-01 12:10:26.000000', 1, 3, 3, 3),
(12, '2', '2021-12-01 11:15:26.000000', '2021-12-01 12:10:26.000000', 2, 3, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_formulario`
--

CREATE TABLE `main_formulario` (
  `id` bigint(20) NOT NULL,
  `feedback` varchar(200) NOT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `importancia_id` bigint(20) NOT NULL,
  `pergunta_id` bigint(20) NOT NULL,
  `satisfacao_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_frequencia`
--

CREATE TABLE `main_frequencia` (
  `id` bigint(20) NOT NULL,
  `aulasprevistas` int(11) NOT NULL,
  `ausencias` int(11) NOT NULL,
  `fiap_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_importancia`
--

CREATE TABLE `main_importancia` (
  `id` bigint(20) NOT NULL,
  `nivel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_materia`
--

CREATE TABLE `main_materia` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `main_materia`
--

INSERT INTO `main_materia` (`id`, `nome`) VALUES
(1, 'back-End'),
(2, 'Front-end'),
(3, 'Data-Analytics');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_observacao`
--

CREATE TABLE `main_observacao` (
  `id` bigint(20) NOT NULL,
  `observacao` varchar(500) NOT NULL,
  `data` datetime(6) NOT NULL,
  `fiap_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_ocorrencia`
--

CREATE TABLE `main_ocorrencia` (
  `id` bigint(20) NOT NULL,
  `advverbal` tinyint(1) DEFAULT NULL,
  `advescrita` tinyint(1) DEFAULT NULL,
  `afastamento` tinyint(1) DEFAULT NULL,
  `cancelmatricula` tinyint(1) DEFAULT NULL,
  `fiap_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_pergunta`
--

CREATE TABLE `main_pergunta` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_satisfacao`
--

CREATE TABLE `main_satisfacao` (
  `id` bigint(20) NOT NULL,
  `nivel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_turma`
--

CREATE TABLE `main_turma` (
  `id` bigint(20) NOT NULL,
  `cod_turma` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `periodo` varchar(15) NOT NULL,
  `dataInicio` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `main_turma`
--

INSERT INTO `main_turma` (`id`, `cod_turma`, `nome`, `periodo`, `dataInicio`) VALUES
(1, '2DESM', 'Desenvolvimento de Sistemas', '1', '2021-11-29 11:32:16.000000'),
(2, '1DEST', 'Desenvolvimento de Sistemas', '2', '2021-11-29 11:57:02.000000'),
(3, '3DESM', 'Desenvolvimento de Sistemas', '1', '2021-12-01 11:46:08.000000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_uploadcsv`
--

CREATE TABLE `main_uploadcsv` (
  `id` bigint(20) NOT NULL,
  `File` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_usuario`
--

CREATE TABLE `main_usuario` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `identificador` varchar(30) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `nivelAcesso` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `main_usuario`
--

INSERT INTO `main_usuario` (`id`, `nome`, `identificador`, `senha`, `nivelAcesso`) VALUES
(1, 'André Francisco Batista', '92896500', 'admin123', '2'),
(2, 'Francisco Savedra Lima', '92866573', 'master321', '2'),
(3, 'Lindomar Bastistao', '92896521', 'master213', '2'),
(4, 'Gabriel Ferreira', '92896430', 'ferreira123', '1'),
(5, 'Dominique', '92896501', 'dominique123', '3'),
(6, 'Alex', '92896599', 'alex123', '4');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Índices para tabela `main_aluno`
--
ALTER TABLE `main_aluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_aluno_turma_id_422413c9_fk_main_turma_id` (`turma_id`);

--
-- Índices para tabela `main_aprendizagem`
--
ALTER TABLE `main_aprendizagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_aprendizagem_fiap_id_11fc6c56_fk_main_fiap_id` (`fiap_id`);

--
-- Índices para tabela `main_aproveitamento`
--
ALTER TABLE `main_aproveitamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_aproveitamento_fiap_id_5a748fd2_fk_main_fiap_id` (`fiap_id`),
  ADD KEY `main_aproveitamento_materia_id_2e1497ca_fk_main_materia_id` (`materia_id`);

--
-- Índices para tabela `main_assinatura`
--
ALTER TABLE `main_assinatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_assinatura_fiap_id_5cfde562_fk_main_fiap_id` (`fiap_id`);

--
-- Índices para tabela `main_empresa`
--
ALTER TABLE `main_empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_fiap`
--
ALTER TABLE `main_fiap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_fiap_turma_id_45cd4bf0_fk_main_turma_id` (`turma_id`),
  ADD KEY `main_fiap_usuario_id_a864eca0_fk_main_usuario_id` (`usuario_id`),
  ADD KEY `main_fiap_aluno_id_0814b74d_fk_main_aluno_id` (`aluno_id`),
  ADD KEY `main_fiap_materia_id_b1cd5bd8_fk_main_materia_id` (`materia_id`);

--
-- Índices para tabela `main_formulario`
--
ALTER TABLE `main_formulario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_formulario_aluno_id_97343958_fk_main_aluno_id` (`aluno_id`),
  ADD KEY `main_formulario_importancia_id_03fd59e3_fk_main_importancia_id` (`importancia_id`),
  ADD KEY `main_formulario_pergunta_id_b184123c_fk_main_pergunta_id` (`pergunta_id`),
  ADD KEY `main_formulario_satisfacao_id_ed5856ae_fk_main_satisfacao_id` (`satisfacao_id`);

--
-- Índices para tabela `main_frequencia`
--
ALTER TABLE `main_frequencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_frequencia_fiap_id_0a8e6a32_fk_main_fiap_id` (`fiap_id`);

--
-- Índices para tabela `main_importancia`
--
ALTER TABLE `main_importancia`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_materia`
--
ALTER TABLE `main_materia`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_observacao`
--
ALTER TABLE `main_observacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_observacao_fiap_id_ae6f63f2_fk_main_fiap_id` (`fiap_id`);

--
-- Índices para tabela `main_ocorrencia`
--
ALTER TABLE `main_ocorrencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_ocorrencia_fiap_id_dcedad54_fk_main_fiap_id` (`fiap_id`);

--
-- Índices para tabela `main_pergunta`
--
ALTER TABLE `main_pergunta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_satisfacao`
--
ALTER TABLE `main_satisfacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_turma`
--
ALTER TABLE `main_turma`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_uploadcsv`
--
ALTER TABLE `main_uploadcsv`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `main_usuario`
--
ALTER TABLE `main_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `main_aluno`
--
ALTER TABLE `main_aluno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `main_aprendizagem`
--
ALTER TABLE `main_aprendizagem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_aproveitamento`
--
ALTER TABLE `main_aproveitamento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_assinatura`
--
ALTER TABLE `main_assinatura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_empresa`
--
ALTER TABLE `main_empresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_fiap`
--
ALTER TABLE `main_fiap`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `main_formulario`
--
ALTER TABLE `main_formulario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_frequencia`
--
ALTER TABLE `main_frequencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_importancia`
--
ALTER TABLE `main_importancia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_materia`
--
ALTER TABLE `main_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `main_observacao`
--
ALTER TABLE `main_observacao`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_ocorrencia`
--
ALTER TABLE `main_ocorrencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_pergunta`
--
ALTER TABLE `main_pergunta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_satisfacao`
--
ALTER TABLE `main_satisfacao`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_turma`
--
ALTER TABLE `main_turma`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `main_uploadcsv`
--
ALTER TABLE `main_uploadcsv`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `main_usuario`
--
ALTER TABLE `main_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `main_aluno`
--
ALTER TABLE `main_aluno`
  ADD CONSTRAINT `main_aluno_turma_id_422413c9_fk_main_turma_id` FOREIGN KEY (`turma_id`) REFERENCES `main_turma` (`id`);

--
-- Limitadores para a tabela `main_aprendizagem`
--
ALTER TABLE `main_aprendizagem`
  ADD CONSTRAINT `main_aprendizagem_fiap_id_11fc6c56_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`);

--
-- Limitadores para a tabela `main_aproveitamento`
--
ALTER TABLE `main_aproveitamento`
  ADD CONSTRAINT `main_aproveitamento_fiap_id_5a748fd2_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`),
  ADD CONSTRAINT `main_aproveitamento_materia_id_2e1497ca_fk_main_materia_id` FOREIGN KEY (`materia_id`) REFERENCES `main_materia` (`id`);

--
-- Limitadores para a tabela `main_assinatura`
--
ALTER TABLE `main_assinatura`
  ADD CONSTRAINT `main_assinatura_fiap_id_5cfde562_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`);

--
-- Limitadores para a tabela `main_fiap`
--
ALTER TABLE `main_fiap`
  ADD CONSTRAINT `main_fiap_aluno_id_0814b74d_fk_main_aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `main_aluno` (`id`),
  ADD CONSTRAINT `main_fiap_materia_id_b1cd5bd8_fk_main_materia_id` FOREIGN KEY (`materia_id`) REFERENCES `main_materia` (`id`),
  ADD CONSTRAINT `main_fiap_turma_id_45cd4bf0_fk_main_turma_id` FOREIGN KEY (`turma_id`) REFERENCES `main_turma` (`id`),
  ADD CONSTRAINT `main_fiap_usuario_id_a864eca0_fk_main_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `main_usuario` (`id`);

--
-- Limitadores para a tabela `main_formulario`
--
ALTER TABLE `main_formulario`
  ADD CONSTRAINT `main_formulario_aluno_id_97343958_fk_main_aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `main_aluno` (`id`),
  ADD CONSTRAINT `main_formulario_importancia_id_03fd59e3_fk_main_importancia_id` FOREIGN KEY (`importancia_id`) REFERENCES `main_importancia` (`id`),
  ADD CONSTRAINT `main_formulario_pergunta_id_b184123c_fk_main_pergunta_id` FOREIGN KEY (`pergunta_id`) REFERENCES `main_pergunta` (`id`),
  ADD CONSTRAINT `main_formulario_satisfacao_id_ed5856ae_fk_main_satisfacao_id` FOREIGN KEY (`satisfacao_id`) REFERENCES `main_satisfacao` (`id`);

--
-- Limitadores para a tabela `main_frequencia`
--
ALTER TABLE `main_frequencia`
  ADD CONSTRAINT `main_frequencia_fiap_id_0a8e6a32_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`);

--
-- Limitadores para a tabela `main_observacao`
--
ALTER TABLE `main_observacao`
  ADD CONSTRAINT `main_observacao_fiap_id_ae6f63f2_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`);

--
-- Limitadores para a tabela `main_ocorrencia`
--
ALTER TABLE `main_ocorrencia`
  ADD CONSTRAINT `main_ocorrencia_fiap_id_dcedad54_fk_main_fiap_id` FOREIGN KEY (`fiap_id`) REFERENCES `main_fiap` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
