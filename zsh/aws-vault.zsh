
export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_PASSWORD_STORE_DIR=$PASSWORD_STORE_DIR
export AWS_VAULT_PASS_PREFIX=aws-vault
export GPG_TTY=$(tty)

av() {
    exec aws-vault exec $1 -- zsh
}
