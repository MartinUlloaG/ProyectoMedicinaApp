import 'package:flutter/material.dart';
import '../../core/tema/colores.dart';
import '../../core/tema/tipografia.dart';
import '../../core/widgets/encabezado.dart';
import '../../core/widgets/boton_principal.dart';
import '../../rutas.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  Widget _itemDetalle(String titulo, String subtitulo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColores.fondoCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColores.bordeDefault),
      ),
      child: Row(
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(
              color: AppColores.correctoBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.check, color: AppColores.correctoTexto, size: 16),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: AppTipo.bodyMedium()
                  .copyWith(color: AppColores.textoPrincipal)),
              const SizedBox(height: 2),
              Text(subtitulo, style: AppTipo.caption()
                  .copyWith(color: AppColores.textoSecundario)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.fondoApp,
      appBar: Encabezado(
        titulo: 'Resultado',
        centrado: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Card resultado general - Recordar que tengo que cambiarlo dependiendo
          // De la respuesta del modelo de IA.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColores.correctoBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: const BoxDecoration(
                    color: AppColores.correctoTexto,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ejercicio correcto', style: AppTipo.cardTitle()
                          .copyWith(color: AppColores.correctoTexto)),
                      Text('Sentadilla analizada', style: AppTipo.caption()
                          .copyWith(color: AppColores.correctoTexto)),
                    ],
                  ),
                ),
                Text('100/100', style: AppTipo.statNumber()
                    .copyWith(color: AppColores.correctoTexto)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Widgets de detalles
          Text('Detalle del análisis', style: AppTipo.labelMedium()
              .copyWith(color: AppColores.textoSecundario)),
          const SizedBox(height: 10),

          _itemDetalle('Posición de las rodillas', 'Ángulo correcto durante todo el ejercicio'),
          _itemDetalle('Posición de la espalda', 'Ángulo correcto durante todo el ejercicio'),
          _itemDetalle('Profundidad de la sentadilla', 'Ángulo correcto durante todo el ejercicio'),

          const SizedBox(height: 24),

          Center(
            child: Column(
              children: [
                Text('¡Felicitaciones!', style: AppTipo.cardTitle()
                    .copyWith(color: AppColores.textoPrincipal)),
                const SizedBox(height: 4),
                Text('Nada que corregir. ¡Bien hecho!', style: AppTipo.caption()
                    .copyWith(color: AppColores.textoSecundario)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Botones
          BotonPrincipal(
            texto: 'Volver al inicio',
            onPressed: () => Navigator.pushReplacementNamed(context, Rutas.inicio),
          ),
          const SizedBox(height: 10),
          BotonPrincipal(
            texto: 'Analizar otro video',
            secundario: true,
            onPressed: () => Navigator.pushReplacementNamed(context, Rutas.preparacion),
          ),
        ],
      ),
    );
  }
}