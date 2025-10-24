# otus

Аварийное восстановление web-сервиса, мониторинга, логирования и backup

## Схема и запуск
### 1vm-frontend+replica
```bash
  ./otus/front/script.sh
```
### 2vm-backend+source
```bash
  ./otus/back/script.sh
```
### 3vm-monitoring
```bash
  ./otus/grafanf/script.sh
```
### 4vm-elk
```bash
  ./otus/elk/script.sh
```
