# App móvil de análisis de movimiento con IA

**Flutter · Python · MediaPipe · FastAPI**

---

## Descripción

Aplicación móvil que realiza análisis de movimiento humano mediante visión por computador.  
La app captura datos desde el dispositivo móvil y los envía a un backend en Python, donde son procesados con MediaPipe para extraer información de pose y movimiento en tiempo real.

El proyecto explora la integración de inteligencia artificial en aplicaciones móviles, utilizando una arquitectura cliente-servidor ligera basada en servicios.

---

## Stack tecnológico

**Frontend**
- Flutter (Dart)
- Android Studio

**Backend**
- Python
- FastAPI
- Uvicorn

**Visión por computador / IA**
- MediaPipe
- OpenCV (opcional)

**Comunicación**
- API REST (HTTP)

---

## Arquitectura

El sistema está dividido en dos componentes:

- **App móvil (Flutter):** captura datos del usuario y los envía al servidor.
- **Servidor de IA (Python):** procesa el movimiento con MediaPipe y devuelve resultados estructurados.

El backend funciona como una API local accesible en red.

---

## Ejecución del proyecto

### Backend

Activar el entorno virtual y levantar el servidor:

```bash
cd C:\Users\ullov\Desktop\MedicinaIA\ProyectoMovimiento-
venv\Scripts\activate
uvicorn servidor:app --reload --host 0.0.0.0 --port 8000
