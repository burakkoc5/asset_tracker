import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/features/settings/application/settings_cubit.dart';
import 'package:asset_tracker/features/settings/domain/app_settings.dart';
import 'package:asset_tracker/features/settings/presentation/widgets/settings_radio_tile.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    context.read<SettingsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.general.settings,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerHighest.withOpacity(0.3)
              ],
            ),
          ),
          child: ListView(
            padding: Paddings.md.all,
            children: [
              _buildSectionTitle(context, t.settings.appearance),
              _buildThemeSelector(context),
              Paddings.lg.vertical,
              _buildSectionTitle(context, t.settings.language),
              _buildLanguageSelector(context),
              Paddings.lg.vertical,
              _buildSectionTitle(context, t.settings.about),
              _buildAboutCard(context),
              Paddings.lg.vertical,
              _buildSectionTitle(context, t.settings.account),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Padding(
      padding: Paddings.sm.only(bottom: true),
      child: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, state) {
        return SettingsRadioGroup<ThemeMode>(
          groupValue: state.themeMode,
          onChanged: (value) {
            if (value != null) {
              context.read<SettingsCubit>().setThemeMode(value);
            }
          },
          options: [
            SettingsRadioOption(
              title: t.settings.systemTheme,
              subtitle: t.settings.systemThemeDesc,
              value: ThemeMode.system,
            ),
            SettingsRadioOption(
              title: t.settings.lightTheme,
              subtitle: t.settings.lightThemeDesc,
              value: ThemeMode.light,
            ),
            SettingsRadioOption(
              title: t.settings.darkTheme,
              subtitle: t.settings.darkThemeDesc,
              value: ThemeMode.dark,
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, state) {
        return SettingsRadioGroup<AppLocale>(
          groupValue: state.locale,
          onChanged: (value) {
            if (value != null) {
              context.read<SettingsCubit>().setLocale(value);
            }
          },
          options: const [
            SettingsRadioOption(
              title: 'Türkçe',
              value: AppLocale.tr,
            ),
            SettingsRadioOption(
              title: 'English',
              value: AppLocale.en,
            ),
          ],
        );
      },
    );
  }

  Widget _buildAboutCard(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.md.all,
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: Paddings.md.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.info_outline,
                color: theme.colorScheme.primary,
              ),
              title: const Text('Asset Tracker'),
              subtitle: Text("${t.general.version} 1.0.0"),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.code,
                color: theme.colorScheme.primary,
              ),
              title: Text(t.general.developer),
              subtitle: const Text('Burak Koç - Flutter Camp'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.md.all,
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: Paddings.md.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                t.registration.signOut.signOutText,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.logout,
                color: theme.colorScheme.error,
              ),
              onTap: () {
                context.read<AuthenticationCubit>().signout();
                context.router.replaceAll([const RegistrationRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
