import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soc_leader/presentation/web_view_page.dart';

class EventCardNet extends StatelessWidget {
  const EventCardNet(
      {super.key,
      this.title = "Мероприятие",
      this.location = "Грозный молл",
      this.imageUrl =
          "https://cdn.culture.ru/images/403b3d5c-9c5a-59f7-89eb-2f7860ca1c0e/w_884,h_442,c_fill,g_center/6aace11c98db772cd64f004e1868fc74-jpg.webp",
      this.link =
          "https://www.culture.ru/events/3615499/vystavka-luchshii-gorod-na-zemle?location=chechenskaya-respublika-groznyy"});

  final String title;
  final String location;
  final String imageUrl;
  final String link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewPage(title: title, url: link))),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)
            ],
            borderRadius: BorderRadius.circular(23)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Пн, 14 Дек. 18.00 - 23.00',
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: const Color(0XFF6C63FF), fontSize: 10),
              ),
              const SizedBox(
                height: 4.0,
              ),
              RichText(
                  text: TextSpan(children: [
                const WidgetSpan(
                    child: Icon(
                  LineIcons.mapMarker,
                  size: 16,
                )),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4.0,
                )),
                TextSpan(
                    text: location.length > 16 ? "${location.substring(0, 15)}..." : location,
                    style: Theme.of(context).textTheme.labelSmall),
              ])),
              const SizedBox(
                height: 2.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
