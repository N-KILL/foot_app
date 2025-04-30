Write-Host "🗑️  Eliminando ramas no utilizadas..."

# Asegurarse de estar en un repositorio git
git fetch --all --prune
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Establecer HEAD remoto automáticamente
git remote set-head origin --auto
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Obtener todas las ramas locales
$branches = git for-each-ref refs/heads --format="%(refname:short)"

foreach ($branch in $branches) {
    # Comprobar si la rama tiene un remoto configurado
    $remote = git config --get "branch.$branch.remote" 2>$null
    if ($remote) {
        # Intentar obtener el nombre de la rama remota
        $upstream = git rev-parse --abbrev-ref "$branch@{upstream}" 2>$null
        if ($LASTEXITCODE -eq 0) {
            # Si existe, intentar hacer fast-forward desde el upstream
            git fetch --update-head-ok . "${upstream}:$branch"
        } else {
            # Si no existe upstream, verificar si fue fusionada a origin/HEAD
            git merge-base --is-ancestor $branch origin/HEAD
            if ($LASTEXITCODE -eq 0) {
                $currentBranch = git branch --show-current
                if ($branch -eq $currentBranch) {
                    Write-Host "La rama actual será eliminada porque ya fue fusionada."
                    Write-Host "Pasando a modo detached head..."
                    git switch --detach origin/HEAD
                }
                git branch -D $branch
            }
        }
    }
}

exit 0
