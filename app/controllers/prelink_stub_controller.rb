class PrelinkStubController < ApplicationController
  include WashOut::SOAP

  # You can use all Rails features like filtering, too. A SOAP controller
  # is just like a normal controller with a special routing.
  before_filter :dump_parameters

  def dump_parameters
    Rails.logger.debug params.to_yaml
    Rails.logger.debug params.inspect
  end

  soap_action "GetResultsFromRequestNumber",
    :args   => :integer,
    :return => :string,
    :to     => :get_results_from_request_number
  def get_results_from_request_number
    xml = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetResultsFromRequestNumberResponse xmlns="http://www.prelink.co.za/">
      <GetResultsFromRequestNumberResult>' + # params["Envelope"]["Body"].to_s +
      '</GetResultsFromRequestNumberResult>
    </GetResultsFromRequestNumberResponse>
  </soap:Body>
</soap:Envelope>'
    
    render :text => params.to_s
  end

  soap_action "OrderRequest",
    :args   => :integer,
    :return => :string,
    :to     => :order_request
  def order_request
    acc_nums = ["BKQ10A", "BKQ109", "BKQ108", "BIP17S", "BKQ107", "BIP14Z", "BIP153", "BKQ106", "BKQ105", "BAN3DE", "BAN3DD"]
    
    req_num = acc_nums[rand(acc_nums.length)]

    xml = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <OrderRequestResponse xmlns="http://www.prelink.co.za/">
      <OrderRequestResult>
        <Error>string</Error>
        <Status>Error or RequestCreatedWithTestError or RequestAndTestsCreated</Status>
        <RequestNumber>' + req_num + '</RequestNumber>
        <Barcodes>' + req_num + '</Barcodes>
      </OrderRequestResult>
    </OrderRequestResponse>
  </soap:Body>
