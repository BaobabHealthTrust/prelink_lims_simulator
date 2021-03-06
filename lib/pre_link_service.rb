require 'savon'

class PreLinkService

  @@config = YAML.load_file(
    "#{Rails.root}/config/prelink.yml"
  ) # rescue {}


  WSDL_URL  = @@config['wsdl_url']
  WSDL_NAMESPACE  = @@config['wsdl_namspace']
  STATION_ID = @@config['station_id']
  PASS_CODE  = @@config['pass_code']

  def initialize

    Savon.configure do |c|
      c.env_namespace = :soap
    end

    @client = Savon::Client.new do |wsdl|
      wsdl.document = WSDL_URL
      wsdl.namespace = WSDL_NAMESPACE
    end

    @soap_header = {'preLinkHeader' => {'StationId' => STATION_ID,
        'PassCode'  => PASS_CODE}}
  end

  def get_test_codes
    
    response = @client.request :get_test_codes

    return nil if response.soap_fault?

    useful_elements = response.to_hash[:get_test_codes_response][:get_test_codes_result][:diffgram][:document_element][:dynamic_list]

    array_of_hashes = useful_elements.map do |test|
      test.reject do |key,value|
        (key != :test_code) and (key != :test_name)
      end
    end
    
    array_of_hashes.inject({}) do |new_hash, array_hash|
      new_hash[array_hash[:test_name]]=array_hash[:test_code]
      new_hash
    end
  end
  
  def get_new_results
    response = @client.request :get_new_results do |soap|
      soap.xml = '<?xml version="1.0" encoding="utf-8"?>
          <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Header>
              <preLinkHeader xmlns="http://www.prelink.co.za/">
                <StationId>' + STATION_ID + '</StationId>
                <PassCode>' + PASS_CODE + '</PassCode>
              </preLinkHeader>
            </soap:Header>
            <soap:Body>
              <GetNewResults xmlns="http://www.prelink.co.za/" />
            </soap:Body>
          </soap:Envelope>'
      
    end

    return nil if response.soap_fault?

    useful_elements = response.to_hash[:get_new_results_response][:get_new_results_result][:diffgram][:document_element][:result]  # [:dynamic_list]

    array_of_hashes = useful_elements.map do |test|
      test.reject do |key,value|
        (key != :request_number) and (key != :result) and (key != :test_unit) and (key != :colour)
      end
    end

  end

  def get_profile_codes
    response = @client.request :get_profile_codes

    return nil if response.soap_fault?

    useful_elements = response.to_hash[:get_profile_codes_response][:get_profile_codes_result][:diffgram][:document_element][:dynamic_list]

    array_of_hashes = useful_elements.map do |test|
      test.reject do |key,value|
        (key != :parent_prifile_id) and (key != :parent_profile_name) and (key != :test_name)
      end
    end

    array_of_hashes.inject({}) do |new_hash, array_hash|
      new_hash[array_hash[:test_name]]=array_hash[:test_code]
      new_hash
    end
  end

  def order_request(options = {})
    response = @client.request :order_request do |soap|
      soap.xml = '<?xml version="1.0" encoding="utf-8"?>
          <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Header>
              <preLinkHeader xmlns="http://www.prelink.co.za/">
                <StationId>' + STATION_ID + '</StationId>
                <PassCode>' + PASS_CODE + '</PassCode>
              </preLinkHeader>
            </soap:Header>
            <soap:Body>
              <OrderRequest xmlns="http://www.prelink.co.za/">
                <dto>
                  <PriorityCode>' + options[:priority_code] + '</PriorityCode>
                  <DateCollected>' + options[:date_collected] + '</DateCollected>
                  <DateReceived>' + options[:date_received] + '</DateReceived>
                  <FolioNumber>' + options[:folio_number] + '</FolioNumber>
                  <PatientFirstName>' + options[:patient_first_name] + '</PatientFirstName>
                  <PatientLastName>' + options[:patient_last_name] + '</PatientLastName>
                  <PatientIdNumber>' + options[:patient_id_number] + '</PatientIdNumber>
                  <PatientAge>' + options[:patient_age] + '</PatientAge>
                  <PatientDateOfBirth>' + options[:patient_date_of_birth] + '</PatientDateOfBirth>
                  <GenderCode>' + options[:gender_code] + '</GenderCode>
                  <DoctorLocationCode>' + options[:doctor_location_code] + '</DoctorLocationCode>
                  <TestCodes>
                    <string>' + options[:test_code1] + '</string>
                    <string>' + options[:test_code2] + '</string>
                  </TestCodes>
                </dto>
              </OrderRequest>
            </soap:Body>
          </soap:Envelope>'

    end

    return nil if response.soap_fault?

  end

  def get_request_results(options = [])
    requests = ""

    options.each{|option|
      requests = requests + "<string>#{option}</string>\n"
    }

    response = @client.request :get_request_results do |soap|
      soap.xml = '<?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Header>
            <preLinkHeader xmlns="http://www.prelink.co.za/">
              <StationId>' + STATION_ID + '</StationId>
              <PassCode>' + PASS_CODE + '</PassCode>
            </preLinkHeader>
          </soap:Header>
          <soap:Body>
            <GetRequestResults xmlns="http://www.prelink.co.za/">
              <requestNumber>' +
                requests +
              '</requestNumber>
            </GetRequestResults>
          </soap:Body>
        </soap:Envelope>'

    end

    return nil if response.soap_fault?

  end


  # [:get_profile_codes, :get_new_results, :order_request, :get_request_results,
  # :get_test_codes, :get_folio_results, :get_results_by_date,
  # :get_prioriy_list, :get_results_from_request_number]

end