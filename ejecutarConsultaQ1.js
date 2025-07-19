import pool from './db.js';

export default async function ejecutarConsultaQ1() {
  console.clear();
  console.log('Consulta Q1 – Alumnos con profesor jefe y apoderado vigente en 2025\n');

  try {
    const query = `
      SELECT 
        a.nombres AS nombre_alumno,
        a.codigo_curso,
        p.nombres AS nombre_profesor_jefe,
        p.apellido_paterno,
        ap.nombres AS nombre_apoderado
      FROM alumno a
      JOIN curso c ON a.codigo_curso = c.codigo
      JOIN es_jefe ej ON ej.codigo_curso = c.codigo
      JOIN profesor p ON ej.rut_profesor_jefe = p.rut
      JOIN representa r ON r.rut_alumno = a.rut
      JOIN apoderado ap ON r.rut_apoderado = ap.rut
      WHERE c.año = 2025
        AND r.fecha_inicio <= '2025-12-31'
        AND (r.fecha_termino IS NULL OR r.fecha_termino >= '2025-01-01')
    `;

    const { rows } = await pool.query(query);
    console.table(rows);
  } catch (error) {
    console.error('\nError al ejecutar consulta Q1:', error.message);
  }
}
