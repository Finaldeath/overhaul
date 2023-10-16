//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is Cleric and has not made a god choice.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: August 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLevelByClass(CLASS_TYPE_CLERIC, GetFirstPC()) > 0
        && GetLocalInt(GetFirstPC(),"os_pcbelieves")==0)
        return TRUE;
    return FALSE;
}
