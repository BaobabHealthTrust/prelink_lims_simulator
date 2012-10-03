class WelcomeController < ApplicationController
  def index
    @readme = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @readme = @readme.render File.read(Rails.root + 'README.md')
  end

  def order_request

    @codes = {
      "FNA Gram Stain" => ["Gram GNB","Gram GNC","Gram GNCB","Gram GNDC","Gram GPB",
        "Gram GPC","Gram GPDC","Gram NOS","Gram YEA"],
      "Liver Enzymes" => ["Alkaline Phosphatase","ALT","AST","GGT","LDH"],
      "Urine Microscopy" => ["Schistosomiasis","Trichomonas Vaginalis","Urine RBC",
        "Urine WBC","Yeast Cells"],
      "U&Es (Urea & Electrolytes, renal function)" => ["Calcium","Chloride","CO2 ","NA",
        "Potassium","Urea"],
      "Bilirubin profile" => ["Bilirubin Direct","Bilirubin Indirect","Bilirubin Total"],
      "CSF CHEM" => ["CSF Glucose","CSF micro-protein"],
      "BC Adult" => ["BCULT ADULT"],
      "Mycobacterial blood culture" => ["Mycobacterial BC","Mycobacterial BC Time"],
      "Stool M&C" => ["Cryptosporidium oocysts","Stool Appearance"],
      "HIV DNA PCR" => ["HIV DNA PCR","HIV DNA PCR Confirmatory"],
      "Lipogram" => ["Cholesterol","HDL Cholesterol","LDL Cholesterol","Triglycerides"],
      "Malaria Thin film" => ["Blood parasite (non-Malaria)",
        "Mal P falciparum gametocyte parasitaemia","Mal P falciparum gametocytes",
        "Mal P falciparum merozoites","Mal P falciparum schizonts",
        "Mal P falciparum troph count per 200 WBCs","Mal P falciparum trophs",
        "Mal P falciparum trophs/microL (RBC)","Mal P falciparum trophs/microL (WBC)",
        "Mal P falciparum trophs/500 RBCs","Mal P Malariae gametocytes",
        "Mal P Malariae merozoites","Mal P Malariae schizonts","Mal P Malariae trophs",
        "Mal P Ovale gametocytes","Mal P Ovale merozoites","Mal P Ovale schizonts",
        "Mal P Ovale trophs","Mal P Vivax gametocytes","Mal P Vivax merozoites",
        "Mal P Vivax schizonts","Mal P Vivax trophs"],
      "CSF MC&S Procedure" => ["Appearance","CSF Indian Ink","Gram"],
      "CD4 (FACSCount)" => ["CD4 Absolute","CD4/CD8","CD8 Absolute","Total CD3 Average"],
      "Calcium" => ["Albumin","Calcium"],
      "TB Microscopy & Culture" => ["TB Culture Identification","TB Culture Sputum",
        "TB Smear Microscopy(AFB) sputum"],
      "BC Paediatric" => ["BCULT blood weight","BCULT bottle weight Post",
        "BCULT bottle weight Pre","BCULT PAED","BCULT Paeds BC bottle label"],
      "CDC Flu" => ["CDC FLU A ","CDC FLU B","CDC H1N1 sw","CDC H5N1"],
      "Malaria Thick Screen" => ["Malaria Thick Film","Thick Smear Parasitaemia"],
      "Pleural fluid M,C&S procedure" => ["Appearance","Glucose Pleural fluid","Gram","Protein Pleural"],
      "Syphilis serology" => ["TPPA FUJIREBIO"],
      "U&E and Creatinine" => ["Creatinine"],
      "Micro Other" => ["B-LACT","ESBL"],
      "LEUKOCYTE MORPHOLOGY WORKSHEET" => ["LM Basophils Abs","LM Comment",
        "LM Eosinophils Abs","LM Epithelial Cells/HPF","LM Erythrocyte Cells/HPF",
        "LM Lymphocytes Abs","LM Macro Abs","LM Neutrophils Abs"],
      "AFB Profile" => ["TB Smear Microscopy(AFB) sputum"],
      "RPR" => ["RPR (TITRE)","RPR QUAL"],
      "Selective salmonella culture, BM" => ["ESBL","MIC CIP"],
      "Total Protein" => ["Albumin","Protein Total"],
      "Selective Salmonella Culture, HS" => ["ESBL","MIC CIP"],
      "TSH,FT4" => ["Free T4","TSH"],
      "Microscopy" => ["Lymphs","Polymorphs","RCC","WBC"],
      "CT/NG Abbott" => ["CT Abbott PCR","NG Abbott PCR"],
      "Electrolytes" => ["Chloride","CO2 ","NA","Potassium"],
      "CD4 Profile" => ["CD 45","CD4 %","CD4 - bead events","CD4 Aq Time",
        "CD4 Bead count","CD4 CHECK0","CD4 CHECK1","CD4 CHECK2","CD4 COLCOMP",
        "CD4 color","CD4 Count","CD4/CD8","CD8 %","CD8 Count"],
      "Gram Stain" => ["Gram GNB","Gram GNC","Gram GNCB","Gram GNDC","Gram GPB",
        "Gram GPC","Gram GPDC","Gram NOS","Gram YEA"],
      "BM GRAM" => ["BM Gram GNB","BM Gram GNC","BM Gram GNCB","BM Gram GNDC",
        "BM Gram GPB","BM Gram GPC","BM Gram GPDC","BM Gram YEA"],
      "FTD Resp." => ["Adenovirus","Bocavirus","C.pneumoniae","CorHKU","CoronaVirus 229",
        "CoronaVirus 43","CoronaVirus 63","Enterovirus","FTD Bordetella","FTD CMV",
        "FTD FLU A","FTD FLU B","FTD FLU C","FTD H1N1 sw","FTD Haem inf sp",
        "FTD K. pneumo","FTD Legionella","FTD Moraxella","FTD PCP","FTD Salmonella",
        "H.Influenzae B","M.pneumoniae","Metapneumo","Paraflu1","ParaFlu2","ParaFlu3",
        "ParaFlu4","Parechovirus","Rhinovirus","RSV","S.aureus","S.pneumoniae PCR"],
      "LEUKOCYTE MORPHOLOGY PROFILE" => ["LM Basophils %","LM Basophils Abs",
        "LM Comment","LM Eosinophils %","LM Eosinophils Abs","LM Epithelial Cells/HPF",
        "LM Erythrocyte Cells/HPF","LM Lymphocytes %","LM Lymphocytes Abs","LM Macro %",
        "LM Macro Abs","LM Neutrophils %","LM Neutrophils Abs"],
      "LFT" => ["ALT","AST","Bilirubin Direct","Bilirubin Total","GGT"],
      "BCULT GRAM" => ["BCULT Gram GNB","BCULT Gram GNC","BCULT Gram GNCB",
        "BCULT Gram GNDC","BCULT Gram GPB","BCULT Gram GPC","BCULT Gram GPDC","BCULT Gram YEA"],
      "FBC (Full Blood Count)" => ["Basophils#","Basophils%","Eosinophils#","Eosinophils%",
        "Haematocrit","Haemoglobin","Lymphocytes#","Lymphocytes%","MCH","MCHC","MCV",
        "Monocytes#","Monocytes%","MPV","Neutrophils#","Neutrophils%","Platelets",
        "RDW","Red Cell Count","WCC "],
      "Gene Xpert" => ["Gene Xpert MTB sputum","Gene Xpert Rif sputum"],
      "HbA1c" => ["Haemoglobin A1c (CX5)","Haemoglobin Hb (CX5)","HbA1c (IFCC)","HbA1c (NGSP)"],
      "Micro Other MC&S Procedure" => ["Appearance","Gram"],
      "Hepatitis screen" => ["Hepatitis B Surface Antigen (RT)","Hepatitis C  (RT)"],
      "Manual Differential" => ["Basophils#","Basophils%","Blasts#","Blasts%","Eosinophils#",
        "Eosinophils%","Lymphocytes#","Lymphocytes%","Metamyelocytes %","Metamyelocytes#",
        "Monocytes#","Monocytes%","Myelocytes#","Myelocytes%","Neutrophils#",
        "Neutrophils%","Promyelocytes %","Promyelocytes#","Stab#","Stab%","WCC Man"],
      "Selective Salmonella culture, stool" => ["ESBL","MIC CIP"]}

  end

  def create
    LabOrder.create(
        :request_number => params["RequestNumber"],
        :priority_code => params["PriorityCode"],
        :date_collected => params["DateCollected"],
        :date_received => params["DateReceived"],
        :test_code => params["TestCode"],
        :result => params["Result"],
        :date_result_received => params["DateResultReceived"],
        :test_range => params["Range"],
        :test_unit => params["TestUnit"],
        :colour => params["Colour"]
      )

    redirect_to :view and return
  end
  
  def view
    @orders = LabOrder.find(:all) rescue []
  end

end
