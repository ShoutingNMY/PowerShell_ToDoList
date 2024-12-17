# File directoryNew-Item $taskFile = "C:\Users\TobiasSlettli\Documents\Powershell\tasks.txt"

# Loads task file if found
$tasks = @()
if (Test-Path $taskFile)
    {
    $tasks = Get-Content $taskFile
    }

function Show-Menu
    {
    Clear-Host
    Write-Host("  To-Do List")
    Write-Host("---------------")
    Write-Host("1. View tasks")
    Write-Host("2. Add a task")
    Write-Host("3. Remove a task")
    Write-Host("4. Save & exit")
    Write-Host("---------------")
    }

function View-Tasks 
    {
    if ($tasks.Count -eq 0) 
        {
        Write-Host "No tasks in the list!"
        } 
    else 
        {
        Write-Host "Tasks:"
        for ($i = 0; $i -lt $tasks.Count; $i++) 
            {
            Write-Host "$($i + 1). $($tasks[$i])"
            }
        }
    }


function Add-Task
    {
    $NewTask = Read-Host("Add your task")
    $tasks += $NewTask
    Write-Host("Task added")
    }

function Remove-Task
    {
    Write-Host("$tasks")
    $rTask = Read-Host("Select a task number to remove")

    }

function Save-Tasks
    {
    $tasks | Out-File -Append $taskfile
    }


do {
    Show-Menu
    $choice = Read-Host "Choose an option"
    
    switch ($choice) {
        1 { View-Tasks }
        2 { Add-Task }
        3 { Remove-Task }
        4 { Save-Tasks; Write-Host "Goodbye!"; break }
        default { Write-Host "Invalid choice! Please select a valid option." }
    }
    Pause
} while ($choice -ne 4)
