function Get-ToDo {
    [CmdletBinding()]

    param (

    )

    try {
        $toDos = Get-Content -Path $ToDoFilePath -Raw -ErrorAction Stop | ConvertFrom-Json
    }
    catch {
        $toDos = @()
    }

    return $toDos
}