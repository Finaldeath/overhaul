//::///////////////////////////////////////////////
//:: M2Q2ESCJAER6.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks to see if the player has the second circle ring
   and if he is a high enough level to challenge.
*/
//:://////////////////////////////////////////////
//:: Created By:  Dan
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M2Q2E_RING3");
    if(GetIsObjectValid(oItem))
    {
        if(GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker())>=7)
        {
            SetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWEAK",FALSE);
            return TRUE;
        }
        else
        {
            SetLocalInt(GetPCSpeaker(), "NW_M2Q2E_LWEAK",TRUE);
        }
    }
    return FALSE;
}