</soap:Envelope>'

    render :xml => xml
  end

  soap_action "GetNewResults",
    :args   => :integer,
    :return => :string,
    :to     => :get_new_results
  def get_new_results
    xml = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <soap:Body>
        <GetNewResultsResponse xmlns="http://www.prelink.co.za/">
            <GetNewResultsResult>
                <xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
                    <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:MainDataTable="Result" msdata:UseCurrentLocale="true">
                        <xs:complexType>
                            <xs:choice minOccurs="0" maxOccurs="unbounded">
                                <xs:element name="Result">
                                    <xs:complexType>
                                        <xs:sequence>
                                            <xs:element name="RequestNumber" type="xs:string" minOccurs="0" />
                                            <xs:element name="TestCode" type="xs:string" minOccurs="0" />
                                            <xs:element name="Result" type="xs:string" minOccurs="0" />
                                            <xs:element name="TestUnit" type="xs:string" minOccurs="0" />
                                            <xs:element name="TestRange" type="xs:string" minOccurs="0" />
                                            <xs:element name="Colour" type="xs:string" minOccurs="0" />
                                        </xs:sequence>
                                    </xs:complexType>
                                </xs:element>
                            </xs:choice>
                        </xs:complexType>
                    </xs:element>
                </xs:schema>
                <diffgr:diffgram xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1">
                    <DocumentElement xmlns="">
                        <Result diffgr:id="Result1" msdata:rowOrder="0">
                            <RequestNumber>BKQ10A</RequestNumber>
                            <Result>1.03</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result2" msdata:rowOrder="1">
                            <RequestNumber>BKQ109</RequestNumber>
                            <Result>0.23</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result3" msdata:rowOrder="2">
                            <RequestNumber>BKQ108</RequestNumber>
                            <Result>0.65</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result4" msdata:rowOrder="3">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result5" msdata:rowOrder="4">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit>None</TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result6" msdata:rowOrder="5">
                            <RequestNumber>BIP17S</RequestNumber>
                            <TestCode>CSFAPP</TestCode>
                            <Result>Clear</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result7" msdata:rowOrder="6">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>0</Result>
                            <TestUnit>10^6/uL</TestUnit>
                            <TestRange>0 - 20</TestRange>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result8" msdata:rowOrder="7">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>110</Result>
                            <TestUnit>10^6/uL</TestUnit>
                            <TestRange>0 - 10</TestRange>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result9" msdata:rowOrder="8">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit>%</TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result10" msdata:rowOrder="9">
                            <RequestNumber>BIP17S</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit>%</TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result11" msdata:rowOrder="10">
                            <RequestNumber>BKQ107</RequestNumber>
                            <Result>2.07</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result12" msdata:rowOrder="11">
                            <RequestNumber>BIP14Z</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result13" msdata:rowOrder="12">
                            <RequestNumber>BIP14Z</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result14" msdata:rowOrder="13">
                            <RequestNumber>BIP153</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result15" msdata:rowOrder="14">
                            <RequestNumber>BIP153</RequestNumber>
                            <Result>Not Done</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result16" msdata:rowOrder="15">
                            <RequestNumber>BKQ106</RequestNumber>
                            <Result>1.02</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result17" msdata:rowOrder="16">
                            <RequestNumber>BKQ105</RequestNumber>
                            <Result>1.00</Result>
                            <TestUnit>g</TestUnit>
                            <Colour>#FFFFFF</Colour>
                        </Result>
                        <Result diffgr:id="Result18" msdata:rowOrder="17">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result19" msdata:rowOrder="18">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result20" msdata:rowOrder="19">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result21" msdata:rowOrder="20">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result22" msdata:rowOrder="21">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result23" msdata:rowOrder="22">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result24" msdata:rowOrder="23">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result25" msdata:rowOrder="24">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result26" msdata:rowOrder="25">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result27" msdata:rowOrder="26">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result28" msdata:rowOrder="27">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result29" msdata:rowOrder="28">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result30" msdata:rowOrder="29">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result31" msdata:rowOrder="30">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result32" msdata:rowOrder="31">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result33" msdata:rowOrder="32">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result34" msdata:rowOrder="33">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result35" msdata:rowOrder="34">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Positive</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result36" msdata:rowOrder="35">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result37" msdata:rowOrder="36">
                            <RequestNumber>BAN3DE</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result38" msdata:rowOrder="37">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result39" msdata:rowOrder="38">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result40" msdata:rowOrder="39">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result41" msdata:rowOrder="40">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result42" msdata:rowOrder="41">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result43" msdata:rowOrder="42">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result44" msdata:rowOrder="43">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result45" msdata:rowOrder="44">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result46" msdata:rowOrder="45">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result47" msdata:rowOrder="46">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result48" msdata:rowOrder="47">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result49" msdata:rowOrder="48">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                        <Result diffgr:id="Result50" msdata:rowOrder="49">
                            <RequestNumber>BAN3DD</RequestNumber>
                            <Result>Negative</Result>
                            <TestUnit xml:space="preserve"> </TestUnit>
                            <Colour>#00FFCC</Colour>
                        </Result>
                    </DocumentElement>
                </diffgr:diffgram>
            </GetNewResultsResult>
        </GetNewResultsResponse>
    </soap:Body>
