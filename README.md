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
  ./otus/grafana/script.sh
```

http://192.168.11.22:3000
В веб интерфейсе добавить источник данных  Prometheus, URL указываем http://localhost:9090 и добавляем Dashbord

### 4vm-elk
```bash
  ./otus/elk/script.sh
```

http://192.168.11.26:5601
В веб интерфейсе вводим elasticsearch-token и kibana-verification-code из консоли, Добавляем Discover и Dashboards

### Backup
```bash
  ./otus/front/backup.sh
```
Все таблицы сохраняться в этой же директории в папке backup
