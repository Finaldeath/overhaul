int StartingConditional()
{
    string sTag = "DOOR_ST_0_NC_LAIR_01";

    object o = GetNearestObject(OBJECT_TYPE_DOOR);

    if (GetTag(OBJECT_SELF) != "CT_COMM_PH_DOORMAN01")
        return FALSE;

    if (GetIsOpen(o))
        return FALSE;

    if (GetTag(o) != sTag)
        return FALSE;

    return TRUE;
}