</soap:Envelope>'

    render :text => xml
  end

  soap_action "GetTestCodes",
    :args   => :nil,
    :return => :string,
    :to     => :get_test_codes
  def get_test_codes
    xml = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <soap:Body>
        <GetTestCodesResponse xmlns="http://www.prelink.co.za/">
            <GetTestCodesResult>
                <xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
                    <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:MainDataTable="DynamicList" msdata:UseCurrentLocale="true">
                        <xs:complexType>
                            <xs:choice minOccurs="0" maxOccurs="unbounded">
                                <xs:element name="DynamicList">
                                    <xs:complexType>
                                        <xs:sequence>
                                            <xs:element name="TestName" type="xs:string" minOccurs="0" />
                                            <xs:element name="TestCode" type="xs:string" minOccurs="0" />
                                        </xs:sequence>
                                    </xs:complexType>
                                </xs:element>
                            </xs:choice>
                        </xs:complexType>
                    </xs:element>
                </xs:schema>
                <diffgr:diffgram xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1">
                    <DocumentElement xmlns="">
                        <DynamicList diffgr:id="DynamicList1" msdata:rowOrder="0">
                            <TestName>Albumin</TestName>
                            <TestCode>08B</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList2" msdata:rowOrder="1">
                            <TestName>Alkaline Phosphatase</TestName>
                            <TestCode>35A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList3" msdata:rowOrder="2">
                            <TestName>ALT</TestName>
                            <TestCode>31A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList4" msdata:rowOrder="3">
                            <TestName>AST</TestName>
                            <TestCode>30A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList5" msdata:rowOrder="4">
                            <TestName>Basophils#</TestName>
                            <TestCode>BA#</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList6" msdata:rowOrder="5">
                            <TestName>Basophils%</TestName>
                            <TestCode>BA%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList7" msdata:rowOrder="6">
                            <TestName>BCULT blood collection team?</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList8" msdata:rowOrder="7">
                            <TestName>BCULT blood weight</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList9" msdata:rowOrder="8">
                            <TestName>BCULT bottle weight Post</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList10" msdata:rowOrder="9">
                            <TestName>BCULT bottle weight Pre</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList11" msdata:rowOrder="10">
                            <TestName>BCULT Paeds BC bottle label</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList12" msdata:rowOrder="11">
                            <TestName>Bilirubin Direct</TestName>
                            <TestCode>12A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList13" msdata:rowOrder="12">
                            <TestName>Bilirubin Total</TestName>
                            <TestCode>11A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList14" msdata:rowOrder="13">
                            <TestName>Blood parasite (non-Malaria)</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList15" msdata:rowOrder="14">
                            <TestName>BM BCULT</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList16" msdata:rowOrder="15">
                            <TestName>Cholesterol</TestName>
                            <TestCode>44A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList17" msdata:rowOrder="16">
                            <TestName>Ciprofloxacin Etest</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList18" msdata:rowOrder="17">
                            <TestName>CRAG Test</TestName>
                            <TestCode>MCA</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList19" msdata:rowOrder="18">
                            <TestName>Creatinine</TestName>
                            <TestCode>03F</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList20" msdata:rowOrder="19">
                            <TestName>CRP</TestName>
                            <TestCode>89A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList21" msdata:rowOrder="20">
                            <TestName>Cryptosporidium oocysts</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList22" msdata:rowOrder="21">
                            <TestName>CSF Indian Ink</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList23" msdata:rowOrder="22">
                            <TestName>CTXT</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList24" msdata:rowOrder="23">
                            <TestName>Eosinophils#</TestName>
                            <TestCode>EO#</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList25" msdata:rowOrder="24">
                            <TestName>Eosinophils%</TestName>
                            <TestCode>EO%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList26" msdata:rowOrder="25">
                            <TestName>Gene Xpert MTB Blood</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList27" msdata:rowOrder="26">
                            <TestName>Gene Xpert MTB sputum</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList28" msdata:rowOrder="27">
                            <TestName>Gene Xpert Rif blood</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList29" msdata:rowOrder="28">
                            <TestName>Gene Xpert Rif sputum</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList30" msdata:rowOrder="29">
                            <TestName>GGT</TestName>
                            <TestCode>36A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList31" msdata:rowOrder="30">
                            <TestName>Glucose random</TestName>
                            <TestCode>06A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList32" msdata:rowOrder="31">
                            <TestName>Glucose random (serum)</TestName>
                            <TestCode>06A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList33" msdata:rowOrder="32">
                            <TestName>Haematocrit</TestName>
                            <TestCode>HCT</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList34" msdata:rowOrder="33">
                            <TestName>Haematology blood film made?</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList35" msdata:rowOrder="34">
                            <TestName>Haemoglobin</TestName>
                            <TestCode>HB</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList36" msdata:rowOrder="35">
                            <TestName>HDL Cholesterol</TestName>
                            <TestCode>83D</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList37" msdata:rowOrder="36">
                            <TestName>Hepatitis B Surface Antigen (RT)</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList38" msdata:rowOrder="37">
                            <TestName>Hepatitis C  (RT)</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList39" msdata:rowOrder="38">
                            <TestName>HIV Abbott Viral Load 0.2ml CSF</TestName>
                            <TestCode />
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList40" msdata:rowOrder="39">
                            <TestName>HIV Abbott Viral Load 0.2ml PLASMA</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList41" msdata:rowOrder="40">
                            <TestName>HIV DNA PCR</TestName>
                            <TestCode>HIVAMPLICORPCRQUAL</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList42" msdata:rowOrder="41">
                            <TestName>HIV DNA PCR Confirmatory</TestName>
                            <TestCode>HIVAMPLICORPCRQUAL</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList43" msdata:rowOrder="42">
                            <TestName>HIV Rapid Test</TestName>
                            <TestCode>HIVD</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList44" msdata:rowOrder="43">
                            <TestName>HIV Vironostika Elisa</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList45" msdata:rowOrder="44">
                            <TestName>HSV-2 KALON ELISA</TestName>
                            <TestCode>HSV2KALON</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList46" msdata:rowOrder="45">
                            <TestName>HTXT</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList47" msdata:rowOrder="46">
                            <TestName>LDH</TestName>
                            <TestCode>83D</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList48" msdata:rowOrder="47">
                            <TestName>LDL Cholesterol</TestName>
                            <TestCode>34B</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList49" msdata:rowOrder="48">
                            <TestName>Lymphocytes#</TestName>
                            <TestCode>LY#</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList50" msdata:rowOrder="49">
                            <TestName>Lymphocytes%</TestName>
                            <TestCode>LY%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList51" msdata:rowOrder="50">
                            <TestName>Magnesium</TestName>
                            <TestCode>48A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList52" msdata:rowOrder="51">
                            <TestName>Mal P falciparum trophs/500 RBCs</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList53" msdata:rowOrder="52">
                            <TestName>Malaria Thick Film</TestName>
                            <TestCode>MALTHICK</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList54" msdata:rowOrder="53">
                            <TestName>malaria thick parasitaemia</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList55" msdata:rowOrder="54">
                            <TestName>MCH</TestName>
                            <TestCode>MCH</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList56" msdata:rowOrder="55">
                            <TestName>MCHC</TestName>
                            <TestCode>MCHC</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList57" msdata:rowOrder="56">
                            <TestName>MCV</TestName>
                            <TestCode>MCV</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList58" msdata:rowOrder="57">
                            <TestName>Mean Reticulocyte Volume</TestName>
                            <TestCode>MRETVol</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList59" msdata:rowOrder="58">
                            <TestName>Monocytes#</TestName>
                            <TestCode>MO#</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList60" msdata:rowOrder="59">
                            <TestName>Monocytes%</TestName>
                            <TestCode>MO%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList61" msdata:rowOrder="60">
                            <TestName>MPV</TestName>
                            <TestCode>MPV</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList62" msdata:rowOrder="61">
                            <TestName>NA</TestName>
                            <TestCode>01A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList63" msdata:rowOrder="62">
                            <TestName>Neutrophils#</TestName>
                            <TestCode>NE#</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList64" msdata:rowOrder="63">
                            <TestName>Neutrophils%</TestName>
                            <TestCode>NE%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList65" msdata:rowOrder="64">
                            <TestName>PCV</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList66" msdata:rowOrder="65">
                            <TestName>Platelets</TestName>
                            <TestCode>PLT</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList67" msdata:rowOrder="66">
                            <TestName>Pneumococcus Isolation</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList68" msdata:rowOrder="67">
                            <TestName>Potassium</TestName>
                            <TestCode>01B</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList69" msdata:rowOrder="68">
                            <TestName>Protein Pleural</TestName>
                            <TestCode>07A</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList70" msdata:rowOrder="69">
                            <TestName>RCC</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList71" msdata:rowOrder="70">
                            <TestName>RDW</TestName>
                            <TestCode>RDW</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList72" msdata:rowOrder="71">
                            <TestName>Red Cell Count</TestName>
                            <TestCode>RBC</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList73" msdata:rowOrder="72">
                            <TestName>Retic</TestName>
                            <TestCode>RET%</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList74" msdata:rowOrder="73">
                            <TestName>Rotavirus ELISA</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList75" msdata:rowOrder="74">
                            <TestName>Specimen rejection</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList76" msdata:rowOrder="75">
                            <TestName>Stool Appearance</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList77" msdata:rowOrder="76">
                            <TestName>Stool Microscopy</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList78" msdata:rowOrder="77">
                            <TestName>Stool RBC</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList79" msdata:rowOrder="78">
                            <TestName>Stool WBC</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList80" msdata:rowOrder="79">
                            <TestName>Store Aliquot</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList81" msdata:rowOrder="80">
                            <TestName>Streptococcus pneumoniae, BAL</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList82" msdata:rowOrder="81">
                            <TestName>Streptococcus Pneumoniae, PNS</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList83" msdata:rowOrder="82">
                            <TestName>TB culture blood</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList84" msdata:rowOrder="83">
                            <TestName>TB Culture Identification</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList85" msdata:rowOrder="84">
                            <TestName>TB Culture Sputum</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList86" msdata:rowOrder="85">
                            <TestName>TB Culture Sterile fluid</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList87" msdata:rowOrder="86">
                            <TestName>TB LJ Culture</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList88" msdata:rowOrder="87">
                            <TestName>TB MGIT Culture</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList89" msdata:rowOrder="88">
                            <TestName>TB Rapid Test</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList90" msdata:rowOrder="89">
                            <TestName>TB Smear Microscopy(AFB) other</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList91" msdata:rowOrder="90">
                            <TestName>TB Smear Microscopy(AFB) pf</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList92" msdata:rowOrder="91">
                            <TestName>TB Smear Microscopy(AFB) sputum</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList93" msdata:rowOrder="92">
                            <TestName>TB Smear Microscopy(AFB) sterile fluid</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList94" msdata:rowOrder="93">
                            <TestName>TB TLA Culture</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList95" msdata:rowOrder="94">
                            <TestName>TIBC</TestName>
                            <TestCode>TIBC</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList96" msdata:rowOrder="95">
                            <TestName>TPPA FUJIREBIO</TestName>
                            <TestCode>TPPA</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList97" msdata:rowOrder="96">
                            <TestName>Triglycerides</TestName>
                            <TestCode>42B</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList98" msdata:rowOrder="97">
                            <TestName>Urea</TestName>
                            <TestCode>UREA</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList99" msdata:rowOrder="98">
                            <TestName>Urine ACR</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList100" msdata:rowOrder="99">
                            <TestName>Urine albumin</TestName>
                            <TestCode>08M</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList101" msdata:rowOrder="100">
                            <TestName>Urine Creatinine </TestName>
                            <TestCode>03F</TestCode>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList102" msdata:rowOrder="101">
                            <TestName>Urine pregnancy test</TestName>
                        </DynamicList>
                        <DynamicList diffgr:id="DynamicList103" msdata:rowOrder="102">
                            <TestName>WCC </TestName>
                            <TestCode>WBC</TestCode>
                        </DynamicList>
                    </DocumentElement>
                </diffgr:diffgram>
            </GetTestCodesResult>
        </GetTestCodesResponse>
    </soap:Body>
</soap:Envelope>'

    render :text => xml
  end

end
