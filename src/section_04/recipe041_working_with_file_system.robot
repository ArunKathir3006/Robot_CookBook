*** Settings ***
Documentation    PROBLEM:
...              You want to query the file system and list items, files and directories.
...              DISCUSSION:
...              This recipe demonstrates list variables, FOR loop and how to import a library.
...              We choose ${TEMPDIR} here as it works on all platforms.
Library          OperatingSystem
Test Tags        py3.10    py3.11

*** Variables ***
${recipe}         Recipe 4.1 Working With File System
${level}          Beginner
${category}       Internal Library: OperatingSystem

*** Test Cases ***
Listing Directory Contents
    Log Variables
    @{itemlist} =    List Directory    ${TEMPDIR}
    @{filelist} =    List Files In Directory    ${TEMPDIR}    absolute=True
    @{directorylist} =    List Directories In Directory    ${TEMPDIR}
    ${countitems} =    Count Items In Directory    ${TEMPDIR}
    ${countfiles} =    Count Files In Directory    ${TEMPDIR}
    ${countdirectories} =    Count Directories In Directory    ${TEMPDIR}
    FOR    ${directory}    IN    @{directorylist}
        Log    ${directory}    console=true
    END
