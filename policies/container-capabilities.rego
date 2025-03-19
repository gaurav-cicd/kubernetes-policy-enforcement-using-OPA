package container_capabilities

violation[{"msg": msg}] {
    c := input_containers[_]
    has_restricted_capabilities(c)
    msg := sprintf("Container '%v' has restricted capabilities", [c.name])
}

has_restricted_capabilities(c) {
    c.securityContext.capabilities.add[_]
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