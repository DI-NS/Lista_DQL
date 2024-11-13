SELECT 
    nome,
    FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade
FROM 
    aluno
ORDER BY 
    idade DESC;
