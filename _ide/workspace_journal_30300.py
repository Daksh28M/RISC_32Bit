# 2025-08-10T18:24:50.977158
import vitis

client = vitis.create_client()
client.set_workspace(path="RISC_32Bit")

vitis.dispose()

