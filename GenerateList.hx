import sys.io.File;
import sys.FileSystem;
final excludes = ['.git', '.vs', '.vscode'];
function main() {
    var s = "";
    for (i in FileSystem.readDirectory("./")) {
        if (FileSystem.isDirectory(i) && !excludes.contains(i)) s += '$i\n';
    }
    File.saveContent('modList.txt', s);
    Sys.println('Done');
}