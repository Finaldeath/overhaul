//::///////////////////////////////////////////////
//:: M2Q2ESCJAER8.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if you'd passed the fourth circle
    and if your level is high enough to test for the next.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M2Q2E_RING1");
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
