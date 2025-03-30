// lib/features/daily_reports/views/components/daily_report_project_list.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:diary_report_sample/features/daily_reports/providers/daily_report_project_notifier.dart';
import 'package:diary_report_sample/features/daily_reports/providers/daily_report_project_provider.dart';
import 'package:diary_report_sample/features/daily_reports/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyReportProjectList extends ConsumerWidget {
  final String reportId;

  const DailyReportProjectList({
    super.key,
    required this.reportId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(dailyReportProjectsProvider(reportId));

    return projectsAsync.when(
      data: (projects) {
        if (projects.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'プロジェクトが登録されていません',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }

        // プロジェクトのトータル時間を計算
        final totalHours = ref.watch(dailyReportTotalHoursProvider(projects));

        return Column(
          children: [
            // トータル時間の表示
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '合計作業時間',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$totalHours 時間',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // プロジェクトリスト
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return _buildProjectItem(context, ref, project);
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('エラーが発生しました: $error'),
      ),
    );
  }

  Widget _buildProjectItem(
      BuildContext context, WidgetRef ref, DailyReportProject project) {
    // プロジェクト詳細の取得
    final projectDetailAsync = ref.watch(projectProvider(project.docId));

    return Dismissible(
      key: Key(project.docId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('プロジェクトを削除'),
            content: const Text('このプロジェクトを日報から削除しますか？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('削除'),
              ),
            ],
          ),
        );
        return result ?? false;
      },
      onDismissed: (_) {
        final notifier =
            ref.read(dailyReportProjectNotifierProvider(reportId).notifier);
        notifier.deleteProject(project.docId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              projectDetailAsync.when(
                data: (detail) => Text(
                  detail?.name ?? 'プロジェクト',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                loading: () => const Text('読み込み中...'),
                error: (_, __) => const Text('プロジェクト情報の取得に失敗しました'),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeItem('通常', project.business, Colors.blue),
                  _buildTimeItem('残業', project.over, Colors.orange),
                  _buildTimeItem('深夜', project.late, Colors.purple),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('編集'),
                    onPressed: () => _showEditDialog(context, ref, project),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeItem(String label, double hours, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
          Text(
            '$hours h',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
      BuildContext context, WidgetRef ref, DailyReportProject project) {
    final businessController =
        TextEditingController(text: project.business.toString());
    final overController = TextEditingController(text: project.over.toString());
    final lateController = TextEditingController(text: project.late.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('作業時間を編集'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: businessController,
              decoration: const InputDecoration(
                labelText: '通常時間',
                suffix: Text('時間'),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: overController,
              decoration: const InputDecoration(
                labelText: '残業時間',
                suffix: Text('時間'),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: lateController,
              decoration: const InputDecoration(
                labelText: '深夜時間',
                suffix: Text('時間'),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () {
              final business =
                  double.tryParse(businessController.text) ?? project.business;
              final over = double.tryParse(overController.text) ?? project.over;
              final late = double.tryParse(lateController.text) ?? project.late;

              final updatedProject = project.copyWith(
                business: business,
                over: over,
                late: late,
              );

              final notifier = ref
                  .read(dailyReportProjectNotifierProvider(reportId).notifier);
              notifier.updateProject(updatedProject);

              Navigator.of(context).pop();
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
