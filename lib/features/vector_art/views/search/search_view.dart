import 'package:colartive2/core_packages.dart';
import 'package:colartive2/utils/components/fields/custom_text_form_field.dart';
import 'package:colartive2/utils/components/scaffolds/sliver_base_scaffold.dart';
import 'package:ionicons/ionicons.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverBaseScaffold(
      title: AppStrings.search,
      header: const CustomTextFormField(
        labelText: AppStrings.search,
        prefixIcon: Icon(Ionicons.search),
      ),
      sliver: SliverPadding(
        padding: const EdgeInsets.all(Paddings.xs),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 320,
            childAspectRatio: 1.5,
          ),
          itemCount: 10,
          itemBuilder: (_, index) => Card(
            child: Center(child: Text("Category $index")),
          ),
        ),
      ),
    );
  }
}
