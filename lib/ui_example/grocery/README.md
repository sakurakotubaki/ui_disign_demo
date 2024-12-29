## Orange Product Screen
オレンジの商品画像を表示するUIをイメージしてみました。スライドしませんが💦

1. **ベースとなる構造**
```dart
Scaffold(
  backgroundColor: const Color(0xFFF5F5F5),
  body: SafeArea(...)
)
```
- `Scaffold`: アプリの基本的な視覚構造を提供
- `backgroundColor`: 薄いグレー（#F5F5F5）を背景色に設定
- `SafeArea`: ノッチやステータスバーを避けて安全な領域にコンテンツを配置

2. **最上部のヘッダー部分**
```dart
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(...),
        child: IconButton(...)
      ),
    ],
  ),
)
```
- `Padding`: 全方向に16.0の余白を追加
- `Row`: 子要素を水平方向に配置
- `Container` + `BoxDecoration`: 白背景の丸い形状を作成
- `IconButton`: 戻るボタンの実装

3. **メインの画像エリア**
```dart
Expanded(
  child: Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    child: Column(...),
  ),
)
```
- `Expanded`: 利用可能な縦方向のスペースを最大限に使用
- `Container`: 幅いっぱい（double.infinity）で白背景のエリアを作成
- `margin`: 左右に16ポイントの余白
- `BorderRadius.vertical`: 下部のみ30の角丸を適用

4. **商品画像とインジケーター**
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('🍊', style: TextStyle(fontSize: 120)),
    const SizedBox(height: 20),
    Row(...) // インジケーター
  ],
)
```
- `Column`: 子要素を垂直方向に中央揃えで配置
- `Text`: 大きなサイズ（120）のオレンジ絵文字
- `SizedBox`: 20ポイントの縦方向スペース
- `Row`: インジケーターのドットを水平に配置

5. **下部の商品情報エリア**
```dart
Padding(
  padding: const EdgeInsets.all(24.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Fresh Orange', ...),
      const SizedBox(height: 8),
      Text('Product Description', ...),
    ],
  ),
)
```
- `Padding`: 全方向に24.0の余白
- `Column`: 左揃え（crossAxisAlignment.start）で垂直配置
- `Text`: 商品名（太字、24サイズ）と説明文（グレー、16サイズ）

このデザインは、明確な視覚的階層と適切な余白によって、ユーザーフレンドリーなインターフェースを実現しています。