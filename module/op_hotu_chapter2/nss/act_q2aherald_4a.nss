//::///////////////////////////////////////////////
//:: Name act_q2aherald_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 1 is over - jump the herald and the PC
    to the City Core for Battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////
void JumpPCToBattle2();
void main()
{
    object oPC = GetPCSpeaker();


    //Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 0);

    SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);


    SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);

}
