#!/usr/bin/osascript

# iTerm起動
tell application "iTerm"
    activate
    set _current_session to current session of current window


    tell _current_session
        # 画面分割
        split vertically with default profile
        split horizontally with default profile
        split horizontally with default profile
    end tell

    # セッション切り替え
    tell fourth session of current tab of current window
        # タブ選択
        select
        split horizontally with default profile
        split horizontally with default profile
    end tell

    tell first session of current tab of current window
        select
        # シェルコマンド実行
        write text "cd work/autify/mobile-web"
        write text "./bin/bundle exec puma -C config/puma.rb"
    end tell

    tell second session of current tab of current window
        select
        write text "cd work/autify/mobile-web"
        write text "./bin/bundle exec sidekiq -C config/sidekiq.yml"
    end tell

    tell fourth session of current tab of current window
        select
        write text "cd work/autify/mobile-web"
        write text "./bin/webpack-dev-server"
    end tell

    tell fifth session of current tab of current window
        select
        write text "cd work/autify/mobile-web"
        write text "docker-compose up db redis localstack"
    end tell

    tell third session of current tab of current window
        select
        write text "cd work/autify/mobile-web"
        write text "code ."
    end tell

end tell
