package app.models;

import java.util.*;
import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.BelongsTo;
import org.javalite.activejdbc.annotations.IdName;
import org.javalite.activejdbc.annotations.Table;

@Table("fichadas.empleado")
@BelongsTo(foreignKeyName = "sucursal_id", parent = Sucursal.class)
@IdName("id")
public class Empleado extends Model{


    public List<Empleado> byNombreApellido(String nombre, String apellido){
        return where("nombre = ? or apellido = ?", nombre, apellido);
    }
    public void updateEmpleado(Map map){
        fromMap(map).save();
    }
    public void createEmpleado(Map map){
        fromMap(map).saveIt();
    }
    public void deleteEmpleado(){
        this.delete(true);
    }
    public Sucursal getSucursal(){
        return parent(Sucursal.class);
    }
    
}
