<?php
function zipData($source, $destination, $Important_Files_Interface = "") {
    global $folderCount, $fileCount, $ImportantfileCount, $startletter;
    if (extension_loaded('zip')) {
        if (file_exists($source)) {
            $zip = new ZipArchive();
                if ($zip->open($destination, ZIPARCHIVE::CREATE)) {
                $source = realpath($source);
                if (is_dir($source)) {
                    $iterator = new RecursiveDirectoryIterator($source);
                    $iterator->setFlags(RecursiveDirectoryIterator::SKIP_DOTS);
                    $files = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
                    foreach ($files as $file) {
                        $file = realpath($file);
                        if (is_dir($file)) {
                            $folderCount++;
                            $zip->addEmptyDir(str_replace($source . '', '', $file . ''));
                        } else if (is_file($file)) {
                            if (isset($_POST['VendorID1'])) {
                                if ($_POST['VendorID'] == 1) {
                                    $str = "PRKR";
                                    if (substr($file, 0, strlen($str)) != $str) {
                                        $startletter = "false";
                                    }
                                }
                                elseif ($_POST['VendorID'] == 3) {
                                    $str = "TAM";
                                    if (substr($file, 0, strlen($str)) != $str) {
                                        $startletter = "false";
                                    }
                                }
                                elseif ($_POST['VendorID'] == 4) {
                                    $str = "TVT";
                                    if (substr($file, 0, strlen($str)) != $str) {
                                        $startletter = "false";
                                    }
                                }   
                            }
                            $HiddenProducts = explode(',', $Important_Files_Interface);
                            if (in_array(basename($file), $HiddenProducts)) {
                                $ImportantfileCount++;
                            }
                            $fileCount++;
                            $zip->addFromString(str_replace($source . '', '', $file), file_get_contents($file));
                        }
                    }
                } else if (is_file($source)) {
                    $zip->addFromString(basename($source), file_get_contents($source));
                }
            }
            return $zip->close();
        }
    }
    return false;
}
$maincount = 0;
$subcount = 0;
$folderCount = 0;
$fileCount = 0;
$startletter = true;
$ImportantfileCount = 0;
if (isset($_REQUEST['id']) && isset($_REQUEST['Important_Files_Interface']) && isset($_REQUEST['InterfaceFile'])) {
    $filename = $_REQUEST['InterfaceFile'];
    $array = explode(".zip", $filename);
    $fileExtension = strtolower(end($array));
    if ($fileExtension == "") {
        $filename = $_REQUEST['InterfaceFile'];
        $foldername = substr($filename, 0, -4);
        $zip = new ZipArchive();
        $zip->open("uploads/files/" . $filename);
        for ($i = 0; $i < $zip->numFiles; $i++) {
            $fileInfo = $zip->statIndex($i);
            $zip->extractTo("uploads/files/" . $foldername);
        }
        $z = new ZipArchive();
        $z->open("test.zip", ZIPARCHIVE::CREATE);
        zipData("uploads/files/" . $foldername, 'storeThisFolder.zip', $_REQUEST['Important_Files_Interface']);
        $z->close();
        echo json_encode(array(
            "fileCount" => $fileCount,
            "folderCount" => $folderCount-1,
            "file" => $_REQUEST['Important_Files_Interface'],
            "ImportantfileCount" => $ImportantfileCount,
            "startletter" => $startletter,
            "FilePath" => $_REQUEST['InterfaceFile']
        ));
    }
}
?>
