//::///////////////////////////////////////////////
//:: M4_NURSECONV2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the dice roll and then sets conversation.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRand=GetLocalInt(OBJECT_SELF,"NW_NURSECONV");
    if(nRand==2)
    {
        return TRUE;
    }
    return FALSE;
}
