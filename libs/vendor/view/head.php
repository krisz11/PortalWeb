<!DOCTYPE html>
<html lang="<?php echo \mvc\config\configClass::getDefaultCulture() ?>">
    <head>
        <?php echo \mvc\view\viewClass::genMetas() ?>
        <?php echo \mvc\view\viewClass::genFavicon() ?>
        <?php echo \mvc\view\viewClass::genStylesheet() ?>
        <?php echo \mvc\view\viewClass::genJavascript() ?>
        <?php echo \mvc\view\viewClass::genTitle() ?>  

    </head>
<?php use mvc\routing\routingClass as routing ?>
    <body>
  <!--<div class="panel panel-success">Sesion Iniciada como : <?php //echo \mvc\session\sessionClass::getInstance()->getUserName()  ?> <a href="<?php // echo \mvc\routing\routingClass::getInstance()->getUrlWeb('shfSecurity', 'logout')   ?>" class="btn btn-danger">Log out</a></div>-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img alt="Brand" src="<?php echo mvc\routing\routingClass::getInstance()->getUrlImg('favicon.ico') ?>"></a>
                
                
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<?php echo routing::getInstance()->getUrlWeb('homePage', 'index') ?>">Inicio <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" ><?php echo \mvc\session\sessionClass::getInstance()->getUserName()  ?>&nbsp;<i class="glyphicon glyphicon-user"></i> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a  href="<?php  echo \mvc\routing\routingClass::getInstance()->getUrlWeb('shfSecurity', 'logout')   ?>" data-toggle="popover" title="Log Out" data-content="Salida de el sistema"><i class="glyphicon glyphicon-log-out"></i>&nbsp;Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>