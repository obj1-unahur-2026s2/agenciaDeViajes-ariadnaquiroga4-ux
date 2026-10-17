class Pack {
    var duracion
    var precioBase
    var coordinadorACargo
    var beneficiosEspeciales = []
    method valorFinal() {
        return precioBase + beneficiosEspeciales.costos()
    }
    method precioBase() = precioBase
    method premium() {}
}
class Nacionales inherits Pack {
    var provinciaDestino
    var listaActividades = []
    override method premium() {
        return duracion > 10 and coordinadorACargo.altamenteCalificado()
    }
}
class PackProvinciales inherits Nacionales {
    var cantCiudadesAVisitas
    override method premium() {
        return listaActividades.size() > 4 and beneficiosEspeciales.size() > 3 and cantCiudadesAVisitas > 5
    }
    override method precioBase() {
        return if(self.premium()) {
            precioBase * 1.05
        }
    }
}
class Internacionales inherits Pack {
    var paisDestino
    var cantEscalas
    var lugarDeInteres
    override method valorFinal() {
        return super() * 1.20
    }
    override method premium() {
        return lugarDeInteres and duracion > 20 and cantEscalas == 0
    }
}
class beneficiosEspeciales {
    var tipo
    var costo
    var estaVigente
    method costos() = costo 
    method estaVigente() = estaVigente
}

class Coordinador {
    var cantViajesRealizados
    var estaMotivado 
    var añosDeExperiencia
    var rol = guia
    method cambiarRol(rolNuevo) {
        return if(rolNuevo == Guia || rolNuevo == AsistenteLogistico || rolNuevo == Acompañante) {
            rol = rolNuevo
        }
    }
    method estaMotivado() = estaMotivado
    method altamenteCalificado() {
        return cantViajesRealizados > 20
    }
}
class Guia inherits Coordinador {
  override method altamenteCalificado() {
    return super() and self.estaMotivado()
  }
}
class AsistenteLogistico inherits Coordinador{
  override method altamenteCalificado() {
    return super() and añosDeExperiencia >= 3
  }
}
class Acompañante inherits Coordinador{
  
}