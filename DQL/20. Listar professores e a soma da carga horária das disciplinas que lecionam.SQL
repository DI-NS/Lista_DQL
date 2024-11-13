SELECT 
    p.nome,
    SUM(d.carga_horaria) AS soma_carga_horaria
FROM 
    professor p
INNER JOIN 
    turma t ON p.id_professor = t.id_professor
INNER JOIN 
    disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY 
    p.nome
ORDER BY 
    soma_carga_horaria DESC;
