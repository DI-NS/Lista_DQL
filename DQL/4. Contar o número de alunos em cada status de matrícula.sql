SELECT 
    status,
    COUNT(*) AS numero_de_alunos
FROM 
    matricula
GROUP BY 
    status;
