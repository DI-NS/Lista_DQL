SELECT 
    COUNT(*) AS disciplinas_com_mais_de_80_horas
FROM 
    disciplina
WHERE 
    carga_horaria > 80;
