# Reserva de Horas Médicas – Proyecto DevOps (Clínica Salud Integral)

Proyecto integrador de DevOps (IACC). Sitio web **estático** que simula un formulario de reserva de horas médicas, servido con **Nginx** dentro de un contenedor **Docker**. No usa API ni base de datos.

> Todos los datos del sitio son ficticios. El formulario es solo una simulación y no envía ni guarda información.

## Estructura

```
proyecto-devops/
├── src/
│   ├── index.html
│   └── styles.css
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── README.md
└── .github/workflows/devops-automation.yml   (complementario)
```

## Requisitos

- Git
- Docker Desktop iniciado y funcionando
- Navegador web

## Instalación

```bash
git clone <URL-DEL-REPOSITORIO>
cd proyecto-devops
cp .env.example .env      # opcional: en Windows PowerShell usar: copy .env.example .env
```

## Ejecución

```bash
docker compose up -d --build
```

## Verificación

1. Abrir http://localhost:8080 en el navegador.
2. Revisar el estado del contenedor:
   ```bash
   docker compose ps
   docker ps
   ```
3. Revisar logs y consumo de recursos:
   ```bash
   docker compose logs
   docker logs reserva-horas-web
   docker stats --no-stream
   ```

## Detener y limpiar

```bash
docker compose down
```

## Seguridad (buenas prácticas aplicadas)

- No se publican credenciales, tokens ni datos personales.
- `.env` está en `.gitignore`; solo se versiona `.env.example`, sin valores sensibles.
- Los datos del formulario y del sitio son ficticios.
- El contenedor se ejecuta con `no-new-privileges`.
- Antes de cada commit se revisa con `git status` y `git diff` que no se incluyan archivos sensibles.

### Cómo se evita publicar información sensible

- El archivo `.env` real nunca se versiona: está excluido en `.gitignore`.
- Solo se publica `.env.example`, que contiene valores de ejemplo y ningún dato real.
- Todos los datos del sitio y del formulario son ficticios; el formulario no envía ni almacena información.
- Antes de cada commit se revisa con `git status` y `git diff` que no haya archivos sensibles.
- Antes de cada pull request se revisa la pestaña *Files changed*.
- Si una credencial se publicara por error, se debe revocar y reemplazar de inmediato; borrarla del historial no es suficiente.

## Flujo de trabajo con Git

- `main`: rama estable.
- Ramas de trabajo: `feature/...`, `fix/...`, `docs/...`.
- Cambios mediante commits pequeños con mensajes claros y pull request revisado antes del merge a `main`.

## Automatización (complementaria)

El workflow `devops-automation.yml` valida archivos obligatorios, revisa que no exista un `.env` versionado, construye la imagen, levanta el servicio y comprueba que responda. No publica la aplicación en servidores externos.
