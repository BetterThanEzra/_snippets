

#This easy to read example snippet assumes that your OS is winodws, and has been setup to launch .Rexec files in the following way:
#https://stackoverflow.com/questions/33755074/creating-an-executable-r-file


#create text file
file.create("info.txt")
fileConn <- file("info.txt")
writeLines(c("Hello","World"), fileConn)
close(fileConn)

#create executable r file
file.create("launch.Rexec")
fileConn <- file("launch.Rexec")
writeLines(c(
        'messageTxt <- readLines("info.txt")',
        'print(messageTxt[1])',
        'print(messageTxt[2])',
        'print("File read, now waiting 15 seconds before closing")',
        'Sys.sleep(15)',
        'input <- readline(prompt="Press [enter] to continue: ")', #note, input prompts do not work in this situation
        'print(input)'
        ),
        fileConn)


dir.create("test_1")
dir.create("test_2")
dir.create("test_3")

file.copy("launch.Rexec", "test_1")
file.copy("launch.Rexec", "test_2")
file.copy("launch.Rexec", "test_3")

file.copy("info.txt", "test_1")
file.copy("info.txt", "test_2")
file.copy("info.txt", "test_3")

#Launch multiple instances via windows command line
system("cmd /c start test_1/launch.Rexec")
system("cmd /c start test_2/launch.Rexec")
system("cmd /c start test_3/launch.Rexec")

