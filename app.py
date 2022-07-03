import cv2
import numpy as np
from fastapi import FastAPI, Response, UploadFile
from starlette.responses import RedirectResponse

app = FastAPI()

@app.get("/")
def redirect():
    return RedirectResponse(url="/docs")

@app.get("/ping")
def pong():
    return "pong"

@app.post("/image-flip")
async def flip_image(file: UploadFile):
    im_bytes = await file.read()
    im_bytes = np.asarray(bytearray(im_bytes), dtype=np.uint8)
    original_image = cv2.imdecode(im_bytes, cv2.IMREAD_COLOR)
    flipped_image = cv2.flip(original_image, 0)
    _, flipped_image = cv2.imencode(".png", flipped_image)
    flipped_bytes = flipped_image.tobytes()
    return Response(flipped_bytes, media_type="image/png")
