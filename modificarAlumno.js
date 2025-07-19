import pool from './db.js';
const inquirer = (await import('inquirer')).default;

export default async function modificarAlumno() {
  console.clear();
  console.log('✏️ Modificación de alumno\n');

  const { rut } = await inquirer.prompt([{ name: 'rut', message: 'RUT del alumno a modificar:' }]);

  try {
    const result = await pool.query('SELECT * FROM alumno WHERE rut = $1', [rut]);
    if (result.rowCount === 0) {
      console.log('\nAlumno no encontrado.');
      return;
    }

    const alumno = result.rows[0];
    console.log('\n🔍 Datos actuales:\n', alumno);

    const respuestas = await inquirer.prompt([
      { name: 'nombres', message: `Nombres [${alumno.nombres}]:`, default: alumno.nombres },
      { name: 'apellidoPaterno', message: `Apellido paterno [${alumno.apellido_paterno}]:`, default: alumno.apellido_paterno },
      { name: 'apellidoMaterno', message: `Apellido materno [${alumno.apellido_materno}]:`, default: alumno.apellido_materno },
      { name: 'fechaNacimiento', message: `Fecha nacimiento [${alumno.fecha_nacimiento.toISOString().slice(0, 10)}]:`, default: alumno.fecha_nacimiento.toISOString().slice(0, 10) },
      { name: 'direccion', message: `Dirección [${alumno.direccion}]:`, default: alumno.direccion },
      { name: 'ciudad', message: `Ciudad [${alumno.ciudad}]:`, default: alumno.ciudad },
      { name: 'codigoCurso', message: `Código curso [${alumno.codigo_curso}]:`, default: alumno.codigo_curso }
    ]);

    const updateQuery = `
      UPDATE alumno SET
        nombres = $1, apellido_paterno = $2, apellido_materno = $3,
        fecha_nacimiento = $4, direccion = $5, ciudad = $6, codigo_curso = $7
      WHERE rut = $8 RETURNING *`;

    const values = [
      respuestas.nombres,
      respuestas.apellidoPaterno,
      respuestas.apellidoMaterno,
      respuestas.fechaNacimiento,
      respuestas.direccion,
      respuestas.ciudad,
      respuestas.codigoCurso,
      rut
    ];

    const updateResult = await pool.query(updateQuery, values);
    console.log('\nAlumno modificado:\n', updateResult.rows[0]);
  } catch (error) {
    console.error('\nError al modificar alumno:', error.message);
  }
}
