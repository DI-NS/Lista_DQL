# Exercícios Práticos de DQL

Este arquivo contém comandos SQL organizados para resolver uma série de exercícios relacionados às tabelas `aluno`, `professor`, `disciplina`, `curso`, `matricula` e `turma`.

---

### 1. Listar alunos ordenados por nome e data de nascimento
| **Questão** | Listar todos os alunos, ordenando-os por nome em ordem alfabética e, em caso de nomes iguais, pela data de nascimento (do mais velho para o mais novo). |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT nome, data_nascimento ```  |
|             | ```FROM aluno ``` |
|             | ```ORDER BY nome ASC, data_nascimento ASC; ``` |

---

### 2. Listar professores e suas especialidades em ordem decrescente
| **Questão** | Listar o nome dos professores e suas especialidades, ordenando-os em ordem alfabética inversa (decrescente). |
|-------------|----------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT nome, especialidade ``` |
|             | ```FROM professor ``` |
|             | ```ORDER BY nome DESC; ``` |

---

### 3. Listar disciplinas ordenadas por carga horária
| **Questão** | Listar todas as disciplinas do banco de dados, ordenando-as pela carga horária em ordem decrescente. |
|-------------|-----------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT nome, carga_horaria ``` |
|             | ```FROM disciplina ``` |
|             | ```ORDER BY carga_horaria DESC; ``` |

---

### 4. Contar o número de alunos em cada status de matrícula
| **Questão** | Exibir o status da matrícula (Ativo, Concluído, Trancado) e o número de alunos em cada status. |
|-------------|-------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT status, COUNT(*) AS numero_de_alunos ``` |
|             | ```FROM matricula ``` |
|             | ```GROUP BY status; ``` |

---

### 5. Listar cursos com a soma total da carga horária de suas disciplinas
| **Questão** | Listar o nome dos cursos e a soma da carga horária total de suas disciplinas. |
|-------------|------------------------------------------------------------------------------|
| **Comando** | ```SELECT c.nome AS nome_curso, SUM(d.carga_horaria) AS carga_horaria_total ``` |
|             | ```FROM curso c ``` |
|             | ```INNER JOIN disciplina d ON c.id_curso = d.id_curso ``` |
|             | ```GROUP BY c.nome; ``` |

---

### 6. Contar quantos professores estão lecionando mais de 3 turmas
| **Questão** | Listar os nomes dos professores que estão lecionando mais de 3 turmas. |
|-------------|------------------------------------------------------------------------|
| **Comando** | ```SELECT p.nome ``` |
|             | ```FROM professor p ``` |
|             | ```INNER JOIN turma t ON p.id_professor = t.id_professor ``` |
|             | ```GROUP BY p.nome ``` |
|             | ```HAVING COUNT(t.id_turma) > 3; ``` |

---

### 7. Listar os alunos matriculados em mais de uma disciplina
| **Questão** | Listar os nomes dos alunos que estão matriculados em mais de uma disciplina, ordenados pelo número de disciplinas. |
|-------------|-------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT a.nome, COUNT(m.id_disciplina) AS numero_de_disciplinas ``` |
|             | ```FROM aluno a ``` |
|             | ```INNER JOIN matricula m ON a.id_aluno = m.id_aluno ``` |
|             | ```GROUP BY a.nome ``` |
|             | ```HAVING COUNT(m.id_disciplina) > 1 ``` |
|             | ```ORDER BY numero_de_disciplinas DESC; ``` |

---

### 8. Listar cursos com mais de 2000 horas de carga horária
| **Questão** | Listar os cursos cuja soma da carga horária total de suas disciplinas seja maior que 2000 horas. |
|-------------|---------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT c.nome ``` |
|             | ```FROM curso c ``` |
|             | ```INNER JOIN disciplina d ON c.id_curso = d.id_curso ``` |
|             | ```GROUP BY c.nome ``` |
|             | ```HAVING SUM(d.carga_horaria) > 2000; ``` |

---

### 9. Contar o número total de turmas e listar por professor
| **Questão** | Listar o nome dos professores e o número total de turmas que cada professor leciona, ordenando pelos professores com mais turmas. |
|-------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT p.nome, COUNT(t.id_turma) AS total_turmas ``` |
|             | ```FROM professor p ``` |
|             | ```INNER JOIN turma t ON p.id_professor = t.id_professor ``` |
|             | ```GROUP BY p.nome ``` |
|             | ```ORDER BY total_turmas DESC; ``` |

---

### 10. Listar disciplinas e a média da carga horária por curso
| **Questão** | Listar o nome dos cursos e a média da carga horária de suas disciplinas. |
|-------------|---------------------------------------------------------------------------|
| **Comando** | ```SELECT c.nome AS nome_curso, AVG(d.carga_horaria) AS media_carga_horaria ``` |
|             | ```FROM curso c ``` |
|             | ```INNER JOIN disciplina d ON c.id_curso = d.id_curso ``` |
|             | ```GROUP BY c.nome; ``` |

---

### 11. Exibir os alunos e seus respectivos status de matrícula, ordenados pelo status e pela data de matrícula
| **Questão** | Listar todos os alunos com seus status de matrícula, ordenando primeiro pelo status (Ativo, Concluído, Trancado) e depois pela data de matrícula em ordem decrescente. |
|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT a.nome, m.status, m.data_matricula ``` |
|             | ```FROM aluno a ``` |
|             | ```INNER JOIN matricula m ON a.id_aluno = m.id_aluno ``` |
|             | ```ORDER BY m.status, m.data_matricula DESC; ``` |

