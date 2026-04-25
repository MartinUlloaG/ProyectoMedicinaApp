import 'package:flutter/material.dart';
import '../../core/tema/colores.dart';
import '../../core/tema/tipografia.dart';
import '../../core/widgets/encabezado.dart';
import '../../rutas.dart';
import '../../core/widgets/boton_principal.dart';

class PreparacionPantalla extends StatefulWidget {
  const PreparacionPantalla({super.key});

  @override
  State<PreparacionPantalla> createState() => _PreparacionPantallaState();
}

class _PreparacionPantallaState extends State<PreparacionPantalla> {
  Widget _itemInstruccion(String numero, String titulo, String subtitulo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24, height: 24,
            decoration: BoxDecoration(
              color: AppColores.azulLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(numero, style: AppTipo.badge()
                  .copyWith(color: AppColores.azulPrincipal)),
            ),
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
        titulo: 'Preparación',
        centrado: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Card subir video
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Rutas.analizando),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: AppColores.fondoCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColores.bordeDefault,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56, height: 56,
                    decoration: BoxDecoration(
                      color: AppColores.azulLight,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.upload_rounded,
                        color: AppColores.azulPrincipal, size: 28),
                  ),
                  const SizedBox(height: 14),
                  Text('Sube tu video', style: AppTipo.cardTitle()
                      .copyWith(color: AppColores.textoPrincipal)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text('Antes de grabar', style: AppTipo.labelMedium()
              .copyWith(color: AppColores.textoSecundario)),
          const SizedBox(height: 12),
          _itemInstruccion('1', 'Graba de frente o de lado', 'Para mejor detección de postura'),
          _itemInstruccion('2', 'Asegúrate de tener buena luz', 'Evita contraluces o sombras fuertes'),
          _itemInstruccion('3', 'Muestra el cuerpo completo', 'Desde la cabeza hasta los pies'),
          const SizedBox(height: 8),
          BotonPrincipal(
            texto: 'Seleccionar video',
            onPressed: () => Navigator.pushNamed(context, Rutas.analizando),
          ),
        ],
      ),
    );
  }
}