// has a healing kit

int StartingConditional()
{
    object oKit = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT001");
    if(oKit == OBJECT_INVALID)
        oKit = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT002");
    if(oKit == OBJECT_INVALID)
        oKit = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT003");
    if(oKit == OBJECT_INVALID)
        oKit = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT004");
    SetLocalObject(OBJECT_SELF, "Q5B_KIT", oKit);
    return oKit != OBJECT_INVALID;
}
