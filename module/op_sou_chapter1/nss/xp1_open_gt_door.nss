//Opens Gretti's door (for PCs on the other side of the bridge)

void main()
{

 object oDoor=GetObjectByTag("GrettisBridgeDoor");

 ActionUnlockObject(oDoor);

 ActionOpenDoor(oDoor);
}
