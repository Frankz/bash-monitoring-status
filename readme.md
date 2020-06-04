# Scraping Veracode Status Page

## Cómo lo uso?

### Sin Docker

Para dejar corriendo el script en una ventana de la terminal conviene ejecutarlo de la siguiente manera:

```bash
watch -n 1 --color  src/main.sh
```

> NOTA: debe tener las variables en un archivo ".env" en el proyecto o seteadas en el entorno, las mismas deben ser

```bash
URL="https://mongocache.asm.ca.com"
TELEGRAM_TOKEN="<< TOKEN DE TELEGRAM >>"
TELEGRAM_CHAT_ID="<< CHAT ID DE TELEGRAM >>"
```

> NOTA:  \<\< URL \>\> es la url donde se consulta el estatus de los servicios de Veracode.

### Con docker

Con el docker primero hacemos el build de la imagen y luego la ejecutamos agregandole los parametros que necesitamos

```bash
docker build -y ${imagename} .
docker run --env-file src/.env -t prueba_1
```

---

Con docker-compose

```bash
docker-compose up
```

## Source

https://status.veracode.com

https://medium.com/@LiliSousa/web-scraping-with-bash-690e4ee7f98d