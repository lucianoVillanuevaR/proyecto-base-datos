import pool from './db.js';

export default async function ejecutarConsultaQ2() {
  console.clear();
  console.log('Consulta Q2 Profesores en media sin especialidad\n');

  try {
    const query = `
      SELECT DISTINCT p.nombres, p.apellido_paterno
      FROM profesor p
      JOIN extraprogramatica e ON p.rut = e.rut_profesor
      JOIN participa pa ON e.codigo = pa.codigo
      JOIN alumno a ON pa.rut_alumno = a.rut
      JOIN media m ON a.codigo_curso = m.codigo
      WHERE p.rut NOT IN (
        SELECT rut_profesor FROM tiene
      )
    `;

    const { rows } = await pool.query(query);
    console.table(rows);
  } catch (error) {
    console.error('\nError al ejecutar consulta Q2:', error.message);
  }
}
