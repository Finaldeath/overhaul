//::///////////////////////////////////////////////
//:: M4Q1_IFHIREDBYPC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if Vanya is hired, and by the
    person speaking to them.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC=GetPCSpeaker();
    if(GetLocalInt(OBJECT_SELF,"NW_L_HIRED")==10 && GetLocalObject(OBJECT_SELF,"NW_L_HIREDBY")==oPC)
    {
        return TRUE;
    }
    return FALSE;
}
