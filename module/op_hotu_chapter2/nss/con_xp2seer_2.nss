//::///////////////////////////////////////////////
//:: Name con_xp2seer_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Player has mirror in possession - doesn't matter
what state mind flayer plot is in.
This option can show up multiple times.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oMirror = GetItemPossessedBy(oPC, "q6_mirror");
    if (GetIsObjectValid(oMirror) == TRUE)
    {
        //Set a local object to thward cheaters
        SetLocalObject(OBJECT_SELF, "oMirror", oMirror);
        return TRUE;
    }
    return FALSE;
}
