# 📚 Proyecto base de datos

Este proyecto es una aplicación de consola desarrollada en **Node.js + PostgreSQL** que permite gestionar alumnos, modificar datos y ejecutar consultas SQL.

---

## 📦 Requisitos

- Node.js (v18 o superior)
- PostgreSQL funcionando localmente
- Base de datos creada con las tablas necesarias
- Archivo `.env` configurado correctamente en la raíz

---

## ⚙️ Instalación

1. Clona este repositorio:

```bash
git clone https://github.com/lucianoVillanuevaR/proyecto-base-datos-final.git
cd proyecto-base-datos-final
```

2. Instala las dependencias:

```bash
npm install
```

3. Crea un archivo `.env` en la raíz del proyecto con la siguiente configuración:

```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=basededatos
DB_PASSWORD=tu_contraseña
DB_PORT=5432
```

---

## 🚀 Uso

Desde terminal:

```bash
node menu/terminal.js
```

Verás un menú interactivo con las siguientes opciones:

- ✅ Ingresar nuevo alumno  
- ✏️ Modificar alumno existente  
- 📘 Consulta Q2: Profesores en media sin especialidad  
- 📊 Consulta Q3: Profesores con más alumnos  
- 📋 Consulta Q1: Alumnos con prof. jefe y apoderado vigente  

Usa las flechas del teclado y presiona Enter para elegir.

---

## 🧠 Consultas SQL

Las consultas están definidas en:

- `ejecutarConsultaQ1.js`
- `ejecutarConsultaQ2.js`
- `ejecutarConsultaQ3.js`

Y corresponden a las consultas pedidas en el enunciado del proyecto (Etapa 2).

---

## 🧾 Estructura del Proyecto

```
.
├── basededatos.sql           
├── db.js
├── .env                     
├── ingresarAlumno.js
├── modificarAlumno.js
├── ejecutarConsultaQ1.js
├── ejecutarConsultaQ2.js
├── ejecutarConsultaQ3.js
├── menu/
│   ├── terminal.js
│   └── menuPrincipal.js
├── package.json
└── README.md
```

---

## 🧱 Restaurar la base de datos

Para restaurar la estructura y datos de ejemplo de este proyecto:

1. Asegúrate de tener PostgreSQL instalado y agregado al PATH.
2. Crea una base de datos vacía llamada `basededatos`:

```bash
createdb basededatos
```

3. Ejecuta el script `basededatos.sql` para cargar las tablas y los datos:

```bash
psql -U postgres -d basededatos -f basededatos.sql
```

> Si tu usuario de PostgreSQL tiene otra contraseña o nombre, ajusta los parámetros `-U` y `-d` según corresponda.

Una vez restaurada, ya puedes ejecutar la aplicación desde terminal como se indica más arriba.

---

## 👤 Autor

Luciano Villanueva R. 
Universidad del Bío-Bío  
Trabajo final – Base de Datos
