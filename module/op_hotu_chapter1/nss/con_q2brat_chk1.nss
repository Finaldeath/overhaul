//::///////////////////////////////////////////////
//:: Name con_q2brat_chk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC is a Druid or a Ranger then the Rat
    can converse with him
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Dec 10/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) > 0 || GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
