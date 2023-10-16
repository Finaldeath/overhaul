//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Fiona was extorted by PC before and
     Glendir died and PC refused to pay her back.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_FIONAHATESPC")==1
        && GetLocalInt(GetModule(),"q3_Glendir_Told")==0)
        return TRUE;
    return FALSE;
}
