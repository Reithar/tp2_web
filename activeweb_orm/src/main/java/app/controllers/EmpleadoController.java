package app.controllers;

import app.models.Empleado;
import app.models.Movimiento;
import app.models.Sucursal;
import java.util.List;
import java.util.Map;
import org.javalite.activejdbc.LazyList;
import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.GET;
import org.javalite.activeweb.annotations.POST;

public class EmpleadoController extends AppController {

    public void index() {

    }
    
    @GET
    public void mostrar(){
        List<Sucursal> listaSucursal = Sucursal.findAll();
        view("listasucursal", listaSucursal);

        LazyList<Empleado> lista = Empleado.findAll().include(Sucursal.class);
        view("lista", lista);
        render("index");

    }

    @GET
    public void buscar() {
        String queryString = "'%" + param("query") + "%'";
          if(queryString != null){
              LazyList<Empleado> lista = Empleado.where(
                String.format("nombre ilike %s or apellido ilike %s or nombre || ' '  || apellido ilike %s", queryString, queryString, queryString)
        );
             view("lista", lista);
             render("index");
        }else{
            flash("Error al buscar empleado" + queryString);
            redirect(EmpleadoController.class);
        }
    }

    @POST
    public void crear() {

        try {
            Empleado e = new Empleado();
            e.setInteger("documento", Integer.valueOf(param("documento")))
                    .set("nombre", param("nombre"))
                    .set("apellido", param("apellido"))
                    .setDate("fecha_alta", param("fecha_alta"))
                    .setInteger("sucursal_id", Integer.valueOf(param("sucursal")));
           
            e.save();
            redirect(EmpleadoController.class, "index");
        } catch (Exception e) {
            flash("Error al crear un nuevo empleado " + e.getMessage());
        }
    }
    @POST
    public void borrar() {
        Empleado e = Empleado.findById( Integer.valueOf(param("id")));
        Movimiento.delete("empleado_id = ?", e.getId());
        e.delete();
        flash("message", "Empleado: '" + e.getId() + "' eliminado exitosamente");
        redirect(EmpleadoController.class, "index");
    }

    public void actualizar() {
        Empleado e = Empleado.findById( Integer.valueOf(param("id")));
        
        e.set("id", e).set("documento", e).set("apellido", e).set("fecha_alta", e).set("sucursal_id", e);
    }

}
