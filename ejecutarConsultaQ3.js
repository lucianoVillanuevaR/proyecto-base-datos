import pool from './db.js';

export default async function ejecutarConsultaQ3() {
  console.clear();
  console.log('Consulta Q3 Profesores jefes con más alumnos\n');

  try {
    const queryVista = `
      CREATE OR REPLACE VIEW Alumnosxcurso AS
      SELECT codigo_curso, COUNT(*) AS total_alumnos
      FROM alumno
      GROUP BY codigo_curso`;

    const queryFinal = `
      SELECT es_jefe.rut_profesor_jefe, profesor.nombres, profesor.apellido_paterno, axc.total_alumnos
      FROM es_jefe
      JOIN profesor ON es_jefe.rut_profesor_jefe = profesor.rut
      JOIN Alumnosxcurso axc ON es_jefe.codigo_curso = axc.codigo_curso
      WHERE axc.total_alumnos = (
        SELECT MAX(total_alumnos) FROM Alumnosxcurso
      )`;

    await pool.query(queryVista);
    const { rows } = await pool.query(queryFinal);
    console.table(rows);
  } catch (error) {
    console.error('\nError al ejecutar consulta Q3:', error.message);
  }
}
