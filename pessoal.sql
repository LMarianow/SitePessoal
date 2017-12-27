-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 27/12/2017 às 08:56
-- Versão do servidor: 5.6.38
-- Versão do PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mariano_pessoal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `builds`
--

CREATE TABLE `builds` (
  `build` int(11) NOT NULL,
  `date` text NOT NULL,
  `proc` text NOT NULL,
  `cool` text,
  `mobo` text NOT NULL,
  `ram` text NOT NULL,
  `hdd` text NOT NULL,
  `ssd` text,
  `vid` text NOT NULL,
  `abbrev` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `builds`
--

INSERT INTO `builds` (`build`, `date`, `proc`, `cool`, `mobo`, `ram`, `hdd`, `ssd`, `vid`, `abbrev`) VALUES
(5, 'Meu setup atualizado', 'Intel Core i7-3770K @ 3.90GHz', 'Corsair H100i v2', 'ASUS Republic of Gamers STRIX Z270E', '16GB HyperX Fury 2666MHz', 'Western Digital Blue 1TB @ 7200rpm', 'SanDisk 240GB', 'EVGA GeForce GTX 960 Ti 4GB', 'jk2017');

-- --------------------------------------------------------

--
-- Estrutura para tabela `builds_images`
--

CREATE TABLE `builds_images` (
  `id` int(11) NOT NULL,
  `abbrev` text NOT NULL,
  `url` text NOT NULL,
  `title` text NOT NULL,
  `orient` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `builds_images`
--

INSERT INTO `builds_images` (`id`, `abbrev`, `url`, `title`, `orient`) VALUES
(5, 'jk2017', 'images/v6/builds/jamesBuild.jpg', 'James&lsquo;s computer', 'port');

-- --------------------------------------------------------

--
-- Estrutura para tabela `download_manager`
--

CREATE TABLE `download_manager` (
  `id` int(6) UNSIGNED NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `forget_password`
--

CREATE TABLE `forget_password` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `temp_key` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projects`
--

CREATE TABLE `projects` (
  `proj` int(11) NOT NULL,
  `title` text NOT NULL,
  `web_url` text,
  `code_url` text NOT NULL,
  `date` text NOT NULL,
  `lang` text NOT NULL,
  `info` text NOT NULL,
  `role` text NOT NULL,
  `stat` text NOT NULL,
  `abbrev` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `projects`
--

INSERT INTO `projects` (`proj`, `title`, `web_url`, `code_url`, `date`, `lang`, `info`, `role`, `stat`, `abbrev`) VALUES
(1, 'lmariano.me, Meu site pessoal', 'https://lmariano.me/', 'https://github.com/LMarianoW/', 'Projeto Pessoal, Outubro 2017', 'PHP, MySQL,  Javascript, HTML5, CSS5', 'Meu segundo projeto web. Um site pessoal para apresentar minha pessoa.', 'Feito sozinho', 'Ainda em aprimoramento.', 'Pessoal'),
(2, 'Sistema de cadastro.', 'https://lmariano.me/cms/', 'https://github.com/LMarianow/', 'Setembro 2017', 'PHP, MySQL,  Javascript, HTML5, CSS5', 'Meu primeiro projeto web. Um sistema de cadastro com verificacao de email.', 'Feito sozinho', 'Ainda em aprimoramento.', 'Login'),
(3, 'Sistema de blog.', 'https://blog.lmariano.me/', 'https://github.com/LMarianow/', 'Outubro 2017', 'PHP, MySQL,  Javascript, HTML5, CSS5', 'Um simples sistema de blog com painel de admin para as postagens.', 'Feito sozinho', 'Ainda em aprimoramento.', 'Blog');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projects_images`
--

CREATE TABLE `projects_images` (
  `id` int(11) NOT NULL,
  `abbrev` varchar(10) NOT NULL,
  `url` text NOT NULL,
  `title` text NOT NULL,
  `orient` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `hash`, `active`) VALUES
(1, 'LMariano', 'e5f2c26160648958dec4241823566837', 'lmarianocarvalho@hotmail.com', '65ded5353c5ee48d0b7d48c591b8f430', 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`build`);

--
-- Índices de tabela `builds_images`
--
ALTER TABLE `builds_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `download_manager`
--
ALTER TABLE `download_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Índices de tabela `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`proj`);

--
-- Índices de tabela `projects_images`
--
ALTER TABLE `projects_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `builds`
--
ALTER TABLE `builds`
  MODIFY `build` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `builds_images`
--
ALTER TABLE `builds_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `download_manager`
--
ALTER TABLE `download_manager`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `projects`
--
ALTER TABLE `projects`
  MODIFY `proj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `projects_images`
--
ALTER TABLE `projects_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
