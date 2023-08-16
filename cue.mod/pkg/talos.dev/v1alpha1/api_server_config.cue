package v1alpha1

#APIServerConfig: {
	image: string

	certSANs: [...string]

	disablePodSecurityPolicy: *true | bool

	admissionControl: [
		#AdmissionPluginConfig & {
			name: "PodSecurity"

			configuration: {
				apiVersion: "pod-security.admission.config.k8s.io/v1alpha1"
				defaults: {
					audit:             "restricted"
					"audit-version":   "latest"
					enforce:           "baseline"
					"enforce-version": "latest"
					warn:              "restricted"
					"warn-version":    "latest"
				}
				exemptions: {
					namespaces: [ "kube-system"]
					runtimeClasses: []
					usernames: []
				}
				kind: "PodSecurityConfiguration"
			}
		},
	]

	auditPolicy: {
		apiVersion: "audit.k8s.io/v1"
		kind:       "Policy"
		rules: [ {
			level: "Metadata"
		}]
	}
}
