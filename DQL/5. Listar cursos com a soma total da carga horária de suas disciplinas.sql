SELECT 
    c.nome AS nome_curso,
    SUM(d.carga_horaria) AS carga_horaria_total
FROM 
    curso c
INNER JOIN 
    disciplina d ON c.id_curso = d.id_curso
GROUP BY 
    c.nome;
