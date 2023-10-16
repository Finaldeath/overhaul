//:://////////////////////////////////////////////
/*
    Give player 400 gold
    Give player small good adjustment
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: April 05, 2002
//::Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()

{

    RewardGP(400,GetPCSpeaker(),FALSE);
    AutoAlignG(DC_EASY, GetPCSpeaker());

}


