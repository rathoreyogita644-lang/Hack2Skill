import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VertexAgent {
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');
  static final _model = GenerativeModel(model: 'gemini-2.0-flash-exp', apiKey: _apiKey);

  static Future<String> queryAgent(String userQuery, Map<String, dynamic> context) async {
    // Simulate crowd data (replace with Vertex AI Agent Builder endpoint)
    final systemPrompt = '''
You are Venue Assist, helping fans at sports stadiums.
Context: ${jsonEncode(context)}  // e.g., {"location": "Gate A", "crowd_level": "high"}
Respond with safe routes, wait times, coordination tips using Maps data.
    ''';

    final content = [Content.text(systemPrompt + '\nUser: $userQuery')];
    final response = await _model.generateContent(content);
    return response.text ?? 'Sorry, try again.';
  }

  // Ground with Google Search/Maps via Vertex grounding (add Vertex AI SDK call here)
  static Future<Map<String, dynamic>> getVenueData(String venue) async {
    // Mock API; integrate real Vertex Search
    return {'wait_times': {'concessions': '5 min'}, 'paths': 'Avoid East tunnel'};
  }
}
