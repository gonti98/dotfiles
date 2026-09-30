# dotfiles

Reproducible Linux system bootstrap with chezmoi.

```bash
chezmoi age-keygen --output identity.key
chezmoi age encrypt --passphrase --output identity.key.age identity.key
```
