object DoorAreaTransition(object oDoor)
{
    int nModStage = (GetLocalInt(GetModule(), "N_MODULE_STAGE"));
    string sModStage = IntToString(nModStage);

    string sDestDoor = GetSubString(GetTag(oDoor), 5, 4);;

    string sDoorStage = GetSubString(GetTag(oDoor), 9, 1);

    if (sDoorStage == "0")
        sDestDoor += "1_";

    else
        sDestDoor += "0_";

    object oDoor = GetObjectByTag("DOOR_" + sDestDoor + sModStage);

    while (oDoor == OBJECT_INVALID && nModStage >= 0)
    {
        nModStage--;
        sModStage = IntToString(nModStage);

        oDoor = GetObjectByTag("DOOR_" + sDestDoor + sModStage);
    }

    return oDoor;
}

void ShutDoor(object oDoor)
{
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
}

void OpenDoor(object oDoor)
{
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}

void UnlockDoor(object oDoor)
{
    SetLocked(oDoor, FALSE);
}

void LockDoor(object oDoor)
{
    SetLocked(oDoor, TRUE);
}
