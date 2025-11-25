import subprocess

EXE = r"C:/Program Files/Veyon/veyon-cli.exe"
ip = ""

def run(cmd):
    subprocess.run(f"{EXE} {cmd}")

while True:
    command = input("$ ").strip().lower()

    if command == "exit":
        break
    if command == "":
        continue

    if command == "search":
        run("networkobjects list")

    elif command == "setip":
        ip = input("ip $ ")

    elif command == "disable":
        run("service stop")
        run("service unregister")
        for f in ("MonitoringMode", "RemoteControl", "RemoteView", "Lock"):
            run(f"feature stop 127.0.0.1 {f}")

    elif command in ("control", "view"):
        if not ip:
            print("No target.")
        else:
            run(f"remoteaccess {command} {ip}")

    else:
        print("Invalid command.")
