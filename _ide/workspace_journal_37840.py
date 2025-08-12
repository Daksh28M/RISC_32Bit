# 2025-08-10T19:50:47.310783400
import vitis

client = vitis.create_client()
client.set_workspace(path="RISC_32Bit")

vitis.dispose()

