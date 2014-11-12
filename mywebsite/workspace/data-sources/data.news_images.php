<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcenews_images extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'news-images';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'sort-order';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '8' => '{$ds-current-news.system-id}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'caption',
        'credits',
        'image'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-current-news.system-id');
    }

    public function about()
    {
        return array(
            'name' => 'News Images',
            'author' => array(
                'name' => 'Bernardo Dias da Cruz',
                'website' => 'http://localhost/mywebsite',
                'email' => 'bernardodiasdacruz@gmail.com'),
            'version' => 'Symphony 2.5.1',
            'release-date' => '2014-11-02T18:19:38+00:00'
        );
    }

    public function getSource()
    {
        return '2';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}