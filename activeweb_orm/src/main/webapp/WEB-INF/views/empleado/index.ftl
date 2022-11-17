<@form action="buscar" method="get">
<input type="text" name="query">
<input type="submit" value="buscar">
</@form>

<@form action="mostrar" method="get">
<input type="submit" value="mostrar todos los empleados" />
</@form>

<#if lista??>  
<table>
    <tbody
        <#list lista as item>
         <tr>
            <td>${item.id}</td>
            <td>${item.documento}</td>
            <td>${item.nombre}</td>
            <td>${item.apellido}</td>
            <td>${item.fecha_alta}</td>
            <td>${item.sucursal.nombre}</td> 
            <td>
              <@form action="borrar" method="post">
                 <input name="id" type="hidden" value="${item.id}"/>
                 <input type="submit" value="eliminar"/>
              </@form>
            </td>
         </tr>
        </#list>
    </tbody>    
</table>
<@render partial="crear"/> 
</#if>