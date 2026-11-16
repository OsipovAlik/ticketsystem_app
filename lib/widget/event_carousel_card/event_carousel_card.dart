import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/home_provider/model/event_model.dart';
import '../../theme/custom_colors.dart';
import '../../theme/styles_text.dart';
import '../global_cash_img/global_cash_img.dart';

/// Compact poster-forward card for horizontal carousels (per-category rows).
/// Shows a play button over the poster when the event has a trailer
/// ([EventModel.video] is non-empty), mirroring the website's "All movies"
/// row.
class EventCarouselCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;

  const EventCarouselCard({super.key, required this.event, required this.onTap});

  Future<void> _playTrailer() async {
    final uri = Uri.tryParse(event.video);
    if (uri == null) return;
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // No player/browser available for this URL — nothing sensible to do.
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.72,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: GlobalCashImg(
                      photo: event.posterImageEvent,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (event.video.isNotEmpty)
                    Center(
                      child: GestureDetector(
                        onTap: _playTrailer,
                        child: GlassContainer(
                          padding: const EdgeInsets.all(10),
                          shape: const LiquidOval(),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 22),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(event.name, style: ThemeText.w14b, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(
              '${event.day} ${event.month} · ${event.hour}',
              style: const TextStyle(color: CustomColors.inputGrey, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
