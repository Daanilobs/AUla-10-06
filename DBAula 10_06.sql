create database Faculdade;
use Faculdade;
create table tbInstrutores(id int(10) primary key auto_increment not null, nome varchar(50), email varchar(50), valor_hora int(10), certificados varchar(255));
create table tbCursos(id int(10) primary key auto_increment not null, nome varchar(50), requisito varchar(255), carga_horaria smallint(5), preco double);
create table tbAlunos(id int(11) primary key auto_increment not null, cpf char(11), nome varchar(50), email varchar(50), fone char(14), data_nascimento date);
create table tbTurmas(id int(10) primary key auto_increment not null, data_inicio date, data_final date, carga_horaria smallint(5));
alter table tbTurmas add column instrutores_id int(11);
alter table tbTurmas add column cursos_id int(10);
alter table tbTurmas add constraint fkturmas_FKIndex1 foreign key (instrutores_id) references tbInstrutores (id);
create table tbMatriculas(id int(10) primary key auto_increment not null, turmas_id int(10), alunos_id int(11), data_matricula date);
alter table tbTurmas add constraint fkturmas_FKIndex2 foreign key (cursos_id) references tbCursos (id);
alter table tbMatriculas add constraint fkmatriculas_FKIndex1 foreign key (alunos_id) references tbAlunos (id);
alter table tbMatriculas add constraint fkmatriculas_FKIndex3 foreign key (turmas_id) references tbTurmas (id);
insert into tbInstrutores (nome,email,valor_hora,certificados) values("Guilherme", "guilherme_it@gmail.com", 2, "ITIL");
insert into tbInstrutores (nome,email,valor_hora,certificados) values("Allan", "Allan_it@gmail.com", 3, "ITIL");
insert into tbInstrutores (nome,email,valor_hora,certificados) values("Roger", "roger_it@gmail.com", 4, "COBIT");
insert into tbInstrutores (nome,email,valor_hora,certificados) values("Felipe", "felipe_it@gmail.com", 5, "SCRUM");
insert into tbAlunos (cpf,nome,email,fone,data_nascimento) values(4127553847, "Robertinho Silva", "robertinho_10@gmail.com", 44556633, 28/12/90);
insert into tbAlunos (cpf,nome,email,fone,data_nascimento) values(4127553858, "Silva Amaral", "silva_sil90@gmail.com", 44558855, 25/02/93);
insert into tbAlunos (cpf,nome,email,fone,data_nascimento) values(4127553368, "Carlos Eduardo", "carlinhos_joga10@gmail.com", 44553265, 01/10/90);
insert into tbAlunos (cpf,nome,email,fone,data_nascimento) values(4127553847, "Rafael Cabral", "rafasilvaj@gmail.com", 44553566, 02/11/91);
insert into tbTurmas (instrutores_id,cursos_id,data_inicio,data_final,carga_horaria) values(3,1,10/01/2010,10/12/2010,40);
insert into tbTurmas (instrutores_id,cursos_id,data_inicio,data_final,carga_horaria) values(1,3,10/01/2010, 10/12/2010, 50);
insert into tbMatriculas (turmas_id, alunos_id,data_matricula) values(3,3, 10/01/2019);
insert into tbMatriculas (turmas_id, alunos_id,data_matricula) values(2,2, 11/01/2019);
insert into tbCursos (nome,requisito,carga_horaria,preco) values("Sistemas de Informação","Ensino Fundamental", 20, 3000);
insert into tbCursos (nome,requisito,carga_horaria,preco) values("Portugues","Ensino Fundamental", 10, 2000);


delimiter $$
create procedure selecionar_curso (in nome varchar(50));
begin
select * from tbCursos where nome = nome;
end $$
delimiter;

call selecionar_curso("História");



delimiter $$
create procedure selecionar_aluno_especifico (in nome varchar(255));
begin
select * from tbalunos where nome = nome;
end $$
delimiter;

call selecionar_aluno_especifico("Carlos Eduardo");



delimiter $$
create procedure inserir_instrutor (in nome varchar(50), email varchar(50), valor_hora int(10), certificados varchar(255));
begin
insert into tbInstrutores(nome, email, valor_hora, certificados) Values (nome, email, valor_hora, certificados);
end $$
delimiter;

call inserir_instrutor("Alfredo Jovem", "alfredinho_zica@gmail.com", 6, "Meninagem");



delimiter $$
create procedure inserir_matricula (in turmas_id int(10), alunos_id int(11), data_matricula date);
begin
insert into tbMatricula(turmas_id, alunos_id,data_matricula) Values (turmas_id, alunos_id,data_matricula);
end $$
delimiter;

call inserir_matricula(4,4,12/01/2019);



delimiter $$
create procedure inserir_turma (in data_inicio date, data_final date, carga_horaria smallint(5));
begin
insert into tbTurmas(instrutores_id,cursos_id,data_inicio,data_final,carga_horaria) Values (instrutores_id,cursos_id,data_inicio,data_final,carga_horaria);
end $$
delimiter;

call inserir_turma(2,4,11/01/2010, 10/12/2010, 60);



