import 'package:flutter/material.dart';
import '../../domain/entities/campaign.dart';
import '../widgets/campaign_image.dart';
import '../widgets/campaign_info.dart';

class CampaignCard extends StatefulWidget {
  final Campaign campaign;
  final VoidCallback? onTap;

  const CampaignCard({super.key, required this.campaign, this.onTap});

  @override
  State<CampaignCard> createState() => _CampaignCardState();
}

class _CampaignCardState extends State<CampaignCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleInteraction(bool isActive) {
    setState(() => _isHovered = isActive);
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.04 + (_elevationAnimation.value * 0.06),
                  ),
                  blurRadius: 12 + (_elevationAnimation.value * 8),
                  offset: Offset(0, 4 + (_elevationAnimation.value * 4)),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                onTap: widget.onTap,
                onTapDown: (_) => _handleInteraction(true),
                onTapUp: (_) => _handleInteraction(false),
                onTapCancel: () => _handleInteraction(false),
                onHover: _handleInteraction,
                borderRadius: BorderRadius.circular(24),
                splashColor: Colors.blue.withOpacity(0.08),
                highlightColor: Colors.blue.withOpacity(0.04),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _isHovered
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'campaign_${widget.campaign.title}',
                        child: CampaignImage(
                          imageUrl: widget.campaign.imageUrl,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: CampaignInfo(campaign: widget.campaign)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
