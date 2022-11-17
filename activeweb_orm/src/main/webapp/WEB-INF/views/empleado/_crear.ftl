
<span class="error_message"><@flash name="message"/></span>
<h2>Agregar nuevo Empleado</h2>


<@form action="crear" method="post">
<table style="margin:30px">
    <tr>
        <td>documento:</td>
        <td><input type="text" name="documento" value="${(flasher.params.documento)!}"> *
            <span class="error">${(flasher.errors.documento)!}</span>
        </td>
    </tr>
    <tr>
        <td>nombre:</td>
        <td><input type="text" name="nombre" value="${(flasher.params.nombre)!}"> *
            <span class="error">${(flasher.errors.nombre)!}</span>
        </td>
    </tr>
    <tr>
        <td>apellido:</td>
        <td><input type="text" name="apellido" value="${(flasher.params.apellido)!}"> *
            <span class="error">${(flasher.errors.apellido)!}</span>
        </td>
    </tr>

    <tr>
        <td>fecha de alta:</td>
        <td><input type="date" name="fecha_alta" value="${(flasher.params.fecha_alta)!}"> *
            <span class="error">${(flasher.errors.fecha_alta)!}</span>
        </td>
    </tr>
    <tr>
        <td>
            sucursal:
        </td>
        <td>
            <select name="sucursal"> 
                <option value="">Indique la sucursal</option>
                <#list listasucursal as item>
                <option value="${item.id}">${item.nombre}</option>
                </#list> 
            </select>
            <span class="error">${(flasher.errors.sucursal_id)!}</span>


        </td>
    </tr>
    
    <tr>
        <td></td>
        <td><@link_to>Cancel</@link_to> | <input type="submit" value="agregar nuevo empleado"></td>

    </tr>
</table>
</@form>



