//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5_farmson001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the local on the PC once talked to.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_FarmsonInfo",10);
}
