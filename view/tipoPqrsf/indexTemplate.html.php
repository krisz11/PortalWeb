<?php

use mvc\i18n\i18nClass as i18n ?>
<?php
use mvc\routing\routingClass as routing ?>
<?php $name = tipoPqrsfTableClass::NOMBRE ?>
<?php $id = tipoPqrsfTableClass::ID ?>





<div class="container container-fluid">


  <div class="page-header">
    <h1><i class="glyphicon glyphicon-thumbs-down"></i><i class="glyphicon glyphicon-thumbs-up"></i><?php echo i18n::__('feedbackType') ?></h1>
  </div>




  <form id="" action="<?php echo routing::getInstance()->getUrlWeb('tipoPqrsf', 'deleteSelect') ?>" method="POST">

    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th><input type="checkbox" id="chkAll"></th>
          <th><?php echo i18n::__('id') ?></th>
          <th><?php echo i18n::__('name') ?></th>

          <th><?php echo i18n::__('actions') ?></th>
        </tr>
      </thead>
      <tbody >
        <?php foreach ($objTipoPqrsf as $tipoPqrsf): ?>
          <tr>
            <td><input type="checkbox" name="chk[]" value="<?php echo $tipoPqrsf->$id ?>" class="chk"></td>
            <td><?php echo $tipoPqrsf->$id ?></td>
            <td><?php echo $tipoPqrsf->$name ?></td>


            <td>
              <!--              <a href="#" class="btn btn-warning btn-xs">Ver</a>-->
              <a href="#" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-eye-open" data-toggle="popover" title="Ver" data-content="datos de usuario"></i></a>
              <a href="<?php echo routing::getInstance()->getUrlWeb('usuario', 'edit', array(usuarioTableClass::ID => $usuario->$id)) ?>" class="btn btn-warning btn-xs" data-toggle="popover" title="Editar" data-content="edicion de usuario"><i class="glyphicon glyphicon-pencil"></i></a>
              <a href="#" onclick="confirmarEliminar(<?php echo $usuario->$id ?>)" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash" data-toggle="popover" title="Borrar" data-content="Eliminar usuario"></i></a>
            </td>
          </tr>
        <?php endforeach ?>
      </tbody>
    </table>
  </form>
  <form id="frmDelete" action="<?php echo routing::getInstance()->getUrlWeb('tipoPqrsf', 'delete') ?>" method="POST">
    <input type="hidden" id="idDelete" name="<?php echo tipoPqrsfTableClass::getNameField(tipoPqrsfTableClass::ID, true) ?>">
  </form>
  <div style="margin-bottom: 10px; margin-top: 30px" align="center">

    <a href="<?php echo routing::getInstance()->getUrlWeb('homePage', 'index') ?>"  class="btn btn-info" data-toggle="popover" title="Pagina de inicio" data-content="Index" ><i class="glyphicon glyphicon-home"></i></a> 
    <a href="<?php echo routing::getInstance()->getUrlWeb('tipoPqrsf', 'insert') ?>" class="btn btn-success" data-toggle="popover" title="Crear Nuevo Usuario" data-content="creacion de usuario"><i class="glyphicon glyphicon-plus"></i><i class="glyphicon glyphicon-user"></i></a>
    <a href="#" class="btn btn-danger " onclick="borrarSeleccion()" data-toggle="popover" title="Borrar seleccion" data-content="borrar seleccion"><i class="glyphicon glyphicon-check"></i><i class="glyphicon glyphicon-trash"></i></a>
    <!--        <a href="#" id="example" class="btn btn-primary" rel="popover" data-content="cuerpo-del-popover" data-original-title="ejemplo">Popover</a>-->
    <!--        <a href="#" class="btn btn-lg btn-danger" data-toggle="popover" title="A Title" data-content="And here's some amazing content. It's very engaging. right?">Hover to toggle popover</a>-->
    <button type="button" class="btn btn-primary" data-toggle="popover" data-placement="top" title="Popover title" data-content="Default popover">Popover on top</button>
  </div>


</div>
