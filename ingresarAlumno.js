import pool from './db.js';
const inquirer = (await import('inquirer')).default;

export default async function ingresarAlumno() {
  console.clear();
  console.log('Ingreso de nuevo alumno\n');

  const respuestas = await inquirer.prompt([
    { name: 'rut', message: 'RUT:' },
    { name: 'nombres', message: 'Nombres:' },
    { name: 'apellidoPaterno', message: 'Apellido paterno:' },
    { name: 'apellidoMaterno', message: 'Apellido materno:' },
    { name: 'fechaNacimiento', message: 'Fecha de nacimiento (YYYY-MM-DD):' },
    { name: 'direccion', message: 'Dirección:' },
    { name: 'ciudad', message: 'Ciudad:' },
    { name: 'codigoCurso', message: 'Código del curso:' }
  ]);

  try {
    const query = `
      INSERT INTO alumno (rut, nombres, apellido_paterno, apellido_materno, fecha_nacimiento, direccion, ciudad, codigo_curso)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`;

    const values = Object.values(respuestas);
    const result = await pool.query(query, values);
    console.log('\nAlumno ingresado:\n', result.rows[0]);
  } catch (error) {
    console.error('\nError al ingresar alumno:', error.message);
  }
}
