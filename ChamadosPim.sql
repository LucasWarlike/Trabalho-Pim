-- Criação do banco de dados
CREATE DATABASE bd_chamados;
USE bd_chamados;

/* A TABELA USUARIO É A TABELA PRINCIPAL ONDE SÃO REGISTRADOS OS DADOS DO FUNCIONÁRIO, ELA 
SE COMUNICARÁ COM PRATICAMENTE TODDAS AS OUTRAS TABELAS*/

CREATE TABLE Usuarios (
  Id_Usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Cpf INT(20) NOT NULL UNIQUE,
  Setor VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* A TABELA CHAMADOS É ONDE O FUNCIOÁRIO IRÁ PREENCHER OS DADOS NECESSÁRIOS PARA QUE O 
TI TENHA ACESSO A SUA SOLICITAÇÃO E OS DADOS NECESSÁRIOS*/

CREATE TABLE Chamados (
  Id_Chamado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  fk_Id_Usuario INT UNSIGNED,
  Nome VARCHAR(50) UNIQUE,
  Email VARCHAR(80) UNIQUE,
  Descricao VARCHAR(200) NOT NULL UNIQUE,
  dataChamado DATE NOT NULL UNIQUE,
  Setor VARCHAR(80) UNIQUE,
  FOREIGN KEY (fk_Id_Usuario) REFERENCES Usuarios(Id_Usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* A TABELA DE CREDENCIAIS É A TABELA QUE REFERENCIA O LOGIN PARA ACESSAR A PARTE INICIAL
DA PLATAFORMA E COM BASE NISSO PUXAREMOS OS DADOS NECESSÁRIOS E DE SETOR DO FUNCIONÁRIO.*/

CREATE TABLE Credenciais (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Id_Usuario INT UNSIGNED NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  salt VARCHAR(255) NOT NULL,
  token_recuperacao VARCHAR(255),
  data_expericao_token TIMESTAMP,
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE Credenciais ADD COLUMN Email VARCHAR (100) NOT NULL;

/* TABELA CRIADA PARA REGISTRO DOS HISTÓRICOS DO USUÁRIO*/

CREATE TABLE Usuarios_Historico (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT UNSIGNED NOT NULL,
  nome VARCHAR(50),
  email VARCHAR(100),
  cpf VARCHAR(20),
  setor VARCHAR(50),
  data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  usuario_responsavel VARCHAR(50),
  tipo_alteracao ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Usuarios (Nome, Email, Cpf, Setor) VALUES
('Ana Souza', 'ana.souza@techcorp.com', '12345678901', 'Desenvolvimento'),
('Carlos Silva', 'carlos.silva@techcorp.com', '23456789012', 'Suporte'),
('Fernanda Oliveira', 'fernanda.oliveira@techcorp.com', '34567890123', 'RH'),
('Gustavo Pereira', 'gustavo.pereira@techcorp.com', '45678901234', 'Financeiro'),
('Juliana Costa', 'juliana.costa@techcorp.com', '56789012345', 'Marketing'),
('Lucas Almeida', 'lucas.almeida@techcorp.com', '67890123456', 'Desenvolvimento'),
('Mariana Santos', 'mariana.santos@techcorp.com', '78901234567', 'Suporte'),
('Ricardo Lima', 'ricardo.lima@techcorp.com', '89012345678', 'RH'),
('Tatiane Rocha', 'tatiane.rocha@techcorp.com', '90123456789', 'Financeiro'),
('Vinícius Martins', 'vinicius.martins@techcorp.com', '01234567890', 'Marketing'),
('Amanda Ferreira', 'amanda.ferreira@techcorp.com', '12345678901', 'Desenvolvimento'),
('Bruno Costa', 'bruno.costa@techcorp.com', '23456789012', 'Suporte'),
('Camila Oliveira', 'camila.oliveira@techcorp.com', '34567890123', 'RH'),
('Diego Pereira', 'diego.pereira@techcorp.com', '45678901234', 'Financeiro'),
('Eliane Almeida', 'eliane.almeida@techcorp.com', '56789012345', 'Marketing'),
('Felipe Santos', 'felipe.santos@techcorp.com', '67890123456', 'Desenvolvimento'),
('Gabriela Lima', 'gabriela.lima@techcorp.com', '78901234567', 'Suporte'),
('Henrique Rocha', 'henrique.rocha@techcorp.com', '89012345678', 'RH'),
('Isabela Martins', 'isabela.martins@techcorp.com', '90123456789', 'Financeiro'),
('João Ferreira', 'joao.ferreira@techcorp.com', '01234567890', 'Marketing'),
('Karla Costa', 'karla.costa@techcorp.com', '12345678901', 'Desenvolvimento'),
('Leonardo Oliveira', 'leonardo.oliveira@techcorp.com', '23456789012', 'Suporte'),
('Monique Pereira', 'monique.pereira@techcorp.com', '34567890123', 'RH'),
('Natália Almeida', 'natalia.almeida@techcorp.com', '45678901234', 'Financeiro'),
('Otávio Santos', 'otavio.santos@techcorp.com', '56789012345', 'Marketing'),
('Patrícia Lima', 'patricia.lima@techcorp.com', '67890123456', 'Desenvolvimento'),
('Quésia Rocha', 'quesia.rocha@techcorp.com', '78901234567', 'Suporte'),
('Rafael Martins', 'rafael.martins@techcorp.com', '89012345678', 'RH'),
('Simone Ferreira', 'simone.ferreira@techcorp.com', '90123456789', 'Financeiro'),
('Tatiane Costa', 'tatiane.costa@techcorp.com', '01234567890', 'Marketing'),
('Ubirajara Oliveira', 'ubirajara.oliveira@techcorp.com', '12345678901', 'Desenvolvimento'),
('Vera Pereira', 'vera.pereira@techcorp.com', '23456789012', 'Suporte'),
('Wagner Almeida', 'wagner.almeida@techcorp.com', '34567890123', 'RH'),
('Ximena Santos', 'ximena.santos@techcorp.com', '45678901234', 'Financeiro'),
('Yasmin Lima', 'yasmin.lima@techcorp.com', '56789012345', 'Marketing'),
('Zé Rocha', 'ze.rocha@techcorp.com', '67890123456', 'Desenvolvimento'),
('Aline Martins', 'aline.martins@techcorp.com', '78901234567', 'Suporte'),
('Bruna Ferreira', 'bruna.ferreira@techcorp.com', '89012345678', 'RH'),
('Carlos Costa', 'carlos.costa@techcorp.com', '90123456789', 'Financeiro'),
('Daniela Oliveira', 'daniela.oliveira@techcorp.com', '01234567890', 'Marketing'),
('Eduardo Pereira', 'eduardo.pereira@techcorp.com', '12345678901', 'Desenvolvimento'),
('Fabiana Almeida', 'fabiana.almeida@techcorp.com', '23456789012', 'Suporte'),
('Gustavo Santos', 'gustavo.santos@techcorp.com', '34567890123', 'RH'),
('Heloísa Lima', 'heloisa.lima@techcorp.com', '45678901234', 'Financeiro'),
('Igor Rocha', 'igor.rocha@techcorp.com', '56789012345', 'Marketing'),
('Juliana Martins', 'juliana.martins@techcorp.com', '67890123456', 'Desenvolvimento'),
('Kleber Ferreira', 'kleber.ferreira@techcorp.com', '78901234567', 'Suporte'),
('Luana Costa', 'luana.costa@techcorp.com', '89012345678', 'RH'),
('Mário Oliveira', 'mario.oliveira@techcorp.com', '90123456789', 'Financeiro'),
('Nathalia Pereira', 'nathalia.pereira@techcorp.com', '01234567890', 'Marketing'),
('Olga Almeida', 'olga.almeida@techcorp.com', '12345678901', 'Desenvolvimento'),
('Paula Santos', 'paula.santos@techcorp.com', '23456789012', 'Suporte');

SELECT * FROM Usuarios;

