//::///////////////////////////////////////////////
//:: M4_STOPINIT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Sets that you've spoken with the player before, so you won't initiate again.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (from Aidan)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_Init_" + GetTag(OBJECT_SELF),TRUE);
}
