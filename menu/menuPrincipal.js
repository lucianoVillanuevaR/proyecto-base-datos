import inquirer from 'inquirer';
import ingresarAlumno from '../ingresarAlumno.js';
import modificarAlumno from '../modificarAlumno.js';
import ejecutarConsultaQ1 from '../ejecutarConsultaQ1.js';
import ejecutarConsultaQ2 from '../ejecutarConsultaQ2.js';
import ejecutarConsultaQ3 from '../ejecutarConsultaQ3.js';

export default async function menuPrincipal() {
  console.clear();
  console.log('Sistema de Gestión de Alumnos\n');

  const { opcion } = await inquirer.prompt([
    {
      type: 'list',
      name: 'opcion',
      message: 'Selecciona una opción:',
      choices: [
        { name: '1. Ingresar nuevo alumno', value: '1' },
        { name: '2. Modificar alumno existente', value: '2' },
        { name: '3. Ejecutar consulta Q2 (profesores en media sin especialidad)', value: '3' },
        { name: '4. Ejecutar consulta Q3 (profesores con más alumnos)', value: '4' },
        { name: '5. Ejecutar consulta Q1 (alumno + prof jefe + apoderado)', value: '5' },
        { name: '6. Salir', value: '6' }
      ]
    }
  ]);

  switch (opcion) {
    case '1': await ingresarAlumno(); break;
    case '2': await modificarAlumno(); break;
    case '3': await ejecutarConsultaQ2(); break;
    case '4': await ejecutarConsultaQ3(); break;
    case '5': await ejecutarConsultaQ1(); break;
    case '6': default:
      console.log('\nAdiós.\n');
      process.exit();
  }

  await inquirer.prompt([{ name: 'continuar', message: 'Presiona Enter para volver al menú' }]);
  await menuPrincipal();
}
