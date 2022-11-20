param (
    # Parameter help description
    [Parameter(Mandatory)]
    [securestring]
    $pass
)
New-AzResourceGroupDeployment -TemplateFile .\kevault.bicept -Mode Incremental `
-ResourceGroupName dev -Verbose -pass $pass