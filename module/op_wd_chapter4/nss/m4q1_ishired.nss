//::///////////////////////////////////////////////
//:: M4Q1_ISHIRED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if Vanya is hired yet
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if(GetLocalInt(OBJECT_SELF,"NW_L_HIRED")==10 && GetLocalObject(OBJECT_SELF,"NW_L_HIREDBY")!=oPC)
    {
        return TRUE;
    }
    return FALSE;

}
