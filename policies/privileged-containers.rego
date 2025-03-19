package privileged_containers

violation[{"msg": msg}] {
    c := input_containers[_]
    c.securityContext.privileged == true
    msg := sprintf("Container '%v' is privileged", [c.name])
}

input_containers[c] {
    c := input.review.object.spec.template.spec.containers[_]
}

input_containers[c] {
    c := input.review.object.spec.template.spec.initContainers[_]
}

input_containers[c] {
    c := input.review.object.spec.template.spec.ephemeralContainers[_]
} 