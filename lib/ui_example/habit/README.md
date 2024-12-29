## HabitOnboardingScreen
立体的な切り抜いたようなUIを重ねたUIデザインをイメージしてみました。
作るにはCustomPainterとClipPathを使います。美しいデザインは作る難易度が高い💦

1. **基本構造: `Scaffold`と`Stack`**
```dart
Scaffold(
  body: Stack(
    children: [...],
  ),
)
```
- `Scaffold`: マテリアルデザインの基本的な画面構造を提供
- `Stack`: 複数のWidgetを重ね合わせて配置。子Widgetを順番に重ねていく

2. **背景レイヤー: `Container`**
```dart
Container(
  color: Color(0xFFFFC0CB), // ピンク色
)
```
- 画面全体のピンク色の背景を設定
- `Color`には16進数のカラーコードを指定

3. **波形の黒いエリア: `ClipPath`**
```dart
ClipPath(
  clipper: WaveClipper(),
  child: Container(
    height: MediaQuery.of(context).size.height * 0.65,
    color: Colors.black,
    // ...
  ),
)
```
- `ClipPath`: カスタムな形状でコンテンツを切り抜く
- `WaveClipper`: カスタムの波形を定義するクラス
- `MediaQuery`: 画面サイズに応じた相対的なサイズ設定

4. **位置指定: `Positioned`**
```dart
Positioned(
  top: MediaQuery.of(context).size.height * 0.45,
  left: 0,
  right: 0,
  child: Widget,
)
```
- `Stack`内での要素の絶対位置を指定
- `top`, `left`, `right`, `bottom`で位置を制御

5. **テキストレイアウト: `Column`**
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(...),
    Text(...),
  ],
)
```
- 垂直方向に要素を配置
- `crossAxisAlignment`: 水平方向の配置を制御

6. **ボタンデザイン: `Container`と`BoxDecoration`**
```dart
Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(
    color: Colors.black,
    shape: BoxShape.circle,
  ),
  child: Icon(...),
)
```
- 円形のボタンを作成
- `BoxDecoration`: 形状やスタイルを定義

7. **余白の制御: `SizedBox`と`Padding`**
```dart
SizedBox(height: 40)
Padding(
  padding: EdgeInsets.all(24),
  child: Widget,
)
```
- `SizedBox`: 特定のサイズの空白を作成
- `Padding`: ウィジェットの周りに余白を追加

8. **アライメント制御: `Align`**
```dart
Align(
  alignment: Alignment.centerRight,
  child: Widget,
)
```
- 子Widgetの配置位置を制御
- `centerRight`で右中央に配置

これらのWidgetを適切に組み合わせることで、複雑なレイアウトと視覚効果を実現しています。特に`Stack`と`ClipPath`の組み合わせが、独特な波形デザインの実現に重要な役割を果たしています。