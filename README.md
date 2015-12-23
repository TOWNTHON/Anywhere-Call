# Anywhere-Call

##　.gitignoreの作成

```
touch .gitignore
```

内容は以下のとおり
```
# Mac
.DS_Store

# Xcode
build/*
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
*.xcworkspace
!default.xcworkspace
xcuserdata
profile
*.moved-aside


#CocoaPod
Pods/*


```

##　podsでライブラリのインストール
```
pods install
```
