import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/features/static/presentation/views/widgets/static_header.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Center(
              child: SingleChildScrollView(
                child: Container(
                  width: isTablet ? 800 : double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StaticHeader(title: S.of(context).aboutUsTitle),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).aboutUsDescription,
                        style: AppStyles.textStyle16Medium.copyWith(
                          color: ColorManager.textSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Divider(color: ColorManager.border),
                      const SizedBox(height: 32),

                      // Story Section
                      _SectionTitle(
                        title: S.of(context).ourStoryTitle,
                        subtitle: S.of(context).ourStorySubtitle,
                      ),
                      const SizedBox(height: 16),
                      _Paragraph(text: S.of(context).ourStoryParagraph1),
                      const SizedBox(height: 8),
                      _Paragraph(text: S.of(context).ourStoryParagraph2),
                      const SizedBox(height: 8),
                      _Paragraph(text: S.of(context).ourStoryParagraph3),

                      const SizedBox(height: 32),

                      // Stats Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: isTablet
                            ? 4
                            : 2, // 4 columns on tablet, 2 on mobile
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: isTablet
                            ? 1.0
                            : 1.2, // Adjust ratio for tablet items
                        children: [
                          _StatCard(
                            number: '500+',
                            label: S.of(context).statHappyCustomers,
                            icon: Icons.people_outline,
                          ),
                          _StatCard(
                            number: '50+',
                            label: S.of(context).statServicesAvailable,
                            icon: Icons.design_services_outlined,
                          ),
                          _StatCard(
                            number: '15+',
                            label: S.of(context).statExpertTechnicians,
                            icon: Icons.engineering_outlined,
                          ),
                          _StatCard(
                            number: '4+',
                            label: S.of(context).statYearsExperience,
                            icon: Icons.workspace_premium_outlined,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),
                      const Divider(color: ColorManager.border),
                      const SizedBox(height: 32),

                      // Why Us
                      _SectionTitle(
                        title: S.of(context).whyUsTitle,
                        subtitle: S.of(context).whyUsSubtitle,
                      ),
                      const SizedBox(height: 16),
                      _FeatureItem(
                        title: S.of(context).featureWarrantyTitle,
                        description: S.of(context).featureWarrantyDesc,
                        icon: Icons.verified_user_outlined,
                      ),
                      _FeatureItem(
                        title: S.of(context).featureSpeedTitle,
                        description: S.of(context).featureSpeedDesc,
                        icon: Icons.timer_outlined,
                      ),
                      _FeatureItem(
                        title: S.of(context).featureTeamTitle,
                        description: S.of(context).featureTeamDesc,
                        icon: Icons.group_outlined,
                      ),

                      const SizedBox(height: 40),

                      // Call To Action
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              S.of(context).ctaTitle,
                              style: AppStyles.textStyle24Bold.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              S.of(context).ctaDesc,
                              style: AppStyles.textStyle16Medium.copyWith(
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  } else {
                                    context.go(AppRouter.kHomeView);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.accent,
                                  foregroundColor: ColorManager.primary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).browseServices,
                                  style: AppStyles.textStyle16Medium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle24Bold.copyWith(
            color: ColorManager.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.accent,
          ),
        ),
      ],
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;
  const _Paragraph({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.textStyle16Medium.copyWith(
        color: ColorManager.textDark.withValues(alpha: 0.8),
        height: 1.6,
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ColorManager.accent, size: 28),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              number,
              style: AppStyles.textStyle24Bold.copyWith(
                color: ColorManager.primary,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: AppStyles.textStyle14Regular.copyWith(
                  color: ColorManager.textSecondary,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: ColorManager.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.textStyle16Medium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppStyles.textStyle14Regular.copyWith(
                    color: ColorManager.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
