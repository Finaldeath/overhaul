//::///////////////////////////////////////////////
//:: M4Q1_ISNOTHIRED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to make sure Vanya hasn't been hired.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
 // * only returns true if Vanya is not hired
 // * and Player has spoken to trancar
 // * and he has offered Vanya's services
    if (GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALK_TRANCAR") == 3)
    if(GetLocalInt(OBJECT_SELF,"NW_L_HIRED")!=10)
    {
        return TRUE;
    }
    return FALSE;
}
