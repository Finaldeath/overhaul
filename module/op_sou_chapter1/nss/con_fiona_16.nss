//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Fiona was asked about promissary
     note by PC before, and if PC has the note.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 17, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"q3_promissary"))==TRUE
        && GetLocalInt(GetModule(),"XP1_Q1FIONANOTE")==0)
        return TRUE;
    return FALSE;
}
