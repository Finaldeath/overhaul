//::///////////////////////////////////////////////
//:: M4_NURSECONV3
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
    if(nRand==3)
    {
        return TRUE;
    }
    return FALSE;
}
