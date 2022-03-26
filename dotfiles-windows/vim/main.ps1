function Install-Vundle {
    $dir_vundle = Join-Path -Path $HOME -Child "vimfiles/bundle/Vundle.vim"
    if (-not(Test-Path -Path $dir_vundle)) {
        git clone https://github.com/VundleVim/Vundle.vim.git $dir_vundle
    }
}

Install-Vundle;
