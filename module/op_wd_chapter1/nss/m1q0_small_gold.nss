//:://////////////////////////////////////////////
/*
    Give player between 1 and 10 gold
    Give player small evil adjustment
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Mar 05, 2002
//::Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()

{

    RewardGP(d10(),GetPCSpeaker(),FALSE);

}


