function New-ToDo {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory = $true)]
        [string] $Task,
        [Parameter(Mandatory = $false)]
        [DateTime] $DueDate = (Get-Date).AddDays(7)
    )

    $toDo = [ToDo]::new()
    $toDo.Task = $Task
    $toDo.DueDate = $DueDate
    $toDo.IsCompleted = $false

    $toDos = Get-ToDo
    $toDos += $toDo | ConvertTo-Json
    $toDos | Set-Content -Path $ToDoFilePath -Force

    return $toDo
}