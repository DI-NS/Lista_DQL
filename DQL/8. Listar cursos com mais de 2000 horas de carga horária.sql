SELECT 
    c.nome
FROM 
    curso c
INNER JOIN 
    disciplina d ON c.id_curso = d.id_curso
GROUP BY 
    c.nome
HAVING 
    SUM(d.carga_horaria) > 2000;
