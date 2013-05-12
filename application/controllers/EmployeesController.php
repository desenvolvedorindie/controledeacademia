<?php

class EmployeesController extends Zend_Controller_Action {

    /**
     * @var Zend_Log
     */
    private $logger;

    public function init() {
        $this->logger = Zend_Registry::get('logger');
    }

    public function indexAction() {
        // action body
    }

    public function createAction() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/employees.ini', 'create');
        $this->view->form = new Application_Form_Customer($config);
    }

    public function editAction() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/employees.ini', 'edit');
        $this->view->form = new Application_Form_Customer($config);
    }
}