from fastapi import FastAPI
from recomsystem import get_recommendations_new
app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/items/{item_id}")
async def read_item(item_id:int):
    return {"item_id": item_id}

@app.get("/items/{show_name}")
async def read_item(show_name:str):
    pdsr=get_recommendations_new(show_name)
    lst=list(pdsr.values)
    return lst