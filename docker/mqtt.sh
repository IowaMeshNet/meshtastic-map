#!/bin/sh

#echo "Running migrations"
#npx prisma migrate dev

#echo "Starting mqtt listener"
#exec node src/mqtt.js ${MQTT_OPTS}
#!/bin/sh

echo "Running migrations..."
npx prisma migrate deploy

echo "Starting MQTT listener..."

exec node src/mqtt.js \
  --mqtt-broker-url mqtt://mqtt.nonullsessions.com:8882 \
  --mqtt-username iromesh \
  --mqtt-password '2Gab9eAz' \
  --mqtt-client-id meshtmap-iromesh \
  --mqtt-topic 'iromesh/#' \
  --collect-service-envelopes \
  --collect-text-messages \
  --collect-waypoints \
  --collect-map-reports \
  --ignore-direct-messages \
  --purge-interval-seconds 60 \
  --purge-nodes-unheard-for-seconds 604800 \
  --purge-device-metrics-after-seconds 604800 \
  --purge-environment-metrics-after-seconds 604800 \
  --purge-map-reports-after-seconds 604800 \
  --purge-neighbour-infos-after-seconds 604800 \
  --purge-power-metrics-after-seconds 604800 \
  --purge-positions-after-seconds 604800 \
  --purge-service-envelopes-after-seconds 604800 \
  --purge-text-messages-after-seconds 604800 \
  --purge-traceroutes-after-seconds 604800 \
  --purge-waypoints-after-seconds 604800 \
  --drop-packets-not-ok-to-mqtt \
  --old-firmware-position-precision 16