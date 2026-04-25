import 'package:flutter/material.dart';
import '../../core/tema/colores.dart';
import '../../core/tema/tipografia.dart';
import '../../core/widgets/encabezado.dart';
import '../../rutas.dart';
import '../../core/widgets/item_sesion.dart';
import '../../core/widgets/insignia_estado.dart';
import '../../servicios/auth_servicios.dart';



class InicioPantalla extends StatefulWidget {
  const InicioPantalla({super.key});

  @override
  State<InicioPantalla> createState() => _InicioPantallaState();
}

class _InicioPantallaState extends State<InicioPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores.fondoApp,
      appBar: Encabezado(
        titulo: AuthServicio.usuarioActual,
        saludo: '¡Bienvenido de vuelta!',
        nombreUsuario: AuthServicio.usuarioActual,
        onAvatarTap: () => Navigator.pushNamed(context, Rutas.cuenta),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // Card
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Rutas.preparacion),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColores.fondoCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColores.bordeDefault),
              ),
              child: Row(
                children: [
                  // Icono
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      color: AppColores.azulLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.play_arrow_rounded,
                        color: AppColores.azulPrincipal, size: 26),
                  ),
                  const SizedBox(width: 14),
                  // Texto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Iniciar análisis', style: AppTipo.cardTitle()
                          .copyWith(color: AppColores.textoPrincipal)),
                      const SizedBox(height: 2),
                      Text('Comenzar evaluación', style: AppTipo.caption()
                          .copyWith(color: AppColores.textoSecundario)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Separación
          SizedBox(height: 20),
          // Sesiones TOtales
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColores.bordeDefault,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColores.bordeDefault),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3', style: AppTipo.statNumber()
                      .copyWith(color: AppColores.textoPrincipal)),
                  Text('Sesiones totales', style: AppTipo.caption()
                      .copyWith(color: AppColores.textoSecundario)),
                ],
              ),
            ),
          ),
          // Separacion
          SizedBox(height: 30),
          // Recientes texto
          Align(
            alignment: Alignment.centerLeft,
            child:           Text('Recientes', style: AppTipo.sectionTitle()
                .copyWith(color: AppColores.textoSecundario)),
          ),
          // Separacion
          SizedBox(height: 50),
          // Widgets de ejercicios recientes
          ItemSesion(
            nombre: 'Bícep',
            fecha: 'Hoy, 09:14',
            estado: EstadoAnalisis.correcto,
            icono: Icons.fitness_center,
          ),
          ItemSesion(
            nombre: 'Sentadilla con barra',
            fecha: 'Ayer, 18:30',
            estado: EstadoAnalisis.advertencia,
            icono: Icons.accessibility_new,
          ),
          ItemSesion(
            nombre: 'Cardio',
            fecha: 'Martes, 15:00',
            estado: EstadoAnalisis.peligro,
            icono: Icons.directions_run,
          ),





        ],
      ),
    );
  }
}

