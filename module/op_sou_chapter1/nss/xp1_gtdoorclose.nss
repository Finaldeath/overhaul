//causes Gretti to close and lock his bridge door after a player has crossed it.

void main()
{

    object oRumgut=GetObjectByTag("Gretti");
    object oDoor=GetObjectByTag("GrettisBridgeDoor");
    location lPost=GetLocation(GetObjectByTag("POST_Gretti"));

    if(GetIsOpen(oDoor))
    {
        AssignCommand(oRumgut, ActionCloseDoor(oDoor));
        AssignCommand(oRumgut, ActionDoCommand(ActionMoveToLocation(lPost)));
    }

}
