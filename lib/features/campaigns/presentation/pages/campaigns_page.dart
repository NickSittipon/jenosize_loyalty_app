import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/shared/widgets/app_scaffold.dart';
import '../../domain/usecases/get_campaigns.dart';
import '../bloc/campaign_bloc.dart';
import '../bloc/campaign_event.dart';
import '../bloc/campaign_state.dart';
import '../widgets/campaign_card.dart';
import '../../data/repositories/campaign_repository_impl.dart';

class CampaignsPage extends StatelessWidget {
  const CampaignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = CampaignRepositoryImpl();
    final getCampaigns = GetCampaigns(repository);

    return AppScaffold(
      title: "Campaigns",
      currentIndex: 0,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.white],
          ),
        ),
        child: BlocProvider(
          create: (_) =>
              CampaignBloc(getCampaigns: getCampaigns)..add(LoadCampaigns()),
          child: BlocBuilder<CampaignBloc, CampaignState>(
            builder: (context, state) {
              if (state is CampaignLoading) {
                return _buildLoading();
              } else if (state is CampaignLoaded) {
                return _buildCampaignsList(state.campaigns);
              } else if (state is CampaignError) {
                return _buildError(state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading campaigns...',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildCampaignsList(campaigns) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add refresh logic here
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final campaign = campaigns[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 200 + (index * 50)),
            curve: Curves.easeOutBack,
            child: CampaignCard(
              campaign: campaign,
              onTap: () {
                _showJoinDialog(context, campaign.title);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red.shade100),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 48),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red.shade600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _showJoinDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('🎉 Success!'),
          content: Text('You have joined "$title" campaign'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
