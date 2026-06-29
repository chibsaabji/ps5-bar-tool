$env:PATH = "A:\LLVM\bin;" + $env:PATH
$env:SCE_PROSPERO_SDK_DIR = "A:\DOWNLOADS\PROJECT\ps5-payload-sdk\win\.."
$SDK = "A:\DOWNLOADS\PROJECT\ps5-payload-sdk\win\.."

$CFLAGS = @(
    "--start-no-unused-arguments",
    "-target", "x86_64-sie-ps5",
    "-isysroot", $SDK,
    "-isystem", "$SDK\target\include",
    "-L", "$SDK\target\lib",
    "-L", "$SDK\target\user\homebrew\lib",
    "-fno-stack-protector", "-fno-plt", "-femulated-tls",
    "-lc", "-lkernel_web",
    "--end-no-unused-arguments",
    "-Werror", "-Iinclude",
    "source/main.c", "source/bar_srv.c",
    "--start-no-unused-arguments",
    "-lSceLibcInternal", "-lSceNet",
    "--end-no-unused-arguments"
)

New-Item -ItemType Directory -Force -Path bin | Out-Null

Write-Host "Building ps5-bar-tool_info.elf..."
clang $CFLAGS -DDUMP_MAIN_SEGMENTS=0 -DDUMP_FILES=0 -o bin/ps5-bar-tool_info.elf

Write-Host "Building ps5-bar-tool_dump_main_segments.elf..."
clang $CFLAGS -DDUMP_MAIN_SEGMENTS=1 -DDUMP_FILES=0 -o bin/ps5-bar-tool_dump_main_segments.elf

Write-Host "Building ps5-bar-tool_savedata.elf..."
clang $CFLAGS -DDUMP_MAIN_SEGMENTS=0 -DDUMP_FILES=0 -DDUMP_SAVES=1 -o bin/ps5-bar-tool_savedata.elf

Write-Host "Building ps5-bar-tool_dump_all.elf..."
clang $CFLAGS -DDUMP_MAIN_SEGMENTS=1 -DDUMP_FILES=1 -o bin/ps5-bar-tool_dump_all.elf

Write-Host "Done!"
