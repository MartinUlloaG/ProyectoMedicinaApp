import 'package:flutter/material.dart';
import '../../core/tema/colores.dart';
import '../../core/tema/tipografia.dart';
import '../../core/widgets/encabezado.dart';
import '../../core/widgets/boton_principal.dart';
import '../../rutas.dart';

class AnalizandoPantalla extends StatefulWidget {
  const AnalizandoPantalla({super.key});

  @override
  State<AnalizandoPantalla> createState() => _AnalizandoPantallaState();
}

class _AnalizandoPantallaState extends State<AnalizandoPantalla> {
  // Variable para hacer el while
  double _progreso = 0.0;

  @override
  void initState() {
    super.initState();
    _simularAnalisis();
  }

  Future<void> _simularAnalisis() async {
    // Ciclo mientrasn otengo el modelo
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() => _progreso = i / 10);
      }
    }
    // Cuando llega al 100% navega a resultado
    if (mounted) {
      Navigator.pushReplacementNamed(context, Rutas.resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.fondoApp,
      appBar: Encabezado(
        titulo: 'Analizando',
        centrado: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Card video
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColores.fondoCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColores.bordeDefault),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(
                      color: AppColores.azulLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.play_arrow_rounded,
                        color: AppColores.azulPrincipal, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('sentadilla_video.mp4', style: AppTipo.bodyMedium()
                            .copyWith(color: AppColores.textoPrincipal)),
                        Text('24 MB · 1:42 min', style: AppTipo.caption()
                            .copyWith(color: AppColores.textoSecundario)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColores.correctoBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Listo', style: AppTipo.badge()
                        .copyWith(color: AppColores.correctoTexto)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Spinner icono
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                color: AppColores.azulLight,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(
                  color: AppColores.azulPrincipal,
                  strokeWidth: 3,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text('Procesando tu video', style: AppTipo.cardTitle()
                .copyWith(color: AppColores.textoPrincipal)),
            const SizedBox(height: 4),
            Text('La IA está evaluando tu video', style: AppTipo.caption()
                .copyWith(color: AppColores.textoSecundario)),
            const SizedBox(height: 20),

            // Progeso
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _progreso,
                minHeight: 8,
                backgroundColor: AppColores.bordeDefault,
                color: AppColores.azulPrincipal,
              ),
            ),
            const SizedBox(height: 8),
            Text('${(_progreso * 100).toInt()}%', style: AppTipo.caption()
                .copyWith(color: AppColores.azulPrincipal)),

            const Spacer(),

            // Botón cancelar
            BotonPrincipal(
              texto: 'Cancelar',
              secundario: true,
              onPressed: () => Navigator.pushReplacementNamed(context, Rutas.preparacion),
            ),
          ],
        ),
      ),
    );
  }
}