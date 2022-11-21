import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class ReportViewModel extends ChangeNotifier {
  ReportViewModel(this.httpService, this.authViewModel) {
    _init();
  }

  final HttpService httpService;
  final AuthViewModel authViewModel;

  void _init() async {}

  Future<List<ReportResponse>?> getReports(int submitterId) async {
    return await httpService.getReports(submitterId);
  }

  Future<ReportResponse?> submitReport(SubmitReportRequest submitReportRequest) async {
    return await httpService.submitReport(submitReportRequest);
  }

  Future<ReportResponse?> updateReport(int reportId, UpdateReportRequest updateReportRequest) async {
    return await httpService.updateReport(reportId, updateReportRequest);
  }

  Future<void> deleteReport(int reportId) async {
    await httpService.deleteReport(reportId);
  }
}
