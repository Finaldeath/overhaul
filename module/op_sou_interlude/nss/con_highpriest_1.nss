//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is believed to be Ao.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(GetLocalInt(GetPCSpeaker(),"X1_PCISGOD")==10)
        return TRUE;
    return FALSE;
}
