CREATE DATABASE  IF NOT EXISTS `barbershop`;
USE `barbershop`;

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `IdUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomeUsuario` varchar(50) NOT NULL,
  `SenhaUsuario` varchar(100) NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO `usuario` VALUES (17,'ADMIN','$2a$10$NfsbmMqgvI.V8MqIsgbMJudz9KrDRjQfKo78PveD0mo1Tqn099e7i');

DROP TABLE IF EXISTS `servico`;

CREATE TABLE `servico` (
  `IdServico` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdServico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `servico` VALUES (1,'Corte Americano',25.00),(2,'Barba',10.00);

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `IdCliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(60) NOT NULL,
  `Endereco` varchar(60) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Cep` char(8) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Ativo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `cliente` VALUES (12,'Pedro Enrico Tomás Monteiro','Rua José Carlos Machado','Jardim Residencial Villa Amato','18087682','1526949415','15998854740',_binary ''),(13,'Luciana Jennifer da Cruz','Rua Martinho Lutero','Jardim Aurélio Bernardi','76907446',NULL,'69995910668',_binary '');

DROP TABLE IF EXISTS `agendamento`;

CREATE TABLE `agendamento` (
  `IdAgendamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdCliente` int(10) unsigned NOT NULL,
  `DataAgendamento` datetime NOT NULL,
  PRIMARY KEY (`IdAgendamento`),
  KEY `fk_agendamento_cliente_idx` (`IdCliente`),
  CONSTRAINT `fk_agendamento_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `servicoagendamento`;

CREATE TABLE `servicoagendamento` (
  `IdServicoAgendamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAgendamento` int(10) unsigned NOT NULL,
  `IdServico` int(10) unsigned NOT NULL,
  `Qtde` int(10) unsigned NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Observacao` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`IdServicoAgendamento`),
  KEY `fk_servicoagendamento_servico_idx` (`IdServico`),
  KEY `fk_servidoagendamento_agendamento_idx` (`IdAgendamento`),
  CONSTRAINT `fk_servicoagendamento_servico` FOREIGN KEY (`IdServico`) REFERENCES `servico` (`IdServico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servidoagendamento_agendamento` FOREIGN KEY (`IdAgendamento`) REFERENCES `agendamento` (`IdAgendamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;