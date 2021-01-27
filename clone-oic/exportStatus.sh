# GET STATUS
curl ${CURL_FLAGS} -X GET -u ${SRC_OIC_USERNAME}:${SRC_OIC_PASSWORD} ${SRC_OIC_HOST}/ic/api/common/v1/exportServiceInstanceArchive/${JOB_ID}
