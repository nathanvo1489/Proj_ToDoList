# Proj_ToDoList: MERN
Project To-Do-List

## Network Connections

Docker Compose publishes each service using `HOST_PORT:CONTAINER_PORT`. The first port is used from the host machine; containers communicate with one another over the Compose network.

```
flowchart LR
	Browser[Browser] -->|localhost:3001| Frontend[Frontend container :80] 
// Compose forwards host port `3001` to the frontend container's Nginx port 80

	Browser -->|localhost:8000/api| Backend[Backend container :8001]
// Axios uses this base URL. Compose forwards host port `8000` to backend port `8001`, where ExpressJS listens

	Backend -->|mongodb:27017| Mongo[MongoDB container :27017]
// The backend uses the Compose service name `mongodb` and MongoDB's container port `27017`

	HostTool[Host database tool] -->|localhost:27017| Mongo
// Compose publishes MongoDB port `27017` for tools running on the host, such as MongoDB Compass
```

The frontend Axios requests run in the browser and use the host-published backend address `localhost:8000`.

The API routes are mounted under `/api`: `/api/user`, `/api/task`, and `/api/forgotPassword`.


