//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6SetGolEnergy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This sets the custom token to the energy level
    of the golem.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    SetCustomToken(660,IntToString(GetLocalInt(OBJECT_SELF,"NW_L_M2Q6GolemEnergy")));
}
