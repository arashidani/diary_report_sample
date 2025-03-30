# 日報管理アプリサンプル

日報管理アプリのサンプルです

# Firestore Database Schema (最新)

## divisions コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|-------------|----------------|-----------|------|----|
| docId | string | String | Firestoreの自動採番ID | div123 |
| name | string | String | 部署名 | Engineering |

---

## projectGroups コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|-------------|----------------|-----------|------|----|
| docId | string | String | Firestoreの自動採番ID | grp001 |
| name | string | String | プロジェクトグループ名 | Software Development |

---

## projects コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例                    |
|-------------|----------------|-----------|------|----------------------|
| docId | string | String | Firestoreの自動採番ID | cBrYsYNxD59oxhCokgfO |
| name | string | String | プロジェクト名 | プロジェクト1              |
| description | string | String | プロジェクトの説明 | This is a project    |
| period | number | int | プロジェクトの期 | 2025                 |
| taskType | string | String | タスクの種類 | development          |
| groupId | string | String | プロジェクトグループID | grp001               |
| createdAt | timestamp | DateTime | 作成日時 | 2025-03-22T00:00:00Z |
---

## users コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|-------------|----------------|-----------|------|----|
| docId | string | String | FirestoreのドキュメントID（Firebase AuthのUID） | abc123 |
| email | string | String | ユーザーのメールアドレス | user@example.com |
| employeeId | string | String | 従業員ID | EMP001 |
| firstName | string | String | 名 | Taro |
| lastName | string | String | 姓 | Yamada |
| fullName | string | String | フルネーム（表示用） | Taro Yamada |
| divId | string | String | 所属部署ID | div123 |
| role | string | String | ユーザーのロール（admin/user） | user |

---

## dailyReports コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例                             |
|-------------|----------------|-----------|------|-------------------------------|
| docId | string | String | 日報の日付 (yyyy-MM-dd 形式) | 2025-03-30                    |
| date | timestamp | DateTime | 日報の日付 | 2025-03-30T00:00:00 UTC+9     |
| isApproval | boolean | bool | 管理者による承認フラグ | true                          |
| hasSubstituteHoliday | boolean | bool | 代休フラグ | true                          |
| absentOrLeft | number | double | 早退・欠席時間 | 0.0                           |
| holidays | map | Map<String, dynamic> | 有給・特別休暇などの種類ごとの時間 | {'paid': 8.0, 'special': 4.0} |
| createdAt | timestamp | DateTime | 作成日時 | 2025-03-30T00:00:00 UTC+9     |
| updatedAt | timestamp | DateTime | 更新日時 | 2025-03-30T00:00:00 UTC+9     |

---

## dailyReports/dailyReportProjects コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例                         |
|-------------|----------------|-----------|------|---------------------------|
| docId | string | String | プロジェクトのFirestore ID | Sb5SiSVvTB84MMJKUDbo      |
| projectId | string | String | 紐づくプロジェクトID | Sb5SiSVvTB84MMJKUDbo      |
| business | number | double | 通常業務の時間 | 8.0                       |
| late | number | double | 深夜時間 | 0.0                       |
| over | number | double | 残業時間 | 1.5                       |
| createdAt | timestamp | DateTime | 作成日時 | 2025-03-30T00:00:00 UTC+9 |
| updatedAt | timestamp | DateTime | 更新日時 | 2025-03-30T10:27:39 UTC+9 |

---

## userProjects コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|-------------|----------------|-----------|------|----|
| docId | string | String | 自動生成されたドキュメントID | Sb5SiSVvTB84MMJKUDbo |
| projectId | string | String | 紐づくプロジェクトID | Sb5SiSVvTB84MMJKUDbo |
| addedAt | timestamp | DateTime | プロジェクトを追加した日付 | 2025-03-30T00:00:00 UTC+9 |
---