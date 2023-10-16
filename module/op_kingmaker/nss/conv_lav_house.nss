//::///////////////////////////////////////////////
//:: conv_lav_house.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player owns the Haunted
    House but has not yet resolved its plot.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iOwnHouse = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD");
    if (iOwnHouse == 20)
    {
        return TRUE;
    }
    return FALSE;
}
