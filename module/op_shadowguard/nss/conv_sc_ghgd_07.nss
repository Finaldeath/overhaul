// Checks to see if guard is guarding door to Council Chambers
// in Ghaarak's Imperial Grand Hall
// Should NEVER return TRUE

int StartingConditional()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    if (GetTag(oDoor) == "DOOR_GHAA_COUN_CHAM")
        SetLocalInt(OBJECT_SELF, "N_TALK_SWITCH", 1);


    return FALSE;
}
