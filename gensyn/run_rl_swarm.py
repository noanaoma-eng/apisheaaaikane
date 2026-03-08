# gensyn placeholder worker
import os
import time
import random
GENSYN_INTERVAL = int(os.environ.get("GENSYN_INTERVAL", "60"))
WALLET = os.environ.get("WALLET_ADDRESS", "unset")
print(f"GENSYN worker starting. WALLET={WALLET}. interval={GENSYN_INTERVAL}s")
try:
    while True:
        # simulate work and occasional "reward" message
        work_time = random.randint(5, 15)
        print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Gensyn: simulating work for {work_time}s")
        time.sleep(work_time)
        if random.random() < 0.15:
            print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Gensyn: simulated reward event")
        time.sleep(GENSYN_INTERVAL)
except KeyboardInterrupt:
    print("GENSYN worker stopping")
