

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


#Launch multiple instances via windows command line
system("cmd /c start launch.Rexec")
system("cmd /c start launch.Rexec")
system("cmd /c start launch.Rexec")

