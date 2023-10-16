//::///////////////////////////////////////////////
//:: M2Q2ESCJAER7.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to make sure you have the third circle ring and
    you've reached a high enough level
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M2Q2E_RING2");
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

