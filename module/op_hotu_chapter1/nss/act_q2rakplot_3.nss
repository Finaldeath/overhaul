//::///////////////////////////////////////////////
//:: act_q2rakplot_3
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the Global Rakshasa variable to 99 - the Rakshasa will transform
     whenever conversation is aborted at this point
     Set a variable used in Henchmen conversations
    for what the PC knows about the false Linu
    and the Rakshasa

    X2_PCKnowsRakshasa
    0   PC knows nothing
    1   PC has met Linu in the Rakshasa area - doesn't know she's a fake
    2   PC knows that Linu was a fake
    3   PC has found the real Linu
*/

//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 26, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"RakshasaChanged",99);
    SetLocalInt(GetModule(), "X2_PCKnowsRakshasa", 3);
}
