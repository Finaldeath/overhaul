//:://////////////////////////////////////////////
/*
    Give player between 40 and 60 gold
    Give player small evil adjustment
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Mar 01, 2002
//::Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()

{

    RewardGP(40+Random(21),GetPCSpeaker(),FALSE);
    AutoAlignE(DC_EASY, GetPCSpeaker());

}

