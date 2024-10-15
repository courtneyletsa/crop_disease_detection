import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:crop_doctor/constants/app_constants.dart';
import 'package:crop_doctor/models/license.dart';
import 'package:crop_doctor/widgets/loading_widget.dart';
import 'package:crop_doctor/widgets/scaffold_wrapper.dart';
import 'package:crop_doctor/widgets/staggered_animation_wrapper.dart';

class LegalScreen extends StatefulWidget {
  const LegalScreen({super.key});

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  late Future<List<License>> licenseFuture;

  Future<List<License>> loadLicenses() async {
    List<License> licenses = await LicenseRegistry.licenses.asyncMap<License>((license) async {
      final title = license.packages.join(', ');
      final text = license.paragraphs.map<String>((paragraph) => paragraph.text).join('\n\n');
      return License(title: title, text: text);
    }).toList();

    licenses.sort((a, b) => a.title.compareTo(b.title));

    return licenses;
  }

  @override
  void initState() {
    super.initState();
    licenseFuture = loadLicenses();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar.large(
              title: Text('Application Licenses'),
            ),
          ];
        },
        body: FutureBuilder<List<License>>(
          future: licenseFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    License license = snapshot.data![index];
                    return StaggeredAnimationBuilderWrapper(
                      index: index,
                      child: ExpansionTile(
                        expansionAnimationStyle: AppConstants.expansionTileAnimationStyle,
                        title: Text(license.title),
                        children: [
                          ListTile(
                            dense: true,
                            subtitle: Text(license.text),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }

            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
