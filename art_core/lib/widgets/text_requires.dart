import '../art_core.dart';
import '../theme/app_text_style.dart';

class TextRequires extends StatelessWidget {
  const TextRequires({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text),
          TextSpan(
            text: ' * ',
            style: AppTextStyle.of(context).blackBold16.copyWith(color: colorPrimary),
          ),
        ],
      ),
      style: AppTextStyle.of(context).blackRegular16,
    );
  }
}
