SELECT 
    a.nome,
    m.status,
    m.data_matricula
FROM 
    aluno a
INNER JOIN 
    matricula m ON a.id_aluno = m.id_aluno
ORDER BY 
    m.status, 
    m.data_matricula DESC;
