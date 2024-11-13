SELECT 
    p.nome
FROM 
    professor p
INNER JOIN 
    turma t ON p.id_professor = t.id_professor
INNER JOIN 
    disciplina d ON t.id_disciplina = d.id_disciplina
WHERE 
    d.carga_horaria > 100
GROUP BY 
    p.nome
HAVING 
    COUNT(d.id_disciplina) > 2;