---

### 12. Exibir a idade dos alunos ordenados da maior para a menor idade
| **Questão** | Calcular a idade dos alunos com base na data de nascimento e exibi-los em ordem decrescente de idade (do mais velho para o mais novo). |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT nome, FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade ``` |
|             | ```FROM aluno ``` |
|             | ```ORDER BY idade DESC; ``` |

---

### 13. Exibir as disciplinas e o número de alunos matriculados em cada uma
| **Questão** | Exibir o nome das disciplinas e o número de alunos matriculados em cada uma, ordenando pelas disciplinas com mais alunos. |
|-------------|-------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT d.nome, COUNT(m.id_aluno) AS numero_de_alunos ``` |
|             | ```FROM disciplina d ``` |
|             | ```INNER JOIN matricula m ON d.id_disciplina = m.id_disciplina ``` |
|             | ```GROUP BY d.nome ``` |
|             | ```ORDER BY numero_de_alunos DESC; ``` |

---

### 14. Listar as turmas com o nome dos professores e disciplinas, ordenadas por horário
| **Questão** | Listar o nome dos professores, o nome das disciplinas que eles lecionam e os horários das turmas, ordenando pelos horários. |
|-------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT p.nome AS nome_professor, d.nome AS nome_disciplina, t.horario ``` |
|             | ```FROM turma t ``` |
|             | ```INNER JOIN professor p ON t.id_professor = p.id_professor ``` |
|             | ```INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina ``` |
|             | ```ORDER BY t.horario; ``` |

---

### 15. Contar quantas disciplinas têm carga horária superior a 80 horas
| **Questão** | Exibir quantas disciplinas têm uma carga horária maior que 80 horas. |
|-------------|---------------------------------------------------------------------|
| **Comando** | ```SELECT COUNT(*) AS disciplinas_com_mais_de_80_horas ``` |
|             | ```FROM disciplina ``` |
|             | ```WHERE carga_horaria > 80; ``` |

---

### 16. Listar os cursos e a quantidade de disciplinas que cada curso possui
| **Questão** | Listar o nome dos cursos e a quantidade de disciplinas associadas a cada um. |
|-------------|------------------------------------------------------------------------------|
| **Comando** | ```SELECT c.nome AS nome_curso, COUNT(d.id_disciplina) AS quantidade_disciplinas ``` |
|             | ```FROM curso c ``` |
|             | ```INNER JOIN disciplina d ON c.id_curso = d.id_curso ``` |
|             | ```GROUP BY c.nome; ``` |

---

### 17. Exibir os professores que têm mais de 2 disciplinas com carga horária superior a 100 horas
| **Questão** | Listar os professores que lecionam mais de 2 disciplinas cuja carga horária seja superior a 100 horas. |
|-------------|--------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT p.nome ``` |
|             | ```FROM professor p ``` |
|             | ```INNER JOIN turma t ON p.id_professor = t.id_professor ``` |
|             | ```INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina ``` |
|             | ```WHERE d.carga_horaria > 100 ``` |
|             | ```GROUP BY p.nome ``` |
|             | ```HAVING COUNT(d.id_disciplina) > 2; ``` |

---

### 18. Listar disciplinas que tenham pelo menos 5 alunos matriculados
| **Questão** | Listar o nome das disciplinas que têm pelo menos 5 alunos matriculados. |
|-------------|-----------------------------------------------------------------------|
| **Comando** | ```SELECT d.nome ``` |
|             | ```FROM disciplina d ``` |
|             | ```INNER JOIN matricula m ON d.id_disciplina = m.id_disciplina ``` |
|             | ```GROUP BY d.nome ``` |
|             | ```HAVING COUNT(m.id_aluno) >= 5; ``` |

---

### 19. Exibir o número de alunos por status, ordenando pelos status com mais alunos
| **Questão** | Exibir o número de alunos em cada status de matrícula (Ativo, Concluído, Trancado), ordenando pelos status com mais alunos. |
|-------------|--------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT m.status, COUNT(*) AS numero_de_alunos ``` |
|             | ```FROM matricula m ``` |
|             | ```GROUP BY m.status ``` |
|             | ```ORDER BY numero_de_alunos DESC; ``` |

---

### 20. Listar professores e a soma da carga horária das disciplinas que lecionam
| **Questão** | Listar o nome dos professores e a soma da carga horária total das disciplinas que eles lecionam, ordenando pelos professores que lecionam disciplinas com mais horas. |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Comando** | ```SELECT p.nome, SUM(d.carga_horaria) AS soma_carga_horaria ``` |
|             | ```FROM professor p ``` |
|             | ```INNER JOIN turma t ON p.id_professor = t.id_professor ``` |
|             | ```INNER JOIN disciplina d ON t.id_disciplina = d.id_disciplina ``` |
|             | ```GROUP BY p.nome ``` |
|             | ```ORDER BY soma_carga_horaria DESC; ``` |

---