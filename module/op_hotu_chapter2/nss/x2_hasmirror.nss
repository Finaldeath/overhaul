///Checks if PC has magic mirror from Queen of the Shattered Mirror

int StartingConditional()
{

    object oPC = GetPCSpeaker();

    object oMirror = GetItemPossessedBy(oPC,"q6_mirror");
    if (GetIsObjectValid(oMirror) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oMirror", oMirror);
        return TRUE;
    }
    return FALSE;
}
