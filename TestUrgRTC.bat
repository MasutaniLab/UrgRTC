@echo off
: UrgRTC�̃e�X�g

:�l�[�~���O�T�[�r�X�̊m�F
rtls /localhost > nul
if errorlevel 1 (
  echo �l�[�~���O�T�[�o��������܂���
  pause
  exit /b 1
  rem /b�I�v�V�����͐e���I��点�Ȃ����߂ɕK�{
)

:�R���|�[�l���g�̋N��
call .\UrgRTC.bat
call ..\RangeDataViewer\RangeDataViewer.bat

:�R���|�[�l���g����ϐ���
set s=/localhost/UrgRTC0.rtc
set v=/localhost/RangeDataViewer0.rtc

:���ԑ҂�
timeout 5

:�ڑ�
rtcon %s%:range %v%:range

:�A�N�e�B�x�[�g
rtact %s% %v%

:loop
set /p ans="�I�����܂����H (y/n)"
if not "%ans%"=="y" goto loop

:�f�B�A�N�e�B�x�[�g
rtdeact %s% %v%

:�I���irtexit�́C����������j
rtexit %s%
rtexit %v%