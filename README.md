# dotfiles

Reproducible Linux system bootstrap with chezmoi.

## Faststart

```bash
curl -fsSL https://raw.githubusercontent.com/gonti98/dotfiles/main/bootstrap.sh | bash
```

## Encryption

```bash
chezmoi age-keygen --output identity.key
chezmoi age encrypt --passphrase --output identity.key.age identity.key
```
