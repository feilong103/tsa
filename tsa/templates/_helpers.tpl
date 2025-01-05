{{/*
Expand the name of the chart.
*/}}
{{- define "tsa.systemname" -}}
{{- default .Release.Name .Values.global.systemname | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Define namespace
*/}}
{{- define "tsa.namespace" -}}
{{- default .Release.Namespace .Values.global.namespace  | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tsa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tsa.labels" -}}
helm.sh/chart: {{ include "tsa.chart" . }}
{{ include "tsa.systemLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
System labels
*/}}
{{- define "tsa.systemLabels" -}}
app.kubernetes.io/name: {{ include "tsa.systemname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}