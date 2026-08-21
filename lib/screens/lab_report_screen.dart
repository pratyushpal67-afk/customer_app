import 'package:flutter/material.dart';
import '../models/product_model.dart';

class LabReportScreen extends StatelessWidget {
  final ProductModel product;
  const LabReportScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laboratory Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Certificate Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF14532D), Color(0xFF166534)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Icon(Icons.science, size: 40, color: Color(0xFF86EFAC)),
                  SizedBox(height: 6),
                  Text(
                    'AYURTRACE LABORATORY REPORT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 0.8,
                    ),
                  ),
                  Text(
                    'Official Certificate of Analysis (CoA)',
                    style: TextStyle(color: Color(0xFFBBF7D0), fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Demo notice banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFFDE68A)),
              ),
              child: const Text(
                'ℹ️ Prototype Demo Data: Values reflect calibrated mock lab readings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF92400E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 14),

            _buildSectionHeader('🌿 SAMPLE INFORMATION'),
            _buildCard([
              _buildRow('Report ID:', 'LAB-2026-0001'),
              _buildRow('Batch ID:', product.batchId),
              _buildRow('Sample Name:', product.productName),
              _buildRow('Botanical Name:', product.botanicalName),
              _buildRow('Sample Type:', 'Raw Herb / Root Extract'),
              _buildRow('Collection Date:', product.collectionDate),
            ]),
            const SizedBox(height: 14),

            _buildSectionHeader('🧪 LABORATORY INFORMATION'),
            _buildCard([
              _buildRow('Testing Facility:', product.labName),
              _buildRow('Accreditation:', 'NABL / Ministry of Ayush Approved Node'),
              _buildRow('Report Date:', product.labVerificationDate),
              _buildRow('Report Status:', '🟢 VERIFIED'),
            ]),
            const SizedBox(height: 14),

            _buildSectionHeader('📊 PARAMETER TEST RESULTS'),
            _buildCard([
              _buildTestResultRow('Species Authentication', 'Withania somnifera', isPass: true),
              _buildTestResultRow('Moisture Content', '${product.moisturePercent}% (Limit < 8.0%)', isPass: true),
              _buildTestResultRow('Heavy Metals (Pb/As)', '${product.heavyMetalsPpm} ppm (Limit < 10 ppm)', isPass: true),
              _buildTestResultRow('Pesticide Residue', 'Not Detected (ND)', isPass: true),
              _buildTestResultRow('Other Required Tests', 'Compliant with Pharmacopoeia', isPass: true),
            ]),
            const SizedBox(height: 14),

            // Overall Result Banner
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                border: Border.all(color: const Color(0xFF86EFAC)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified, color: Color(0xFF15803D), size: 24),
                  SizedBox(width: 8),
                  Text(
                    'OVERALL RESULT: QUALITY VERIFIED',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF15803D),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Document Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening Certificate on IPFS (CID: QmXo...6uco)...')),
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf, color: Color(0xFF14532D)),
                    label: const Text('📄 VIEW REPORT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Downloading official PDF Certificate of Analysis...')),
                      );
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('⬇️ DOWNLOAD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF14532D),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 2.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF14532D)),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 11)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildTestResultRow(String parameter, String value, {required bool isPass}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(parameter, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
                Text(value, style: const TextStyle(color: Colors.black54, fontSize: 9.5)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: isPass ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              isPass ? '🟢 PASS' : '🔴 FAIL',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isPass ? const Color(0xFF166534) : const Color(0xFF991B1B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}