# Runbook: Pod CrashLoopBackOff

**Alert:** KubePodCrashLooping | **Severity:** Warning → Page if > 10 min

## Investigate
```bash
kubectl get pods -A | grep CrashLoop
kubectl logs <pod> --previous -n <namespace>
kubectl describe pod <pod> -n <namespace>
```

## Common Causes
| Cause | Signal | Fix |
|---|---|---|
| OOMKilled | `reason: OOMKilled` | Increase memory limits |
| Bad config | `env var not found` | Check Vault / ConfigMap |
| Failing probe | `Readiness probe failed` | Adjust probe thresholds |
