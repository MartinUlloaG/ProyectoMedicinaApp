# App móvil de análisis de movimiento con IA

**Flutter · Python · MediaPipe · FastAPI**

---

## Descripción

Aplicación móvil desarrollada como proyecto universitario real que analiza la calidad de ejecución de ejercicios físicos mediante visión por computador.

El usuario graba o sube un video del ejercicio desde su celular. La app lo envía a un servidor Python que procesa el video frame a frame con MediaPipe, extrae landmarks corporales, calcula ángulos entre articulaciones y devuelve un puntaje de 0 a 100 con feedback específico por zona del cuerpo.

---

## Stack

**Frontend**
- Flutter (Dart)
- Persistencia local en JSON por usuario

**Backend**
- Python, FastAPI, Uvicorn
- MediaPipe Pose Landmarker

**Comunicación**
- API REST — el emulador Android accede al servidor vía `10.0.2.2:8000`

---

## Arquitectura
lib/
├── core/
│   ├── tema/          # Colores, tipografía, tema global (design tokens)
│   └── widgets/       # Widgets reutilizables compartidos entre pantallas
├── modelos/           # Clases de datos (Sesion, ResultadoAnalisis)
├── pantallas/         # Una carpeta por pantalla con su modelo asociado
├── servicios/         # Lógica desacoplada (auth, historial local, llamada a IA)
├── main.dart
└── rutas.dart

El servidor de análisis corre separado y expone un único endpoint:
POST /analizar
body: video (archivo) + ejercicio (string)
response: { ejercicio, puntaje, feedback[], metricas{} }

---

## Ejercicios soportados

- Sentadilla
- Zancada
- Curl de bíceps sentado
- Press de hombros sentado

---

## Cómo correr el proyecto

**Servidor:**
```bash
cd \MedicinaIA\ProyectoMovimiento-
venv\Scripts\activate
uvicorn servidor:app --reload --host 0.0.0.0 --port 8000
```

**App:**
```bash
cd medicina_app
flutter pub get
flutter run
```

---

## Condiciones de video recomendadas

- Grabar de frente o de lado según el ejercicio
- Cuerpo completo visible desde cabeza hasta pies
- Buena iluminación, sin contraluces

---

## Roadmap

- Autenticación con backend real y JWT
- Servidor desplegado en la nube
- Modo offline con modelo TFLite en dispositivo
- Historial con comparación entre sesiones

---

