-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 08 sep. 2020 à 08:33
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : employe_dept
--

-- --------------------------------------------------------

--
-- Structure de la table dept
--

CREATE TABLE dept (
  DEPTNO int(10) UNSIGNED NOT NULL,
  DNAME varchar(50) NOT NULL,
  LOC varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table emp
--

CREATE TABLE emp (
  EMPNO int(10) UNSIGNED NOT NULL,
  ENAME varchar(50) NOT NULL,
  JOB varchar(50) NOT NULL,
  MGR int(10) UNSIGNED DEFAULT NULL,
  HIREDATE date NOT NULL,
  SAL decimal(8,2) NOT NULL,
  COMM int(11) DEFAULT NULL,
  DEPTNO int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table dept
--
ALTER TABLE dept
  ADD PRIMARY KEY (DEPTNO);

--
-- Index pour la table emp
--
ALTER TABLE emp
  ADD PRIMARY KEY (EMPNO),
  ADD KEY FK_departement (DEPTNO),
  ADD KEY FK_manager (MGR);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table emp
--
ALTER TABLE emp
  ADD CONSTRAINT FK_departement FOREIGN KEY (DEPTNO) REFERENCES dept (DEPTNO),
  ADD CONSTRAINT FK_manager FOREIGN KEY (MGR) REFERENCES emp (EMPNO);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
