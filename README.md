# 古い方の日報管理アプリです
- projectId:`diary-sample-egd`
# Firestore Database Schema

## users コレクション

| フィールド名   | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|--------------|--------------|-----------|------|----|
| docId       | string       | String    | FirestoreのドキュメントID（Firebase AuthのUID） | abc123 |
| email       | string       | String    | ユーザーのメールアドレス | user@example.com |
| employeeId  | string       | String    | 従業員ID | EMP001 |
| firstName   | string       | String    | 名 | Taro |
| lastName    | string       | String    | 姓 | Yamada |
| fullName    | string       | String    | フルネーム（表示用） | Taro Yamada |
| divId       | string       | String    | 所属部署ID | div123 |
| role        | string       | String    | ユーザーのロール（admin/user） | user |

---

## users/userProjects サブコレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|------------|--------------|-----------|------|----|
| docId     | string       | String    | プロジェクトのFirestore ID | proj123 |
| addedAt   | timestamp    | DateTime  | プロジェクトを追加した日付 | 2025-03-16T12:00:00Z |

---

## users/dailyReports サブコレクション

| フィールド名               | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|---------------------------|--------------|-----------|------|----|
| docId                    | string       | String    | 日報の日付 (yyyy-MM-dd 形式) | 2025-03-16 |
| date                     | timestamp    | DateTime  | 日報の日付 | 2025-03-16T00:00:00Z |
| isApproval               | boolean      | bool      | 管理者による承認フラグ | true |
| hasSubstituteHoliday     | boolean      | bool      | 代休フラグ | false |
| absentOrLeft             | number       | double    | 早退・欠席時間 | 2.5 |
| holidays                 | map          | Map<String, double> | 有給・特別休暇などの種類ごとの時間 | {'paid': 8.0, 'special': 4.0} |
| createdAt                | timestamp    | DateTime  | 作成日時 | 2025-03-16T12:00:00Z |
| updatedAt                | timestamp    | DateTime  | 更新日時 | 2025-03-16T15:30:00Z |

---

## users/dailyReports/projects サブコレクション

| フィールド名  | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|-------------|--------------|-----------|------|----|
| docId      | string       | String    | プロジェクトのFirestore ID | proj123 |
| business   | number       | double    | 通常業務の時間 | 7.5 |
| late       | number       | double    | 深夜時間 | 0.0 |
| over       | number       | double    | 残業時間 | 1.5 |
| createdAt  | timestamp    | DateTime  | 作成日時 | 2025-03-16T12:00:00Z |

---

## projects コレクション

| フィールド名   | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|--------------|--------------|-----------|------|----|
| docId       | string       | String    | Firestoreの自動採番ID | proj123 |
| name        | string       | String    | プロジェクト名 | New Project |
| description | string       | String    | プロジェクトの説明 | This is a project |
| period      | number       | int       | プロジェクトの期 | 2025 |
| taskType    | string       | String    | タスクの種類 | development |
| groupId     | string       | String    | プロジェクトグループID | grp001 |

---

## projectGroups コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|------------|--------------|-----------|------|----|
| docId     | string       | String    | Firestoreの自動採番ID | grp001 |
| name      | string       | String    | プロジェクトグループ名 | Software Development |

---

## div コレクション

| フィールド名 | 型 (Firestore) | 型 (Dart) | 説明 | 例 |
|------------|--------------|-----------|------|----|
| docId     | string       | String    | Firestoreの自動採番ID | div123 |
| name      | string       | String    | 部署名 | Engineering |
