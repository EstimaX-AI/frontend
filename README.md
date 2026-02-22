```
lib/
│
├── main.dart
│
├── core/                          # Global config
│   ├── constants.dart
│   ├── theme.dart
│   ├── router.dart
│   └── utils/
│       ├── logger.dart
│       └── extensions.dart
│
├── models/                        # API models
│   ├── job_model.dart
│   ├── detection_model.dart
│   └── estimation_model.dart
│
├── services/                      # API calls
│   ├── api_client.dart
│   ├── job_service.dart
│   └── estimation_service.dart
│
├── providers/                     # State management
│   ├── job_provider.dart
│   └── upload_provider.dart
│
├── screens/
│   ├── upload/
│   │   └── upload_screen.dart
│   │
│   ├── job_status/
│   │   └── job_status_screen.dart
│   │
│   ├── viewer/
│   │   ├── blueprint_viewer_screen.dart
│   │   └── widgets/
│   │       ├── bounding_box_painter.dart
│   │       └── zoomable_canvas.dart
│   │
│   └── estimation/
│       └── estimation_screen.dart
│
├── widgets/
│   ├── primary_button.dart
│   ├── loading_indicator.dart
│   └── error_widget.dart
│
└── config/
    └── environment.dart
```
# Blueprint AI Estimation

## Flutter Frontend Architecture & Implementation Guide (v1.0)

---

# 1. Overview

This document defines the recommended Flutter frontend structure for the Blueprint AI Estimation system.

The frontend responsibilities:

* Upload blueprint files
* Track job status
* Display original and annotated images
* Render interactive bounding boxes
* Display estimation results

Architecture Style:

* Feature-based folder structure
* Provider-based state management
* Clean separation of API, Models, UI

---

# 2. Project Structure

```
lib/
│
├── main.dart
│
├── core/
│   ├── constants.dart
│   ├── theme.dart
│   ├── router.dart
│   └── utils/
│       ├── logger.dart
│       └── extensions.dart
│
├── config/
│   └── environment.dart
│
├── models/
│   ├── job_model.dart
│   ├── detection_model.dart
│   └── estimation_model.dart
│
├── services/
│   ├── api_client.dart
│   ├── job_service.dart
│   └── estimation_service.dart
│
├── providers/
│   ├── upload_provider.dart
│   ├── job_provider.dart
│   └── estimation_provider.dart
│
├── screens/
│   ├── upload/
│   │   └── upload_screen.dart
│   │
│   ├── job_status/
│   │   └── job_status_screen.dart
│   │
│   ├── viewer/
│   │   ├── blueprint_viewer_screen.dart
│   │   └── widgets/
│   │       ├── bounding_box_painter.dart
│   │       └── zoomable_canvas.dart
│   │
│   └── estimation/
│       └── estimation_screen.dart
│
├── widgets/
│   ├── primary_button.dart
│   ├── loading_indicator.dart
│   └── error_view.dart
│
└── assets/
    └── images/
```

---

# 3. Required Dependencies (pubspec.yaml)

```
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  provider: ^6.0.5
  file_picker: ^6.1.1
  cached_network_image: ^3.3.0
```

Optional (advanced zoom support):

```
interactive_viewer_2: ^0.1.0
```

---

# 4. Application Flow

1. User uploads blueprint
2. Backend returns job_id
3. App polls job status
4. When completed:

   * Show annotated preview
   * Enable interactive viewer
   * Enable estimation screen

---

# 5. Upload Screen

Responsibilities:

* Pick file using file_picker
* Call POST /jobs
* Navigate to Job Status screen

Flow:

* Select file
* Call uploadBlueprint(file)
* Store job_id

---

# 6. Job Status Screen

Responsibilities:

* Poll GET /jobs/{job_id}
* Show progress indicator
* Navigate to viewer when COMPLETED

Polling Strategy:

* Timer.periodic every 3–5 seconds
* Stop polling when status == COMPLETED or FAILED

---

# 7. Blueprint Viewer Screen

Two modes supported:

Mode 1 (MVP):

* Display annotated_image_url using Image.network

Mode 2 (Professional Interactive Mode):

* Display original_image_url
* Render bounding boxes dynamically
* Enable zoom & pan

---

# 8. Interactive Viewer Implementation Strategy

Widget Structure:

```
InteractiveViewer(
  minScale: 1,
  maxScale: 5,
  child: Stack(
    children: [
      Image.network(originalImageUrl),
      CustomPaint(
        painter: BoundingBoxPainter(detections),
      )
    ],
  ),
)
```

---

# 9. Bounding Box Scaling Logic

Backend must provide:

```
image_size:
  width: original_width
  height: original_height
```

Scaling calculation:

```
scaleX = displayedWidth / originalWidth
scaleY = displayedHeight / originalHeight

scaledX1 = x1 * scaleX
scaledY1 = y1 * scaleY
scaledX2 = x2 * scaleX
scaledY2 = y2 * scaleY
```

Bounding boxes must use absolute pixel coordinates from backend.

---

# 10. Estimation Screen

Responsibilities:

* Call GET /jobs/{job_id}/estimation
* Display:

  * Symbol count
  * Material breakdown
  * Grand total cost

UI Components:

* DataTable or ListView
* Summary card

---

# 11. State Management

Recommended:

* Provider pattern

Providers:

* UploadProvider → handles upload state
* JobProvider → handles polling + job result
* EstimationProvider → handles estimation API call

---

# 12. Production Recommendations

* Use signed URLs for image security
* Cache images using cached_network_image
* Add error fallback UI
* Add loading skeletons
* Add detection filtering (by class)
* Add confidence threshold slider (frontend side filtering)

---

# 13. Future Enhancements

* Class toggle visibility
* Real-time threshold adjustment
* Detection highlight on tap
* Zoom-to-detection feature
* Export annotated image

---

End of Flutter Frontend Archit
