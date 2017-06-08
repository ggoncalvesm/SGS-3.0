-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Jun-2017 às 23:47
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgs2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliador`
--

CREATE TABLE `avaliador` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `id_fase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `avaliador`
--

INSERT INTO `avaliador` (`id`, `nome`, `email`, `senha`, `id_fase`) VALUES
(1, 'Lavínia', 'lv@email.com', '123', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `curso` varchar(45) NOT NULL,
  `ano_entrada` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`matricula`, `nome`, `email`, `senha`, `curso`, `ano_entrada`) VALUES
(123, '12312', 'askdljask', 'asdkjasl', 'Engenharia de Software', 123.1),
(563718, 'Lavinia', 'laviniamatosof@hotmail.com', '123', 'Engenharia de Software', 2015.1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `concurso`
--

CREATE TABLE `concurso` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `id_edital` int(11) NOT NULL,
  `preRequisitos` varchar(500) NOT NULL,
  `maisInformacoes` varchar(500) NOT NULL,
  `isDivulgado` tinyint(1) NOT NULL,
  `id_gerente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `concurso`
--

INSERT INTO `concurso` (`id`, `titulo`, `descricao`, `id_edital`, `preRequisitos`, `maisInformacoes`, `isDivulgado`, `id_gerente`) VALUES
(1, 'Bolsa de Iniciação à Docência - 2017.1', 'O Diretor do Campus da UFC em Russas no uso de suas atribuições legais e estatutárias, em consonância com a Resolução N° 08/CEPE, de 26 de abril de 2013, torna público o processo de seleção de monitores de iniciação à docência-PID, seguindo as orientações estabelecidas neste Edital e no Edital n° 35/2016 da Pró-Reitoria de Graduação - PROGRAD.', 1, 'O aluno já deve ter feito a disciplina\r\nO aluno deverá possuir o IRA acima de 7,000\r\nO aluno não pode possuir outra bolsa\r\nO aluno não pode ter reprovado alguma cadeira\r\n', 'ATENÇÃO: Só é permitida a inscrição em apenas um projeto, segundo o edital\r\n', 1, 1),
(2, 'asldkhasdlk', 'lksdhflsdfkhsld', 0, 'sdfsdfsdf', 'sdfsdfsdff', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `arquivo` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentosrequisitados`
--

CREATE TABLE `documentosrequisitados` (
  `id_fase` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `documentosrequisitados`
--

INSERT INTO `documentosrequisitados` (`id_fase`, `descricao`) VALUES
(1, 'Histórico Acadêmico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fase`
--

CREATE TABLE `fase` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  `criterioDeSelecao` varchar(45) NOT NULL,
  `id_concurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fase`
--

INSERT INTO `fase` (`id`, `titulo`, `descricao`, `dataInicio`, `dataTermino`, `criterioDeSelecao`, `id_concurso`) VALUES
(1, 'Fase 1: Inscrição', 'Os interessados deverão preencher o formulário online de inscrição disponibilizado no site de seleções do campus, onde deverão se cadastrar e enviar também o histórico escolar atualizado emitido pelo SIGAA. \r\n', '1969-12-31', '1969-12-31', ' ', 1),
(3, 'Fase 2: Resultado', 'Resultado', '2017-05-27', '2017-07-28', 'Automatico', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente`
--

CREATE TABLE `gerente` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `gerente`
--

INSERT INTO `gerente` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Alex', 'alex', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `id` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `id_resultado` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `participante`
--

INSERT INTO `participante` (`id`, `id_candidato`, `id_resultado`, `id_fase`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resultado`
--

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `nota` float NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `id_participante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `resultado`
--

INSERT INTO `resultado` (`id`, `nota`, `motivo`, `id_participante`) VALUES
(1, 9.8, 'Gostei de vc', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `selecao`
--

CREATE TABLE `selecao` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `responsavel` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `vagasRemuneradas` int(11) NOT NULL,
  `vagasVoluntarias` int(11) NOT NULL,
  `id_concurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `selecao`
--

INSERT INTO `selecao` (`id`, `titulo`, `descricao`, `responsavel`, `area`, `vagasRemuneradas`, `vagasVoluntarias`, `id_concurso`) VALUES
(1, 'Programação Orientada a Objetos', 'Computação', 'Marcos Vinicius', 'Computação', 1, 2, 1),
(5, 'Interação Humano-Computador', 'Marília', '', 'Computação', 1, 1, 1),
(6, 'Projeto e Análise de Algoritmos', 'Eurinardo', '', 'Computação', 1, 0, 1),
(7, 'Fundamentos de Programação', 'Pablo', '', 'Computação', 2, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaliador`
--
ALTER TABLE `avaliador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `concurso`
--
ALTER TABLE `concurso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selecao`
--
ALTER TABLE `selecao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliador`
--
ALTER TABLE `avaliador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `concurso`
--
ALTER TABLE `concurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fase`
--
ALTER TABLE `fase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gerente`
--
ALTER TABLE `gerente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `participante`
--
ALTER TABLE `participante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `selecao`
--
ALTER TABLE `selecao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
