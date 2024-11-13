SELECT 
    m.status,
    COUNT(*) AS numero_de_alunos
FROM 
    matricula m
GROUP BY 
    m.status
ORDER BY 
    numero_de_alunos DESC;
