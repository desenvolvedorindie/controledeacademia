<?php

class IndexController extends Zend_Controller_Action
{
    /**
     * @var Zend_Log
     */
    private $logger;
    
    public function init()
    {
        $this->logger = Zend_Registry::get('logger');
    }

    public function indexAction()
    {
        $this->logger->log('Mensagem de debug', Zend_Log::DEBUG);
        $this->logger->log(array('para1' => 'value'), Zend_Log::DEBUG);
    }


}

