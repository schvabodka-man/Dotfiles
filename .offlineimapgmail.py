import subprocess

def mailpasswd(account):
    return subprocess.check_output(["pass", account]).strip()
