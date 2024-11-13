SELECT 
    p.nome,
    COUNT(t.id_turma) AS total_turmas
FROM 
    professor p
INNER JOIN 
    turma t ON p.id_professor = t.id_professor
GROUP BY 
    p.nome
ORDER BY 
    total_turmas DESC;
