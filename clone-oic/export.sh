# START EXPORT
curl ${CURL_FLAGS} -H 'Accept: */*' -H 'Content-Type: application/json' -X POST -d '
{
  "storageInfo": {
    "storageUrl": "'"${STORAGE_URL}"'",
    "storageUser": "'"${STORAGE_USER}"'",
    "storagePassword": "'"${STORAGE_PASSWORD}"'"
  }
}' -u ${SRC_OIC_USERNAME}:${SRC_OIC_PASSWORD} ${SRC_OIC_HOST}/ic/api/common/v1/exportServiceInstanceArchive
