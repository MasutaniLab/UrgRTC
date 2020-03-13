@echo off
: UrgRTCのテスト

:ネーミングサービスの確認
rtls /localhost > nul
if errorlevel 1 (
  echo ネーミングサーバが見つかりません
  pause
  exit /b 1
  rem /bオプションは親を終わらせないために必須
)

:コンポーネントの起動
call .\UrgRTC.bat
call ..\RangeDataViewer\RangeDataViewer.bat

:コンポーネント名を変数化
set s=/localhost/UrgRTC0.rtc
set v=/localhost/RangeDataViewer0.rtc

:時間待ち
timeout 5

:接続
rtcon %s%:range %v%:range

:アクティベート
rtact %s% %v%

:loop
set /p ans="終了しますか？ (y/n)"
if not "%ans%"=="y" goto loop

:ディアクティベート
rtdeact %s% %v%

:終了（rtexitは，引数を一つずつ）
rtexit %s%
rtexit %v%