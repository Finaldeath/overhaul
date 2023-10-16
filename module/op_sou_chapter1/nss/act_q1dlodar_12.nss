//::///////////////////////////////////////////////
//:: Name  act_q1dlodar_12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Lodar spoken to variable on pc speaker
        for lodars conversation
        and also that lodar dislikes the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

void main()
{
    //1 indicates spoken to normally - 2 indicates spoken to and
    //lodar doesn't like the PC
    SetLocalInt(GetPCSpeaker(), "nSpokeToLodar", 2);
}
