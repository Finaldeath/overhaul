//:://////////////////////////////////////////////
/*
    Give player 400 gold
    set local so reward not given twice
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: April 09, 2002
//::Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()

{

    RewardGP(400,GetPCSpeaker(),FALSE);
    SetLocalInt(OBJECT_SELF,"LGoldGiven",GetLocalInt(OBJECT_SELF,"LItemsReturned") + 1);

}



