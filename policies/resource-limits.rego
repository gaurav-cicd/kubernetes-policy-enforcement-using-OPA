package resource_limits

violation[{"msg": msg}] {
    c := input_containers[_]
    not has_resource_limits(c)
    msg := sprintf("Container '%v' must specify resource limits", [c.name])
}

has_resource_limits(c) {
    c.resources.limits
    c.resources.requests
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