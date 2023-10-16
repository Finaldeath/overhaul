//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has met Glendir.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 21, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
   if (GetLocalInt(GetPCSpeaker(), "q3_Know_Smith")==1
    && GetLocalInt(GetPCSpeaker(), "q3_Talked_To_Glendir") > 0
    && GetLocalInt(GetPCSpeaker(), "q3_ToldSmithOfGlendir") != 1
    && GetLocalInt(GetModule(),"q3_Glendir_Safe")<1)
        return TRUE;
   return FALSE;
}
