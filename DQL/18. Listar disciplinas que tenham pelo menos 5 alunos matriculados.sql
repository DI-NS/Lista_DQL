SELECT 
    d.nome
FROM 
    disciplina d
INNER JOIN 
    matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY 
    d.nome
HAVING 
    COUNT(m.id_aluno) >= 5;
