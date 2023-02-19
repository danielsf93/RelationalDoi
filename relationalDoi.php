<?php

import('lib.pkp.classes.plugins.GenericPlugin');

class relationalDoi extends GenericPlugin {
    public function register($category, $path, $mainContextId = NULL) {
        $success = parent::register($category, $path);
            if ($success && $this->getEnabled()) {
               HookRegistry::register('TemplateResource::getFilename', array($this, '_overridePluginTemplates'));
                       HookRegistry::register('TemplateResource::getFilename', array($this, '_overrideDOITemplate'));
                       HookRegistry::register('TemplateResource::getFilename', array($this, '_overrideDOITemplatenovamente'));

            }
        return $success;
    }





public function _overrideDOITemplate($hookName, $args) {
    $templatePath = $args[0];
    if ($templatePath === 'plugins/pubIds/doi/templates/settingsForm.tpl') {
        $args[0] = 'plugins/generic/relationalDoi/templates/settingsForm.tpl';
    }
    return false;
}


public function _overrideDOITemplatenovamente($hookName, $args) {
    $templatePath = $args[0];
    if ($templatePath === 'plugins/pubIds/doi/templates/doiSuffixEdit.tpl') {
        $args[0] = 'plugins/generic/relationalDoi/templates/doiSuffixEdit.tpl';
    }
    return false;
}


  /**
   * Provide a name for this plugin
   *
   * The name will appear in the plugins list where editors can
   * enable and disable plugins.
   */
	public function getDisplayName() {
		return __('Relational DOI');
	}

	/**
   * Provide a description for this plugin
   *
   * The description will appear in the plugins list where editors can
   * enable and disable plugins.
   */
	public function getDescription() {
		return __('Este plugin mostra os DOIs de todos os arquivos de um artigo');
	}
	
	
	
	
	
	
	
}
