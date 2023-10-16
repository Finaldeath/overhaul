int StartingConditional()
{
    string sTag = "DOOR_ST_0_NC_LAIR_02";
    object o = GetNearestObject(OBJECT_TYPE_DOOR);

    if (GetTag(OBJECT_SELF) != "CT_COMM_PH_DOORMAN02")
        return FALSE;

    if (GetTag(o) != sTag)
        return FALSE;

    if (GetIsOpen(o))
        return FALSE;

    return TRUE;
}
