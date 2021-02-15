require 'rails_helper'

TEST_FILES = ["20013877.pdf",
 "20016657.pdf",
 "20016866.pdf",
 "20016722.pdf",
 "20015054.pdf",
 "20016214.pdf",
 "20016736.pdf",
 "20013885.pdf",
 "20016445.pdf",
 "20016799.pdf",
 "20016546.pdf"].freeze

describe Scraper do
    describe "#read_pdf" do
        let(:subject) { Scraper.new }

        context 'the first pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[0]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq('Hon. Mikie Sherrill')
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('NJ11')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(21)
                expect(assets).to match_array([["american Express Company (aXP) [ST]", "S", "Unknown", "12/23/2019", "497.08"],
                ["BlackRock, Inc. (BlK)[ST]", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["Bristol-Myers Squibb CompanS (BMY) [ST]", "Unknown", "Unknown", "12/18/2019", "1001-15000"],
                ["Colgate-Palmolive Company (Cl) [ST]", "S", "Unknown", "12/12/2019", "1001-15000"],
                ["DuPont de Nemours, Inc. (DDS [ST] FIlINSTaT: New", "Unknown", "Unknown", "12/18/2019", "1001-15000"],
                ["Exxon Mobil Corporation (XOS) [ST]", "Unknown", "Unknown", "12/18/2019", "1001-15000"],
                ["general Dynamics CorporatioS (gD) [ST]", "Unknown", "Unknown", "12/18/2019", "1001-15000"],
                ["gilead Sciences, Inc. (gIlD)[STS", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["M&T Bank Corporation (MTB) [ST]", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["Pfizer, Inc. (PFE)[ST]", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["Philip Morris International IncS (PM)[ST]", "Unknown", "Unknown", "12/18/2019", "1001-15000"],
                ["Prudential Financial, Inc. (PRu) [ST]", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["QualCOMM Incorporated (QCOM)[ST]", "S", "Unknown", "12/23/2019", "443.07"],
                ["QualCOMM Incorporated (QCOM)[ST]", "S", "Unknown", "12/27/2019", "442.93"],
                ["QualCOMM Incorporated (QCOM)[ST]", "S", "Unknown", "12/30/2019", "614.71"],
                ["Regeneron Pharmaceuticals, Inc.S (REgN) [ST]", "Unknown", "Unknown", "12/12/2019", "1001-15000"],
                ["Roche Holdings ag Basel american Depositary Shares (RHHBY) [ST]", "P", "Unknown", "01/02/2020", "1001-15000"],
                ["Schlumberger N.V. (SlB)[ST]", "S", "Unknown", "12/12/2019", "1001-15000"],
                ["SEI Investments Company (SEIC)", "S", "Unknown", "12/12/2019", "1001-15000"],
                ["Ventas, Inc. (VTR)[ST]", "S", "Unknown", "12/18/2019", "1001-15000"],
                ["Vornado Realty Trust (VNO)[STS", "S", "Unknown", "12/18/2019", "1001-15000"]])
            end
        end
        context 'the second pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[1]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Steve Cohen")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('TN09')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(7)
                expect(assets).to match_array([["berkshire Hathaway Inc. NewS (bRK.b) [ST]", "Unknown", "Unknown", "05/07/2020", "1001-15000"],
                ["Chevron Corporation (CVX)[SS]", "S", "Unknown", "05/07/2020", "1001-15000"],
                ["Coca-Cola Company (KO)[ST]", "S", "Unknown", "05/07/2020", "1001-15000"],
                ["First Horizon National Corporation (FHN) [ST]", "S", "Unknown", "05/07/2020", "1001-15000"],
                ["Healthpeak Properties, Inc.S (PEAK)[ST]", "Unknown", "Unknown", "05/07/2020", "1001-15000"],
                ["Schlumberger N.V. (Slb)[ST]S", "S", "Unknown", "05/07/2020", "1001-15000"],
                ["Walt disney Company (dISST]S", "S", "Unknown", "05/07/2020", "1001-15000"]])
            end
        end

        context 'the third pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[2]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. David B. McKinley")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('WV01')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(3)

                expect(assets).to match_array([["Estee lauder Companies, Inc. (ElS)(pa06/01/2020 [ST]",
                                                "S (partial)",
                                                "Unknown",
                                                "06/30/2020",
                                                "1001-15000"],
                                                ["Roper Technologies, Inc. (S (partial)06/01/2020 [ST]",
                                                "S (partial)",
                                                "Unknown",
                                                "06/30/2020",
                                                "1001-15000"],
                                                ["Tractor Supply Company (TSS (partial)06/01/2020 [ST]",
                                                "S (partial)",
                                                "Unknown",
                                                "06/30/2020",
                                                "1001-15000"]]
                                                )
            end
        end

        context 'the fourth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[3]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Bob Gibbs")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('OH07')
            end

            it 'parses the asset values' do
                expect(assets.first).to eq(["Energy Transfer PartnersP L.P. Common Units representing limited partner interests (ETP) [ST] FILISTaT: New", "Unknown", 'Unknown', "05/19/2020", "1001-1500"])
            end
        end

        context 'the fifth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[4]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Greg Gianforte")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('MT00')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(51)

                expect(assets).to match_array([["JT adidas aG Sponsored adR (addYY) [ST]", "S", "JT", "02/13/2020", "15001-50000"],
                    ["JT aIa Group, Ltd. Sponsored american depository Receipt (aaGIY) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT alfa-Laval ab unsponsored adR (aLFVY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT amadeus IT Holding Sa unsponsored american depository Shares (aMadY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT ambev S.a. american depositaPy Shares (abEV)[ST]", "Unknown", "JT", "01/13/2020", "50001-100000"],
                    ["JT atlas Copco ab Sponsored adRS repstg Class (aTLKY)[ST]", "Unknown", "JT", "01/13/2020", "15001-50000"],
                    ["JT baidu, Inc. american depositaryS Shares, each representing one tenth Class ordinary share (bId[S)", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT banco bilbao Vizcaya argentaria S.a. (bbVa)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Canadian National Railway Company (CNI)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Check Point Software Technologies Ltd. Ordinary Shares (CHKP)", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT China Mobile Limited (CHLST]", "P", "JT", "01/13/2020", "100001-250000"],
                    ["JT Chugai Pharmaceutical Ltd unsponsored adR (CHGCY)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT dassault Systemes, S.a. americanP depositary Shares (daSTY)[ST]", "Unknown", "JT", "01/14/2020", "15001-50000"],
                    ["JT dbs Group Holdings Ltd Ord american depositary Shares (dbSdY) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT dentsu Inc Tokyo unsponsored adR (dNTuY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT diageo plc (dEO)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT EPIROC aKTIEbOLaG adR [OT]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Fanuc Corporation unsponsored adR(FaNuY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Fomento Economico Mexicano S.a.b. de C.V. (FMX)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Fuchs Petrolub SE unsponsored american depository ReceiptRepresenting Preferenced", "S", "JT", "01/13/2020", "50001-100000"],
                    ["JT HdFC bank Limited (HdbST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT HSbC Holdings, plc. (HSbC)[ST]", "P", "JT", "01/13/2020", "250001-500000"],
                    ["JT ICICI bank Limited (IbN[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Infineon Technologies aG (IFNNY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Itau unibanco banco Holding Sa american depositary Shares (ITub) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Komatsu Ltd Ord american depositary Shares (KMTuY)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Kubota Corporation (KubTY)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT L'air Liquide Ord american depositary Shares (aIQuY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Linde plc Ordinary Share (LIN) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Lonza Group ag Zuerich unsponsored adR (LZaGY)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT L'Oreal Co. american depositary Shares (LRLCY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Lukoil Co Sponsored adR", "P", "JT", "01/13/2020", "15001"],
                    ["JT Nestle Sa Sponsored adR representing Registered Shares Series (NSRGY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Novozymes a/S unsponsored american depositary Receipt (NVZMY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT OrthoPediatrics Corp. (KIdS)[ST]P", "P", "JT", "01/15/2020", "50001-100000"],
                    ["JT Ping an Insurance (PNGaYST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Rio Tinto Plc (RIO)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Roche Holdings aG basel american depositary Shares (RHHbY)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Royal dutch Shell PLC Royal dutch Shell PLC american depositary Shares (RdS.b)[ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Sasol Ltd. american depositary Shares(SSL) [ST]", "P", "JT", "01/13/2020", "50001-100000"],
                    ["JT Schlumberger N.V. (SLb)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Schneider Electric SE unsponsored adR(SbGSY) [ST]", "P", "JT", "01/14/2020", "15001-50000"],
                    ["JT SGSSaadR(SGSOY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Sonova Holding aG unsponsored adR(SONVY) [ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Symrise ag unsponsored adR (SYIEY) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Sysmex Corporation unsponsored adR(SSMXY) [ST]", "S", "JT", "01/13/2020", "15001-50000"],
                    ["JT Taiwan Semiconductor Manufacturing Company Ltd.", "S", "JT", "01/13/2020", "50001-100000"],
                    ["JT Tencent Holdings Limited unsponsored adR Representing Shares (TCEHY)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT unicharm Corp Sponsored adR (uNICY) [ST]", "P", "JT", "01/13/2020", "100001-250000"],
                    ["JT unilever PLC (uL)[ST]", "P", "JT", "01/13/2020", "15001-50000"],
                    ["JT Yandex N.V. Class OrdinaryP Shares (YNdX)[ST]", "Unknown", "JT", "01/13/2020", "15001-50000"]]
                    )
            end
        end
        context 'the sixth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[5]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Alan S. Lowenthal")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('CA47')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(11)

                expect(assets).to match_array([["SP Boeing Company (BA)[ST] (partial)", "S", "SP", "03/05/2020", "525.99"],
                    ["SP Cisco Systems, Inc. (CSCO)[ST]", "Unknown", "SP", "02/19/2020", "1001-15000"],
                    ["SP ProShares Short S&P500 (SH)P [ST]", "Unknown", "SP", "02/27/2020", "354.20"],
                    ["SP Sunrun Inc. (RuN)[ST] (partial)", "S", "SP", "02/25/2020", "84.48"],
                    ["SP Sunrun Inc. (RuN)[ST] (partial)", "S", "SP", "02/26/2020", "84.39"],
                    ["SP Sunrun Inc. (RuN)[ST] (partial)", "S", "SP", "02/27/2020", "104.25"],
                    ["SP T-Mobile uS, Inc. (TMuS)[STP", "P", "SP", "03/04/2020", "369.93"],
                    ["SP Virgin galactic Holdings, Inc.S (partial) (SPCE) [ST]", "S (partial)", "SP", "03/06/2020", "43.99"],
                    ["SP Virgin galactic Holdings, Inc.S (partial) (SPCE) [ST]", "S (partial)", "SP", "02/20/2020", "160.94"],
                    ["SP Virgin galactic Holdings, Inc.S (partial) (SPCE) [ST]", "S (partial)", "SP", "02/18/2020", "190.89"],
                    ["SP Vivint Solar, Inc. (VSLR)[ST] (partial)", "S", "SP", "02/20/2020", "768.29"]])
            end
        end

        context 'the seventh pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[6]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. David E. Price")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('NC04')
            end

            it 'parses the asset values' do
                expect(assets.length).to eq(1)
                expect(assets.first).to eq(["uNC asheville general RevenueP Bonds[Cs] FIlIsTaT: New", "Unknown", "Unknown", "06/02/2020", "1001-1500"])
            end
        end

        context 'the eigth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[7]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Bill Flores")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('TX17')
            end

            it 'parses the asset values' do
                expect(assets.count).to eq(3)

                expect(assets).to match_array([["Hyatt Hotels Corp Notes; 4.85%[Cs]", "P", "Unknown", "12/06/2019", "50001-100000"],
                    ["salient MlP Fund [HN]", "Unknown", "Unknown", "12/31/2019", "100001-250000"],
                    ["superior Energy services,PInc. (sPN) [sT] IlINTaTu: New", "Unknown", "Unknown", "12/19/2019", "1001-15000"]])
            end
        end
        context 'the ninth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[8]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Susan W. Brooks")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('IN05')
            end

            it 'parses the asset values' do
                expect(assets.count).to eq(12)

                expect(assets).to match_array([["Amazon.com, Inc. (AMZN)[ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Apple Inc. (AAPl)[ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Chevron Corporation (CVX)[STP FIlISTATu: New", "Unknown", "Unknown", "04/06/2020", "1001-15000"],
                ["Coca-Cola Company (KO)[ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["delta Air lines, Inc. (dAlSTP", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Exxon Mobil Corporation (XOMP [ST]", "Unknown", "Unknown", "04/06/2020", "1001-15000"],
                ["general Electric Company (gEP", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Mastercard Incorporated (MA) [ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Microsoft Corporation (MSFT) [ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["QuAlCOMM Incorporated (QCOM)[ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Verizon Communications Inc. (VZ) [ST]", "P", "Unknown", "04/06/2020", "1001-15000"],
                ["Walt disney Company (dISST]", "P", "Unknown", "04/06/2020", "1001-15000"]])
            end
        end

        context 'the tenth pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[9]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Gerald E. Connolly")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('VA11')
            end

            it 'parses the asset values' do
                expect(assets.count).to eq(2)
                expect(assets).to match_array([["JT Procter Gamble Company (partial)01/14/2020 [ST]", "S", "JT", "02/15/202$1,001", "1001-15000"],
                ["JT Walt Disney Company (DISSS (partial)01/14/2020", "S (partial)", "JT", "02/15/202$1,001", "1001-15000"]])
            end
        end

        context 'the eleventh pdf file' do 
            let(:parsed_data) { subject.read_pdf(TEST_FILES[10]) }
            let(:assets) { parsed_data[:assets] }

            it 'parses the name for the first test file' do
                expect(parsed_data[:name]).to eq("Hon. Suzan K. DelBene")
            end

            it 'parses the district for the first test file' do
                expect(parsed_data[:district]).to eq('WA01')
            end

            it 'parses the asset values' do
                expect(assets.count).to eq(2)
                expect(assets.first).to eq(["JT Florida ST Constr Ref BDP Ser. 2016 5.00% Due FIlISTaT: New", 'Unknown', "JT", "04/28/2020", "15001-50000"])
                expect(assets[1]).to eq(["JT Florida ST Constr Ref BDP Ser. 2016 5.00% Due", 'Unknown', "JT", "04/07/2020", "15001-50000"])
            end
        end
    end
end