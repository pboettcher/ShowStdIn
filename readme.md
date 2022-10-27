# STDIN viewer

A software to view STDIN. Is useful for debugging pipes in batch files or STDIN redirection while calling CreateProcess.

Supports UTF-8.

## Usage example

```
@echo off
chcp 65001
echo "my text Привет こんにちは Grüß Gott ¡Hola! שלום 你好 أهلا Բարեւ" | ShowStdIn.exe
```
