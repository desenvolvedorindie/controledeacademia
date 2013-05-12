<?php

class CustomerController extends Zend_Controller_Action {

    /**
     * @var Zend_Log
     */
    private $logger;

    public function init() {
        $this->logger = Zend_Registry::get('logger');
    }

    public function indexAction() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/search-customer.ini', 'form');
        $this->view->form = new Application_Form_SearchCustomer($config);
    }

    public function createAction() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/customer.ini', 'create');
        $this->view->form = new Application_Form_Customer($config);
    }

    public function editAction() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/customer.ini', 'edit');
        $this->view->form = new Application_Form_Customer($config);
    }

    public function paymentAction()
    {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/forms/payment.ini', 'form');
        $this->view->form = new Application_Form_Payment($config);
    }
}
