import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class AddCarBottomSheet extends StatefulWidget {
  const AddCarBottomSheet({super.key});

  @override
  State<AddCarBottomSheet> createState() => _AddCarBottomSheetState();
}

class _AddCarBottomSheetState extends State<AddCarBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBrand;
  String? _selectedModel;
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: ColorManager.primary,
                ),
                title: Text(
                  S.of(context).camera,
                  style: AppStyles.textStyle16Medium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: ColorManager.primary,
                ),
                title: Text(
                  S.of(context).gallery,
                  style: AppStyles.textStyle16Medium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Premium Golden Gradient for Header and Button
    const goldenGradient = LinearGradient(
      colors: [ColorManager.accent, Color(0xFFF2D59B)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  S.of(context).addCar,
                  style: AppStyles.textStyle24Bold.copyWith(
                    color: ColorManager.textDark,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Car Image
              Center(
                child: GestureDetector(
                  onTap: _showImagePickerOptions,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: ColorManager.lightBackground,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ColorManager.accent.withValues(alpha: 0.5),
                        width: 2,
                      ),
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: _selectedImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_a_photo_outlined,
                                size: 40,
                                color: ColorManager.accent,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                S.of(context).uploadImage,
                                style: AppStyles.textStyle12Regular.copyWith(
                                  color: ColorManager.textSecondary,
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Brand Dropdown
              _buildDropdown(
                context,
                label: S.of(context).carType,
                hint: S.of(context).selectCarType,
                value: _selectedBrand,
                items: ['Toyota', 'Ford', 'Hyundai', 'BMW', 'Mercedes'],
                onChanged: (value) => setState(() => _selectedBrand = value),
              ),
              const SizedBox(height: 16),

              // Model Dropdown
              _buildDropdown(
                context,
                label: S.of(context).carModel,
                hint: S.of(context).selectCarModel,
                value: _selectedModel,
                items: [
                  'Camry',
                  'Corolla',
                  'Explorer',
                  'Sonata',
                  'X5',
                  'C-Class',
                ],
                onChanged: (value) => setState(() => _selectedModel = value),
              ),
              const SizedBox(height: 16),

              // Color TextField
              _buildTextField(
                context,
                controller: _colorController,
                label: S.of(context).carColor,
                hint: S.of(context).enterCarColor,
              ),
              const SizedBox(height: 16),

              // Plate TextField
              _buildTextField(
                context,
                controller: _plateController,
                label: S.of(context).plateNumber,
                hint: S.of(context).enterPlateNumber,
              ),
              const SizedBox(height: 30),

              // Add Button
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: goldenGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.accent.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to add car would go here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    S.of(context).add,
                    style: AppStyles.textStyle16Medium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.textStyle14Regular.copyWith(
            color: ColorManager.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: ColorManager.lightBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              hint: Text(
                hint,
                style: AppStyles.textStyle14Regular.copyWith(
                  color: Colors.grey,
                ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorManager.primary,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppStyles.textStyle14Regular.copyWith(
                      color: ColorManager.textDark,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.textStyle14Regular.copyWith(
            color: ColorManager.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.lightBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppStyles.textStyle14Regular.copyWith(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: AppStyles.textStyle14Regular.copyWith(
              color: ColorManager.textDark,
            ),
          ),
        ),
      ],
    );
  }
}
