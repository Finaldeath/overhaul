//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Garrick is healed.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_GARRICKSPEAK")==20)
        return TRUE;
    return FALSE;
}
