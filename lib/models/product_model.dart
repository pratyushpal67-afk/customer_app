class ProductModel {
  final String batchId;
  final String productName;
  final String botanicalName;
  final String productType;
  final String mfgDate;
  final String origin;
  final String collectionDate;
  final String collectorStatus;
  final double rawQuantityKg;
  final double processedQuantityKg;
  final String processingDate;
  final String labName;
  final String labVerificationDate;
  final double moisturePercent;
  final double heavyMetalsPpm;
  final String manufacturerName;
  final String licenseNumber;
  final String txHash;

  const ProductModel({
    required this.batchId,
    required this.productName,
    required this.botanicalName,
    required this.productType,
    required this.mfgDate,
    required this.origin,
    required this.collectionDate,
    required this.collectorStatus,
    required this.rawQuantityKg,
    required this.processedQuantityKg,
    required this.processingDate,
    required this.labName,
    required this.labVerificationDate,
    required this.moisturePercent,
    required this.heavyMetalsPpm,
    required this.manufacturerName,
    required this.licenseNumber,
    required this.txHash,
  });

  static ProductModel mockAshwagandha() {
    return const ProductModel(
      batchId: 'ASH-2026-001',
      productName: 'Ashwagandha Powder',
      botanicalName: 'Withania somnifera',
      productType: 'Standardized Extract Powder',
      mfgDate: '20 August 2026',
      origin: 'Hooghly Forest Block, West Bengal',
      collectionDate: '20 August 2026',
      collectorStatus: '✓ Registered Collector (COL-01)',
      rawQuantityKg: 25.0,
      processedQuantityKg: 20.0,
      processingDate: '20 August 2026',
      labName: 'AYUR Quality Lab Node',
      labVerificationDate: '20 August 2026',
      moisturePercent: 5.4,
      heavyMetalsPpm: 2.1,
      manufacturerName: 'ABC Ayurveda Ltd.',
      licenseNumber: 'AYUSH-MFG-WB-2026-991',
      txHash: '0x8F3A91C2...77E1',
    );
  }
}