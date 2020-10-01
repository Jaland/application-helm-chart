{{- define "initcontainers.template" -}}
initContainers:
- args:
  - -c
  - openssl pkcs12 -export -inkey $KEY_FILE -in $CERT_FILE -out $KEYSTORE_PKCS12
    -password pass:$KEYSTORE_PASS && keytool -importkeystore -noprompt -srckeystore
    $KEYSTORE_PKCS12 -srcstoretype pkcs12 -destkeystore $KEYSTORE_JKS -storepass
    $KEYSTORE_PASS -srcstorepass $KEYSTORE_PASS
  command:
  - /bin/bash
  env:
  - name: KEY_FILE
    value: /tmp/pki/tls.key
  - name: CERT_FILE
    value: /tmp/pki/tls.crt
  - name: KEYSTORE_PKCS12
    value: /tmp/keystore/keystore.pkcs12
  - name: KEYSTORE_JKS
    value: /tmp/keystore/keystore.jks
  - name: KEYSTORE_PASS
    value: changeit
  image: docker-registry.default.svc:5000/openshift/redhat-sso70-openshift:1.4
  imagePullPolicy: Always
  name: keystore-init
  resources: {}
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  volumeMounts:
  - mountPath: /tmp/pki
    name: service-cert-key-pair
  - mountPath: /tmp/keystore
    name: keystore-volume
volumes:
- emptyDir: {}
  name: keystore-volume
- name: service-cert-key-pair
  secret:
    defaultMode: 420
    secretName: survey-openapi-spring-service
{{- end -}}
{{- define "initcontainers.container" }}
volumeMounts:
- mountPath: /etc/x509
  name: keystore-volume
{{- end}}