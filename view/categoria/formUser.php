<?php

use mvc\request\requestClass as request ?>
<?php
use mvc\session\sessionClass as session ?>
<?php
use mvc\routing\routingClass as routing ?>
<?php
use mvc\i18n\i18nClass as i18n ?>
<?php $idUsuario = usuarioTableClass::ID ?>
<?php $password = usuarioTableClass::PASSWORD ?>







  <div class="container container-fluid">


    <form class="form-create" role="form" action="<?php echo routing::getInstance()->getUrlWeb('categoria', 'create') ?>" method="POST">
      <!--    <h2 class="form-signin-heading"></h2>-->

      <div class="form-group" <?php echo (session::getInstance()->hasFlash(categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, TRUE)) === TRUE) ? 'has-error has-feedback' : '' ?>>
        <label for="<?php echo categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, true) ?>" class="col-sm-2 control-label"><?php echo i18n::__('name') ?></label>
        <div class="col-sm-10">
          <input type="text" class="form-control" placeholder="<?php echo i18n::__('name') ?>"  name="<?php echo categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, true) ?>" id="<?php echo categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, true) ?>" value="<?php echo (session::getInstance()->hasFlash(categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, TRUE)) === TRUE) ? request::getInstance()->getPost(categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, TRUE)) : '' ?>">
          <?php if (session::getInstance()->hasFlash(categoriaTableClass::getNameField(categoriaTableClass::NOMBRE, TRUE)) === TRUE): ?>
            <span class="glyphicon glyphicon-remove form-control-feedback" ></span> 
<?php endif ?>
        </div>
      </div>


      <button class="btn btn-lg btn-primary btn-block" type="submit"><?php echo i18n::__('create') ?></button>
      <?php // if (session::getInstance()->hasError() or session::getInstance()->hasInformation() or session::getInstance()->hasSuccess() or session::getInstance()->hasWarning()): ?>
        
<?php // endif ?>
    </form>

  </div>


























