# import os
# print("Current working directory:", os.getcwd())

from ultralytics import YOLO

# Load a model
# modelv8n = YOLO("yolov8n.pt")  # pretrained YOLOv8n model


# Load a COCO-pretrained YOLO12n model
modelv12n = YOLO("yolo12n.pt")

# Train the model on the COCO8 example dataset for 100 epochs
# results = model.train(data="coco8.yaml", epochs=100, imgsz=640)

# Run inference with the YOLO12n model on the 'bus.jpg' image
# results = model("path/to/bus.jpg")

# Run batched inference on a list of images
image_files = [f"{i}.jpg" for i in range(1, 6)]
results = modelv12n(image_files)  # return a list of Results objects

# Process results list
for idx, result in enumerate(results):
    boxes = result.boxes  # Boxes object for bounding box outputs
    masks = result.masks  # Masks object for segmentation masks outputs
    keypoints = result.keypoints  # Keypoints object for pose outputs
    probs = result.probs  # Probs object for classification outputs
    obb = result.obb  # Oriented boxes object for OBB outputs
    result.show()  # display to screen
    result.save(filename=f"result_{idx}.jpg")  # save to disk